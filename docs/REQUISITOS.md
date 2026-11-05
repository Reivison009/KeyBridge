# Requisitos e dependências

## Para executar

- **Sistema operacional:** Windows. A compatibilidade com versões específicas precisa ser validada durante os testes.
- **Microsoft Edge WebView2 Runtime:** componente necessário para renderizar a interface HTML na janela nativa.
- **ViGEmBus:** driver necessário para a emulação de controle compatível.
- **Arquitetura:** a distribuição incluída no pacote analisado usa uma DLL `ViGEmClient.dll` de 64 bits.

O executável inclui a interface HTML/CSS/JavaScript e os componentes utilizados pelo instalador interno, mas a instalação do driver e a presença do WebView2 Runtime podem ser necessárias.

**Downloads seguros:** procure o WebView2 Runtime no site oficial da Microsoft. Para o driver ViGEmBus, utilize a página de releases do projeto original indicada pelo aplicativo; confirme a origem antes de instalar.

## Para compilar o projeto enviado

A compilação descrita no arquivo `build.bat` requer:

1. Windows com **MinGW-w64 x64**, incluindo `gcc`, `g++` e `windres` no PATH.
2. PowerShell para executar `baixar-webview2-sdk.ps1`.
3. O código-fonte completo do motor em `engine/src/`, a interface em `ui/`, os recursos em `engine/resources/` e a biblioteca `engine/runtime/ViGEmClient.dll`.
4. Execute `build.bat` na raiz do projeto. O resultado esperado é `dist/KeyBridge.exe`.

> O SDK do WebView2 tem dezenas de arquivos e é baixado sob demanda pelo script de compilação; não é necessário versionar a pasta `sdk/` no Git.

## Sobre testes

O conteúdo foi analisado a partir dos arquivos fornecidos. A compilação e o funcionamento do EXE em uma máquina Windows ainda precisam de validação prática antes de anunciar compatibilidade ou estabilidade.
