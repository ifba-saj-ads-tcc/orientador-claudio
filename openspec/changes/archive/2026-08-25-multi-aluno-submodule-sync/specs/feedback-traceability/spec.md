## MODIFIED Requirements

### Requirement: Feedback como issue
A skill de orientação SHALL representar cada item de feedback como uma issue no repositório do aluno indicado por alunos.json, criando uma issue para cada novo apontamento e reutilizando a issue existente para reavaliar o mesmo apontamento em rodadas seguintes, sempre com gh --repo <repo-do-aluno> explícito.

#### Scenario: Criação de issue para novo apontamento
- **WHEN** uma skill identifica um novo apontamento no texto do aluno <id>
- **THEN** a skill cria uma issue no repositório do aluno <id> representando o apontamento
- **AND** registra o número da issue como referência do item

#### Scenario: Reutilização de issue existente
- **WHEN** uma skill avalia uma nova versão de um apontamento já rastreado do aluno <id>
- **THEN** a skill reutiliza a issue existente pelo número no repo do aluno <id>, sem criar uma nova
