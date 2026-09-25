# Design: add-estado-rejeitada

## Context
Anexo-first com gate `tcc-00` como único escritor GitHub. Domínio Estado atual: `pendente | criada #N | falha | reincidente | fechada confirmada | reaberta | n/a`. Falta estado para descartar sem criar issue.

## Decision
- Adicionar `rejeitada` ao enum de Estado em todos os lugares: `contrato-e-decisoes.md`, `anexo-acompanhamento.md`, `tcc-00-sync-issues`, skills templates, specs.
- `tcc-00` filtra `rejeitada`/`n/a` (ignora). Se rejeitada tem issue preexistente, fecha.
- `rejeitada -> pendente` recria issue (idempotência via `gh issue list` search).
- `tcc-06` checklist separa rejeitadas.

## Alternatives
- Label wontfix: rejeitada pois exige criar issue para fechar.
- Sub-tabela: perde numeração contínua.

## Risks
- Rejeitar prio-alta sem justificativa: aceito, histórico preserva linha.

## Changes
- `_shared/contrato-e-decisoes.md`, `_shared/anexo-acompanhamento.md`, `tcc-00-sync-issues/SKILL.md`, `tcc-06-revisao-final/SKILL.md` (e se necessário tcc-04/05 templates)
- Validado por `openspec validate --change add-estado-rejeitada --strict`
