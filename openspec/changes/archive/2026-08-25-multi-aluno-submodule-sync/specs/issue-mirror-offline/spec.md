## MODIFIED Requirements

### Requirement: Espelho de issues no Anexo
O Anexo de Acompanhamento por aluno em acompanhamento/<id>.md SHALL conter uma seção **Espelho de issues** que lista as issues do repositório do aluno <id> com número, labels, título resumido, estado e prioridade, permitindo leitura sem conexão.

#### Scenario: Leitura offline do estado
- **WHEN** o orientador consulta acompanhamento/<id>.md sem acesso à internet
- **THEN** o espelho de issues apresenta número, labels, título, estado e prioridade de cada issue do aluno <id>

#### Scenario: Vínculo com a issue no GitHub
- **WHEN** há conectividade disponível
- **THEN** cada linha do espelho oferece o link para a issue correspondente no GitHub do aluno <id>

### Requirement: Sincronização por rodada
A skill de orientação SHALL refrescar o espelho de issues em acompanhamento/<id>.md a cada rodada do aluno <id>, consultando as issues do repositório do aluno via gh --repo <repo-do-aluno> e registrando a data da última atualização.

#### Scenario: Refrescamento do espelho na rodada
- **WHEN** uma rodada de feedback do aluno <id> é concluída
- **THEN** a skill consulta as issues via gh --repo <repo-do-aluno> e reescreve o espelho em acompanhamento/<id>.md
- **AND** registra a data da última atualização no espelho
