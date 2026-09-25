## REMOVED Requirements

### Requirement: Sincronização por GitHub Action
**Reason**: Issues nos repos dos alunos; Action removida.
**Migration**: Qualquer skill tcc-* refresca acompanhamento/<id>.md via gh --repo <repo-do-aluno>.

## MODIFIED Requirements

### Requirement: Sincronização por rodada
A skill de orientação SHALL refrescar o espelho de issues em acompanhamento/<id>.md a cada rodada do aluno <id>, consultando as issues do repositório do aluno via gh --repo <repo-do-aluno> e registrando a data da última atualização. Qualquer skill tcc-* MAY sincronizar o espelho quando necessário.

#### Scenario: Refrescamento do espelho na rodada
- **WHEN** uma rodada de feedback do aluno <id> é concluída
- **THEN** a skill consulta as issues via gh --repo <repo-do-aluno> e reescreve o espelho em acompanhamento/<id>.md
- **AND** registra a data da última atualização no espelho
