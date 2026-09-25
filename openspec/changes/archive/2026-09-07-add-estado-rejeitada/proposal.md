# Proposal: add-estado-rejeitada

## Why

Hoje `acompanhamento/<id>.md ##3. Pendências rastreáveis` é fonte de verdade e `tcc-00` espelha 1:1 para GitHub Issues (`# = código rastreabilidade`). Não há como o orientador descartar uma pendência sem gerar ruído na entrega — toda linha `pendente` vira issue, mesmo quando o orientador decide que a observação não deve bloquear (ex.: refinamentos de baixa prioridade #10, #12).

O orientador precisa de um estado que mantenha a linha no Anexo (histórico/rastreabilidade) mas **não gere issue**.

## What Changes

- **Novo estado `rejeitada`** na coluna `Estado` de `##3. Pendências rastreáveis`, ao lado de `pendente | fechada confirmada | fechada | n/a`. Decisão exclusiva do orientador, **sem justificativa obrigatória**.
- Gate `tcc-00` (issue-mirror-offline) passa a **ignorar** linhas com `Estado = rejeitada` (e `n/a`) — não cria, não atualiza, e fecha/arquiva issue preexistente se houver.
- Número `#` é preservado (não reutilizado) para rastreabilidade; checklist `tcc-06` lista `rejeitada` em seção separada "Rejeitadas (não bloqueiam)".
- Sem mudança no fluxo do aluno; sem edição do TCC.

## Scope

- `specs/feedback-traceability` — ampliar domínio de `Estado`
- `specs/issue-mirror-offline` — filtrar `rejeitada` no espelho
- `specs/tcc-orientacao-revisao-final` (e demais `tcc-*` SKILL.md) — documentar novo estado

Out of scope: justificativa, aprovação do aluno, reabertura automática.

## Risks

- Rejeitar `prio-alta` sem justificativa perde contexto se decisão for revertida — aceito por simplicidade; Anexo é excluído na entrega, banca não vê.
- Gate deve ser idempotente: `rejeitada` → `pendente` deve recriar issue com mesmo `#`.

## Alternatives Considered

- Label `wontfix` no GitHub — polui issues e exige criar para depois fechar.
- Sub-tabela `##3.1 Rejeitadas` — perde numeração contínua.
