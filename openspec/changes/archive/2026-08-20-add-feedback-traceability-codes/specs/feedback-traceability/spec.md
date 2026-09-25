# feedback-traceability

## Purpose

Capacidade de tratar cada item de feedback produzido pelas skills `tcc-*` como uma issue no repositório privado do TCC, usando o número da issue como identificador de rastreabilidade estável, o estado da issue como ciclo de vida da pendência e labels para codificar domínio, tipo, prioridade e categoria procedural.

## ADDED Requirements

### Requirement: Feedback como issue
A skill de orientação SHALL representar cada item de feedback como uma issue no repositório do TCC, criando uma issue para cada novo apontamento e reutilizando a issue existente para reavaliar o mesmo apontamento em rodadas seguintes.

#### Scenario: Criação de issue para novo apontamento
- **WHEN** uma skill identifica um novo apontamento no texto do aluno
- **THEN** a skill cria uma issue no repositório do TCC representando o apontamento
- **AND** registra o número da issue como referência do item

#### Scenario: Reutilização de issue existente
- **WHEN** uma skill avalia uma nova versão de um apontamento já rastreado
- **THEN** a skill reutiliza a issue existente pelo número, sem criar uma nova

### Requirement: Número da issue como identificador estável
A skill de orientação SHALL usar o número da issue como o código de rastreabilidade do feedback, garantindo um identificador único e estável para referência entre rodadas e no Anexo de Acompanhamento.

#### Scenario: Identificador único e estável
- **WHEN** um feedback é referenciado em tabelas, anexo ou checklist
- **THEN** a referência usa o número da issue como identificador estável

### Requirement: Ciclo de vida da pendência
A skill de orientação SHALL representar o ciclo de vida da pendência pelo estado da issue, usando open para pendência ativa, closed para resolvida e reopened para reincidente.

#### Scenario: Pendência resolvida
- **WHEN** uma nova versão do texto resolve um apontamento anterior
- **THEN** a skill fecha a issue correspondente

#### Scenario: Pendência reincidente
- **WHEN** uma nova versão do texto mantém ou repete um apontamento anterior
- **THEN** a skill reabre a issue correspondente, se estiver fechada
- **AND** comenta na issue que o apontamento persiste na rodada atual

#### Scenario: Pendência nova
- **WHEN** uma nova versão do texto apresenta um apontamento ainda não registrado
- **THEN** a skill cria uma issue aberta representando a pendência nova

### Requirement: Labels como siglas
A skill de orientação SHALL atribuir à issue labels que codifiquem domínio, tipo, prioridade e categoria procedural, permitindo combinar múltiplas siglas por issue e filtrar por qualquer dimensão.

#### Scenario: Aplicação de labels à issue
- **WHEN** uma issue é criada ou atualizada
- **THEN** a issue recebe labels de domínio, tipo, prioridade e categoria procedural conforme o apontamento

### Requirement: Registro no Anexo de Acompanhamento
A skill de orientação SHALL refletir cada issue no Anexo de Acompanhamento por meio do espelho de issues, sem editar o texto do TCC.

#### Scenario: Espelho atualizado com a issue
- **WHEN** uma issue é criada, atualizada ou tem seu estado alterado
- **THEN** a skill atualiza o espelho de issues no Anexo de Acompanhamento
- **AND** mantém o TCC como somente leitura