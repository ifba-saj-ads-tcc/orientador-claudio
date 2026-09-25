## Context

Ver proposal.md — Why. Hoje `tcc-*` grava `fechada confirmada` direto ou mantém `criada #N`, sem buffer visível de "skill verificou". `tcc-00` pergunta interativamente antes de fechar.

## Goals / Non-Goals

**Goals:** Tabela mostra antes do sync o que skill já validou (`corrigida aguardando validacao`); manter estado no `tcc-00` = concordância implícita (sem prompt extra).
**Non-Goals:** Mudar colunas da tabela ou fluxo GitHub além do fechamento condicional; reescrever histórico.

## Decisions

- **Novo estado `corrigida aguardando validacao`** (nome em minúsculas sem acento para compatibilidade com `contrato-e-decisoes.md`) — já cogitado como `verificada — aguardando sync`; escolhido por ser explícito e pesquisável. Alternativa `resolvida a validar` descartada por colidir com `reincidente`.
- **Skill grava, tcc-00 promove** — `tcc-04/05/06` passam a escrever `corrigida aguardando validacao` quando reavaliação passa; `tcc-00` promove para `fechada confirmada` + `gh issue close` se estado mantido. Alternativa "tcc-00 perguntar sempre" descartada — viola "manter = concordar".
- **Sem migração de dados** — estados antigos (`fechada confirmada`) permanecem válidos; só novas reavaliações usam o novo estado.

## Risks / Trade-offs

- [Skill falso-positivo marca corrigida] → Mitigação: orientador altera estado para `reaberta`/`criada` antes do sync; `tcc-00` reabre.
- [Nome longo na tabela] → Aceito; coluna `Estado` já comporta `fechada confirmada` (similar).
- [Compatibilidade com `gh` state] → `corrigida aguardando validacao` ainda corresponde a issue `open` no GitHub até promoção.

## Migration Plan

1. Aplicar deltas de spec; 2. editar `contrato-e-decisoes.md`, `tcc-00` e `tcc-04/05/06`; 3. `openspec validate --changes --strict`; 4. próximo `tcc-06` já grava novo estado para #17.

## Open Questions

- Nenhuma.
