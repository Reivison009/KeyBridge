# Guia de uso — KeyBridge Studio

Este guia descreve os recursos encontrados nos arquivos do **KeyBridge Studio 9.0**.

## 1. Primeira execução

1. Abra o executável `KeyBridge.exe` obtido de uma publicação oficial.
2. Na primeira execução, escolha uma pasta para os recursos do aplicativo, quando solicitado.
3. Caso a janela não abra, confirme a instalação do **Microsoft Edge WebView2 Runtime**.
4. Para utilizar o controle virtual, verifique a presença do driver **ViGEmBus** na seção **Ferramentas**.

> O programa usa o WebView2 para exibir uma janela própria, sem precisar abrir uma aba no navegador.

## 2. Iniciar o controle

Na página **Visão geral**, use **Iniciar controle**. Para finalizar a emulação, use **Parar controle**. O painel inclui monitoramento e registros de atividade.

## 3. Configurar o mapeamento

Abra **Mapeamento → Editor de mapeamento** para ajustar os comandos. A configuração inicial incluída no projeto é:

| Tecla | Função | Tecla | Função |
| --- | --- | --- | --- |
| W | Analógico esquerdo para cima | S | Analógico esquerdo para baixo |
| A | Analógico esquerdo para esquerda | D | Analógico esquerdo para direita |
| J | Botão A | K | Botão B |
| L | Botão X | U | Botão Y |
| Shift | LB | Enter | RB |
| Q | LT | E | RT |
| Espaço | START | Backspace | BACK |

Depois das alterações, utilize **Salvar mapeamento**. O editor oferece também **Recarregar**, **Restaurar padrão** e **Abrir no Bloco de Notas**.

> Essas são as teclas *iniciais do arquivo de configuração enviado*, e podem variar conforme o perfil carregado.

## 4. Perfis por jogo

Na seção **Perfis**, existem controles para **Trocar perfil**, **Carregar perfil** e **Criar perfil**. Crie configurações diferentes para jogos e teste cada perfil antes de jogar.

## 5. Ferramentas e diagnóstico

Em **Ferramentas**:

- **Executar diagnóstico**: investiga o estado do aplicativo.
- **Instalar driver**: inicia o procedimento de instalação do ViGEmBus.
- **Testar botão A**: aciona um teste curto do controle virtual.
- **Abrir log**: facilita a análise de problemas.
- **Encerrar KeyBridge**: fecha o aplicativo.

## Solução de problemas

| Problema | O que verificar |
| --- | --- |
| A janela não aparece | WebView2 Runtime instalado e arquivos extraídos corretamente |
| O jogo não detecta o controle | Driver ViGEmBus, estado do controle e compatibilidade com o jogo |
| Uma tecla não funciona como esperado | Mapeamento salvo e perfil atualmente selecionado |
| O aplicativo mostra um erro | Execute o diagnóstico e anexe o log ao relato, removendo informações pessoais |

[Voltar ao README](../README.md) · [Relatar problema](https://github.com/Reivison009/KeyBridge/issues/new/choose)
