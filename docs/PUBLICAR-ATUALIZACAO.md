# Como publicar uma versão

Distribua o executável pelo **GitHub Releases**, e não como ZIP na raiz do repositório.

1. Compile o projeto e teste o `KeyBridge.exe` em Windows.
2. Acesse [New release](https://github.com/Reivison009/KeyBridge/releases/new).
3. Crie uma tag, por exemplo, `v1.0.0` ou `v1.1.0`.
4. Informe as mudanças, correções e requisitos.
5. Anexe o arquivo **`KeyBridge.exe`** diretamente na seção **Assets**.
6. Publique. O link de referência será [Releases/latest](https://github.com/Reivison009/KeyBridge/releases/latest).

## Verificação de integridade

No PowerShell, dentro da pasta do executável:

```powershell
Get-FileHash .\KeyBridge.exe -Algorithm SHA256
```

Publique o hash no texto da release, permitindo que outras pessoas confirmem a integridade do arquivo baixado.

## Atualizações futuras

A API de versão mais recente é:

```text
https://api.github.com/repos/Reivison009/KeyBridge/releases/latest
```

O programa precisará ler a tag de versão e localizar o EXE nos assets. **Essa verificação ainda não foi confirmada no código enviado.** Não confunda disponibilizar a API com ter atualização automática implementada.

[Voltar ao README](../README.md)
