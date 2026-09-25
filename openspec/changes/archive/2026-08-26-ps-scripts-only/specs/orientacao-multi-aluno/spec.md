## MODIFIED Requirements

### Requirement: Sincronizacao via script
O sistema SHALL prover scripts/sync-alunos.ps1 (PowerShell) que le alunos.json e executa git submodule update --remote por aluno (ou seletivo -Aluno <id>), e o orientador SHALL obter a ponta dos forks com git pull + sync. O script SHALL suportar -DryRun para verificacao sem escrita.

#### Scenario: Sync completo
- **WHEN** o orientador executa pwsh ./scripts/sync-alunos.ps1
- **THEN** cada submodule avanca para a ponta do branch configurado

#### Scenario: Sync seletivo
- **WHEN** o orientador executa pwsh ./scripts/sync-alunos.ps1 -Aluno joao
- **THEN** apenas alunos/joao e atualizado

#### Scenario: Dry run
- **WHEN** o orientador executa pwsh ./scripts/sync-alunos.ps1 -DryRun
- **THEN** o sistema apenas verifica sem modificar submodules
