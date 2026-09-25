## ADDED Requirements

### Requirement: Derivação de marcos por retroplanning
A skill `tcc-03-cronograma` SHALL criar o cronograma do TCC derivando marcos temporais por retroplanning a partir da data de defesa informada pelo orientador, distribuindo as etapas do ciclo de vida do trabalho em ordem inversa.

#### Scenario: Criação do cronograma com data de defesa
- **WHEN** o orientador informa a data de defesa
- **THEN** a skill propõe marcos com datas-alvo derivadas (defesa → revisão final → resultados → metodologia → fundamentação → projeto/estrutura)
- **AND** registra os marcos na seção de Marcos do Anexo de Acompanhamento

#### Scenario: Defesa sem data marcada
- **WHEN** o orientador ainda não tem data de defesa marcada
- **THEN** a skill solicita uma data-alvo provisória ou uma duração estimada
- **AND** deriva os marcos a partir dessa referência

### Requirement: Revisão de datas dos marcos
A skill `tcc-03-cronograma` SHALL permitir que as datas-alvo sejam revisadas ao longo do processo de elaboração do TCC, registrando cada revisão sem perder o histórico.

#### Scenario: Revisão de uma data-alvo
- **WHEN** o orientador informa que um marco precisa ter sua data alterada
- **THEN** a skill atualiza a data no Anexo de Acompanhamento
- **AND** registra a revisão no histórico de orientações com motivo e contexto

### Requirement: Manutenção do cronograma em rodadas de acompanhamento
A skill `tcc-03-cronograma` SHALL ser invocável em rodadas subsequentes para manter o cronograma atualizado, alertando sobre marcos próximos ou atrasados.

#### Scenario: Verificação de marcos em rodada seguinte
- **WHEN** o orientador invoca a skill em uma nova rodada de orientação
- **THEN** a skill verifica o status dos marcos registrados
- **AND** alerta sobre marcos vencidos, próximos ou em risco

### Requirement: Auto-contenção (invocação parcial)
A skill `tcc-03-cronograma` SHALL funcionar de forma isolada, sem assumir que fases anteriores rodaram ou que o Anexo de Acompanhamento existe, criando a seção de Marcos do anexo quando necessário para persistir o cronograma.

#### Scenario: Invocação como primeira skill
- **WHEN** o orientador invoca `tcc-03-cronograma` sem anexo existente
- **THEN** a skill cria o Anexo de Acompanhamento a partir do modelo compartilhado
- **AND** registra os marcos na seção de Marcos

### Requirement: Descoberta do texto por glob
A skill `tcc-03-cronograma` SHALL localizar os arquivos `.md`/`.typ` do TCC por glob no diretório do repo, excluindo o Anexo de Acompanhamento e o diretório `.opencode/`, usando-os como contexto para distribuir os marcos das etapas do trabalho.

#### Scenario: Arquivos do TCC presentes
- **WHEN** há arquivos `.md`/`.typ` do TCC no repo
- **THEN** a skill os localiza por glob e os usa para dimensionar as etapas do cronograma

#### Scenario: Nenhum arquivo encontrado
- **WHEN** o glob não encontra arquivos do TCC
- **THEN** a skill distribui os marcos pelas etapas do ciclo de vida com base no que o orientador informar