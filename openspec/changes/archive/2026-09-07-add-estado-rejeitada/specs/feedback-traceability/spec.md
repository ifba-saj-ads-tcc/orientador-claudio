# Delta: feedback-traceability - add estado rejeitada

## ADDED Requirements

### Requirement: Estado rejeitada
O domínio de `Estado` da coluna `Estado` em `##3. Pendências rastreáveis` SHALL incluir `rejeitada` além de `pendente | criada #N | falha: <erro> | reincidente | fechada confirmada | reaberta | n/a`. `rejeitada` indica decisão exclusiva do orientador de descartar a pendência sem gerar issue; a linha permanece no Anexo com número `#` preservado (não reutilizado) para rastreabilidade, sem justificativa obrigatória.

#### Scenario: Orientador rejeita pendência pendente
- **WHEN** orientador altera `Estado` de linha `pendente` para `rejeitada`
- **THEN** a linha permanece no Anexo com mesmo `#`, não gera issue via `tcc-00`, e passa a ser listada como "Rejeitadas (não bloqueiam)"

#### Scenario: Rejeitada para pendente recria issue
- **WHEN** orientador altera `rejeitada` de volta para `pendente`
- **THEN** `tcc-00` trata como pendente filtrável e cria issue idempotentemente com mesmo `#` preservado
