## Why

Orientadores de TCC atendem múltiplos alunos em fases distintas do trabalho (concepção, escrita, fundamentação, cronograma, defesa) sem ferramenta que estruture o acompanhamento ou registre o histórico das orientações. Cada rodada de feedback exige releitura manual do texto, e não há memória consistente do que foi combinado. Uma família de skills LLM padroniza a análise, o feedback e o registro das decisões, liberando o orientador para o trabalho de julgamento em vez de preparação.

## What Changes

- Criação de uma família de skills `tcc-XX-<nome>` (7 skills numeradas por ordem de ciclo de vida) que guiam o orientador em cada fase do TCC.
- **Somente leitura** do texto do aluno (arquivos `.md`/`.typ`): nenhuma skill edita o TCC.
- **Anexo de Acompanhamento** como única área gravável — capítulo temporário não normativo que registra marcos, histórico de orientações, pendências e feedbacks.
- Saída de análise estruturada em tabela: localização / citação do aluno / diagnóstico / sugestão ao orientador / prioridade.
- O `analise.md` (rubrica de fundamentação teórica) vira o critério de diagnóstico da skill `tcc-04-fundamentacao`.
- `tcc-03-cronograma` deriva marcos por retroplanning a partir da data de defesa, com datas revisáveis e registro das revisões.
- `tcc-06-revisao-final` verifica estrutura ABNT, citações×referências, consistência entre capítulos e formatação — mas **não** remove o anexo; apenas aponta a remoção.

## Capabilities

### New Capabilities
- `tcc-orientacao-concepcao`: lapidação da ideia, definição de escopo, perguntas de pesquisa e sugestão de pesquisas na fase inicial do TCC.
- `tcc-orientacao-estrutura`: geração e revisão do esqueleto do documento segundo normas ABNT.
- `tcc-orientacao-cronograma`: criação e manutenção de cronograma com marcos temporais derivados da data de defesa e datas revisáveis.
- `tcc-orientacao-fundamentacao`: análise da fundamentação teórica usando os critérios do `analise.md` (abrangência, coerência, escopo, contradições, base para metodologia).
- `tcc-orientacao-acompanhamento`: feedback do texto do aluno em loop, atualizando pendências e histórico no anexo de acompanhamento.
- `tcc-orientacao-revisao-final`: checklist final de entrega (estrutura ABNT, citações, consistência, formatação) e verificação da remoção do anexo.
- `tcc-orientacao-apresentacao`: preparação da apresentação e simulação de banca de defesa.

### Modified Capabilities
<!-- Nenhuma capability existente é modificada. -->

## Impact

- `.opencode/skills/`: criação de 7 diretórios de skill + diretório `_shared` com artefatos comuns (modelo do anexo de acompanhamento, normas ABNT, rubrica do `analise.md`).
- `analise.md`: reutilizado como fonte da rubrica de fundamentação (pode ser copiado/transformado para `_shared/`).
- Nenhuma alteração no código do TCC do aluno — skills operam em modo somente leitura sobre os arquivos de texto.
- Sem novas dependências externas; depende apenas do sistema de skills do opencode.