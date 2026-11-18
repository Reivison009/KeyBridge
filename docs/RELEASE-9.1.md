# Preparação do KeyBridge Studio 9.1

**Status: publicação pendente.** Este documento não é uma release.

## Arquivos recebidos e verificados

| Arquivo | Arquitetura PE | SHA-256 |
| --- | --- | --- |
| `KeyBridge-x64.exe` | PE32+, x86-64 | `60442052136775ef7f4729ac8353ea86803b49a1bfa3c0afdb728a5fdadfdf8c` |
| `KeyBridge-x86.exe` | PE32, Intel i386 | `63c3763741a223dd8b0392d153b95981aa19c82b7f664e10717ab51e075908e9` |

Esses hashes foram calculados dos arquivos enviados pelo desenvolvedor em 18/11/2026. **Não equivalem a uma auditoria de segurança ou teste de execução.**

## Capturas de tela recebidas

- Painel principal
- Mapeamento
- Perfis
- Ferramentas

As imagens ainda precisam ser enviadas à pasta `assets/screenshots/`.

## Passos para publicar

1. Testar ambos os executáveis em ambientes Windows adequados.
2. Verificar as dependências e permissões necessárias.
3. Abrir [GitHub Releases](https://github.com/Reivison009/KeyBridge/releases/new).
4. Criar uma tag nova, como `v9.1.0`, com título `KeyBridge Studio 9.1`.
5. Anexar **os dois arquivos originais**, sem renomear ou modificar seu conteúdo.
6. Incluir notas de versão e informar que o driver ViGEmBus pode ser necessário.
7. Publicar somente após conferir os downloads.

## Notas sugeridas

**KeyBridge Studio 9.1**

- Interface organizada em Visão geral, Mapeamento, Perfis e Ferramentas.
- Configuração de teclas em JSON.
- Perfis separados por jogo.
- Monitoramento de entradas e diagnóstico do controle virtual.
- Downloads separados para Windows x64 e x86.

**Atenção:** a compatibilidade depende das dependências instaladas e do suporte do jogo a controles virtuais.
