## Why

Os feedbacks produzidos pelas skills `tcc-*` referenciam pendências e trechos do texto do aluno, mas não possuem um identificador estável. Isso dificulta rastrear uma pendência ao longo das rodadas: o orientador não consegue confirmar se um apontamento foi resolvido, reincidiu ou é novo. O repo do TCC é privado e o GitHub já está integrado (`gh` autenticado), o que permite usar **issues** como mecanismo natural de rastreabilidade. Como o orientador também precisa ler o estado do acompanhamento **offline**, o Anexo de Acompanhamento passa a conter um **espelho** das issues.

## What Changes

- Tratar cada feedback como uma **issue no repo privado** do TCC; o **número da issue** é o código de rastreabilidade (estável e único).
- Ciclo de vida das pendências = estado da issue: **open** (nova/pendente), **closed** (resolvida), **reopened** (reincidente).
- As "siglas" dos códigos viram **labels** do GitHub, combináveis: domínio, tipo, prioridade e categoria procedural.
- O Anexo de Acompanhamento ganha a seção **Espelho de issues** para leitura offline, **substituindo** a tabela manual de pendências.
- Sincronização do espelho por **dois mecanismos**: (1) cada skill refresca o espelho ao rodar, via `gh`; (2) um **GitHub Action** regenera o espelho em eventos de issues.
- Reframe do contrato: **issues + espelho do anexo** passam a ser a "área gravável"; o TCC continua somente leitura.

## Capabilities

### New Capabilities
- `feedback-traceability`: Cada feedback vira uma issue no repo; o número da issue é o identificador estável; o ciclo de vida (open/closed/reopened) representa nova/resolvida/reincidente; labels codificam domínio, tipo, prioridade e categoria procedural.
- `issue-mirror-offline`: Espelho das issues dentro do Anexo de Acompanhamento para leitura offline, sincronizado por rodada (skill) e via GitHub Action.

### Modified Capabilities
- `tcc-orientacao-acompanhamento`: A skill passa a criar/reutilizar issues e a atualizar o espelho do anexo em cada rodada.
- `tcc-orientacao-fundamentacao`: Os achados passam a virar issues e o espelho é atualizado.
- `tcc-orientacao-revisao-final`: O checklist referencia as issues e a remoção do anexo vira uma issue procedural (`entregavel`).
- `tcc-orientacao-apresentacao`: Itens e pendências da preparação viram issues e o espelho é atualizado.

## Impact

- Repo privado GitHub `ifba-saj-ads-tcc/tcc-Pedro-Victor-Hipolito-Cabral`; `gh` CLI autenticado.
- Skills afetadas: `tcc-05-acompanhamento`, `tcc-04-fundamentacao`, `tcc-06-revisao-final`, `tcc-07-apresentacao`.
- Documento compartilhado `_shared/contrato-e-decisoes.md` (issues como fonte de verdade, taxonomia de labels, formato do espelho).
- Modelo do anexo `_shared/anexo-acompanhamento.md` (nova seção Espelho de issues substituindo Pendências).
- Novo **GitHub Action** de sincronização do espelho.
- Sem impacto em dependências externas além do GitHub já integrado.