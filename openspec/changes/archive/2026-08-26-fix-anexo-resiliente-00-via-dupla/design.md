## Context

Hoje `tcc-04/05` criam issues direto via `gh --repo <aluno>` e depois atualizam o anexo como espelho. Quando `gh` falha (sem auth, labels inexistentes, encoding), o anexo fica com placeholder `— | a criar` (caso LEANDRO) e perde Localização/Citação/Diagnóstico/Sugestão — vide `acompanhamento/LEANDRO-DA-SILVA-SANTOS.md:31` vs `D:\IFBA\20261_TCC\tcc-Pedro-Victor-Hipolito-Cabral\anexo-acompanhamento.md:33-52` (18 issues ricas). Só `04/05` geram issues; `01/02/03/06/07` não. `tcc-00-sync-issues` hoje só faz GitHub → Anexo (SKILL.md:8 "GitHub é fonte de verdade").

## Goals / Non-Goals

**Goals:**
- Anexo-first resiliente: nenhuma falha de `gh` apaga contexto; toda pendência tem replay.
- Gate único `tcc-00` para criação de issues; filtro "só pendência que aluno deve resolver".
- Tabela rica transversal a todas as skills `tcc-01`–`tcc-07`.
- Sync via dupla com coluna `Comentários` (thread completa) e validação assistida de fechamento.

**Non-Goals:**
- Não mudar estrutura ABNT/normas (`_shared/normas-abnt-ifba.md`).
- Não criar nova UI; fluxo continua via `gh` CLI e markdown do anexo.
- Não auto-reabrir issues sem confirmação do orientador.

## Decisions

**D1 — Anexo-first, `gh` best-effort.**
- Todas as skills gravam no anexo primeiro (`Estado: pendente` + `Body replay` = `Localização | Citação | Diagnóstico | Sugestão | Prioridade | Labels`). Só depois `tcc-00` tenta `gh create`.
- *Alternativa:* manter `gh` direto e depois fallback — rejeitada porque perde atomicidade e exige retry complexo por skill.

**D2 — Gate `tcc-00` como único escritor no GitHub.**
- `tcc-01`–`tcc-07` nunca chamam `gh issue`; apenas `tcc-00` chama `gh issue create/edit/comment/close/reopen` e `gh label create`.
- *Alternativa:* cada skill chama `gh` com retry — rejeitada porque espalha auth/label logic e quebra resiliência.

**D3 — Tabela rica no contrato transversal.**
- Extrair formato `| Issue | Localização | Citação | Diagnóstico | Sugestão | Prioridade | Labels | Estado | Comentários |` de `tcc-05` para `_shared/contrato-e-decisoes.md` (§ Saída padrão) e `_shared/anexo-acompanhamento.md` (template §3).
- *Alternativa:* duplicar tabela em cada SKILL.md — rejeitada por duplicação.

**D4 — Via dupla com merge semântico.**
- Conteúdo (título/body/labels) = Anexo vence. Estado (open/closed) + `comments[]` = GitHub vence. Histórico §2 = append-only.
- Coluna `Comentários` appenda `comments[].body` com timestamp/autor, nunca sobrescreve.
- Fechamento: `tcc-00` detecta `CLOSED` → grava em §2 + `Comentários` → pergunta `Reabrir? [s/N]` → só então `gh issue reopen` ou marca `fechada confirmada`.

**D5 — Ensure-labels idempotente.**
- `tcc-00` roda `gh label list --repo <repo>` e `gh label create` para labels do contrato faltantes antes de `gh issue create`. Resolve `labels:[]` do LEANDRO.

**D6 — Estados da pendência.**
- `pendente | criada #N | falha: <erro> | reincidente | fechada confirmada | reaberta`. `falha` mantém replay para retry.

## Risks / Trade-offs

- **Anexo cresce** (linhas com Citação longa) → Mitigação: truncar Citação em 200 chars no anexo com `...` e manter Body replay completo em bloco colapsável.
- **Duplicação se `tcc-00` rodar concorrente** → Mitigação: checar `gh issue list --search "in:title <título>"` antes de create; idempotência por título+localização.
- **Orientador precisa confirmar fechamentos** (fricção) → Mitigação: `tcc-00` sugere ação ("reincidência detectada → recomendo reabrir") mas exige `y/N`; modo `--auto-confirm` opcional futuro.
- **Migração de anexos antigos** (Pedro/Leandro) → Mitigação: script de migração converte `| # | Labels | Título | Estado |` para novo formato, preservando `pendente` onde `#` era `—`.

## Migration Plan

1. Atualizar `_shared/contrato-e-decisoes.md` e `_shared/anexo-acompanhamento.md` (template).
2. Reescrever `tcc-00-sync-issues/SKILL.md` (fluxo via dupla + ensure-labels + validação).
3. Atualizar `tcc-01`–`tcc-07` SKILL.md para gravar no anexo (remover `gh` direto onde houver).
4. Migrar `acompanhamento/*.md` e `anexo-acompanhamento.md` existentes para novo formato §3.
5. `tcc-00` replay: recriar issues LEANDRO #1-6 com body rico a partir do anexo existente (se necessário, reconstruir a partir da tabela rica gravada; se só título existe, marcar `falha: body incompleto — revisar`).

## Open Questions

- Tamanho máximo do Body replay no `gh issue create` (limite 65536 chars) — improvável estourar, mas validar.
- Ordem das linhas em §3: cronológica vs agrupada por `cap-*` — manter cronológica (compatível com Pedro).
