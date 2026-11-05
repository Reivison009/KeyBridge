# Publica os arquivos do projeto KeyBridge sem enviar o ZIP ou o SDK inteiro.
# Requer: Git instalado e autenticado com uma conta autorizada no repositorio.
param(
    [Parameter(Mandatory = $true)]
    [string]$ZipPath
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path -LiteralPath $ZipPath -PathType Leaf)) {
    throw "Arquivo ZIP nao encontrado: $ZipPath"
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "O Git nao esta instalado ou nao esta no PATH."
}

$tempFolder = Join-Path ([System.IO.Path]::GetTempPath()) ("keybridge-github-" + [guid]::NewGuid().ToString('N'))
$extracted = Join-Path $tempFolder 'extraido'
$clone = Join-Path $tempFolder 'repositorio'
$repoUrl = 'https://github.com/Reivison009/KeyBridge.git'

$sourceItems = @(
    'engine/src',
    'engine/resources',
    'engine/runtime/config.json',
    'engine/runtime/ViGEmClient.dll',
    'ui',
    'build.bat',
    'baixar-webview2-sdk.ps1'
)

try {
    New-Item -ItemType Directory -Force -Path $extracted | Out-Null
    Write-Host '[1/4] Extraindo os arquivos em uma pasta temporaria...'
    Expand-Archive -LiteralPath $ZipPath -DestinationPath $extracted -Force

    Write-Host '[2/4] Clonando o repositorio GitHub...'
    & git clone $repoUrl $clone
    if ($LASTEXITCODE -ne 0) { throw 'Falha ao clonar. Verifique sua conexao e autenticacao.' }

    Write-Host '[3/4] Copiando somente os arquivos necessarios do projeto...'
    foreach ($relative in $sourceItems) {
        $relativeWindows = $relative.Replace('/', [IO.Path]::DirectorySeparatorChar)
        $source = Join-Path $extracted $relativeWindows
        if (-not (Test-Path -LiteralPath $source)) {
            throw "Arquivo necessario nao encontrado no ZIP: $relative"
        }
        $target = Join-Path $clone $relativeWindows
        $parent = Split-Path -Path $target -Parent
        New-Item -ItemType Directory -Force -Path $parent | Out-Null
        Copy-Item -LiteralPath $source -Destination $target -Recurse -Force
    }

    Push-Location $clone
    try {
        & git add -- engine/src engine/resources engine/runtime/config.json engine/runtime/ViGEmClient.dll ui build.bat baixar-webview2-sdk.ps1
        if ($LASTEXITCODE -ne 0) { throw 'Falha ao preparar arquivos para o commit.' }

        $pending = & git diff --cached --name-only
        if ($LASTEXITCODE -ne 0) { throw 'Falha ao conferir o commit.' }
        if (-not $pending) {
            Write-Host 'Nenhum arquivo alterado. O repositorio ja esta atualizado.'
            exit 0
        }

        & git commit -m 'feat: publicar codigo-fonte do KeyBridge Studio'
        if ($LASTEXITCODE -ne 0) { throw 'Falha no commit. Configure seu nome e e-mail no Git.' }

        Write-Host '[4/4] Publicando arquivos separados no GitHub...'
        & git push origin HEAD:main
        if ($LASTEXITCODE -ne 0) { throw 'Falha ao publicar no GitHub. Confira sua permissao e autenticacao.' }

        Write-Host 'Concluido! Os fontes foram enviados sem ZIP, SDK ou arquivos de build.'
    }
    finally {
        Pop-Location
    }
}
finally {
    if (Test-Path -LiteralPath $tempFolder) {
        Remove-Item -LiteralPath $tempFolder -Recurse -Force -ErrorAction SilentlyContinue
    }
}
