# Delta: tcc-orientacao-revisao-final - checklist rejeitadas

## ADDED Requirements

### Requirement: Checklist separa rejeitadas
A skill `tcc-06-revisao-final` SHALL listar pendências com `Estado: rejeitada` em seção separada "Rejeitadas (não bloqueiam)" do checklist de entrega, distinta de pendências bloqueantes. `rejeitada` SHALL NOT bloquear entrega/defesa.

#### Scenario: Checklist com rejeitadas
- **WHEN** Anexo contém linhas `rejeitada`
- **THEN** checklist exibe seção "Rejeitadas (não bloqueiam)" com essas linhas, sem tratá-las como pendência aberta
