## MODIFIED Requirements

### Requirement: Feedback como issue
A skill de orientação SHALL representar cada pendência acionável como uma linha rica no Anexo de Acompanhamento (Localização, Citação literal, Diagnóstico, Sugestão ao orientador, Prioridade, Labels, Body replay) com `Estado: pendente`. A criação da issue no GitHub SHALL ocorrer exclusivamente via `tcc-00-sync-issues`, que filtra apenas pendências que o aluno deve resolver e cria a issue com `gh --repo <repo-do-aluno>` explícito, atualizando o Anexo com o número real ou `falha: <erro>` mantendo o replay. Skills `tcc-01`–`tcc-07` SHALL NOT chamar `gh issue create` diretamente.

#### Scenario: Registro resiliente sem gh
- **WHEN** uma skill identifica uma pendência acionável e `gh` não está autenticado ou falha
- **THEN** a pendência é gravada no Anexo com todos os campos ricos e `Estado: pendente` (ou `falha`) e o Body replay permanece recuperável para criação posterior via `tcc-00`

#### Scenario: Criação gateada via tcc-00
- **WHEN** `tcc-00` executa com pendências `pendente` no Anexo
- **THEN** ela cria uma issue por pendência filtrada no repositório do aluno e registra o número da issue no Anexo

#### Scenario: Criação de issue para novo apontamento
- **WHEN** 	cc-00 encontra pendência pendente filtrada no Anexo
- **THEN** cria issue no repositório do aluno e registra o número

#### Scenario: Reutilização de issue existente
- **WHEN** uma nova rodada reavalia pendência já rastreada do aluno <id>
- **THEN** a skill registra a reavaliação no Anexo vinculada ao número existente, sem criar nova linha pendente duplicada

### Requirement: Número da issue como identificador estável
A skill de orientação SHALL usar o número da issue como o código de rastreabilidade do feedback, garantindo um identificador único e estável para referência entre rodadas e no Anexo de Acompanhamento.

#### Scenario: Identificador único e estável
- **WHEN** um feedback é referenciado em tabelas, anexo ou checklist
- **THEN** a referência usa o número da issue como identificador estável

### Requirement: Ciclo de vida da pendência
A skill de orientação SHALL representar o ciclo de vida da pendência pelo estado no Anexo e, quando criada, pelo estado da issue no GitHub (open/closed/reopened). `tcc-00` SHALL sincronizar via dupla: ao detectar issue fechada no GitHub, SHALL appendar o comentário do aluno na coluna `Comentários` (thread completa) e registrar o evento no Histórico §2, e SHALL solicitar validação do orientador antes de reabrir ou confirmar fechamento.

#### Scenario: Pendência fechada pelo aluno requer validação
- **WHEN** `tcc-00` detecta issue `CLOSED` no GitHub mas Anexo ainda `aberta/criada`
- **THEN** `tcc-00` atualiza a coluna `Comentários` e o Histórico, e pergunta ao orientador se deve reabrir ou confirmar fechamento, sem alterar o estado automaticamente

#### Scenario: Pendência resolvida
- **WHEN** nova versão resolve apontamento anterior
- **THEN** 	cc-00 fecha a issue e marca echada confirmada no Anexo após validação do orientador
#### Scenario: Pendência reincidente
- **WHEN** nova versão do texto mantém pendência já fechada como resolvida
- **THEN** a skill registra `reincidente` no Anexo e `tcc-00` reabre a issue com comentário da rodada apenas após confirmação do orientador

#### Scenario: Pendência nova
- **WHEN** nova versão do texto apresenta apontamento ainda não registrado
- **THEN** a skill cria linha `pendente` no Anexo representando a pendência nova

### Requirement: Labels como siglas
A skill de orientação SHALL atribuir à pendência labels que codifiquem domínio, tipo, prioridade e categoria procedural, persistindo-as no Anexo; `tcc-00` SHALL garantir `gh label create` (ensure-labels) antes de `gh issue create`, permitindo combinar múltiplas siglas por issue.

#### Scenario: Aplicação de labels à issue
- **WHEN** pendência é criada no Anexo ou issue via `tcc-00`
- **THEN** labels de domínio, tipo, prioridade e categoria procedural são persistidas no Anexo e aplicadas no GitHub via `tcc-00`

### Requirement: Registro no Anexo de Acompanhamento
A skill de orientação SHALL refletir cada pendência no Anexo de Acompanhamento por meio da tabela rica (Localização, Citação, Diagnóstico, Sugestão, Prioridade, Labels, Body replay, Estado, Comentários), sem editar o texto do TCC.

#### Scenario: Espelho atualizado com a issue
- **WHEN** pendência é registrada ou issue tem estado/comentário alterado no GitHub
- **THEN** `tcc-00` atualiza a linha no Anexo e mantém o TCC como somente leitura
