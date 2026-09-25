## ADDED Requirements

### Requirement: Preparação da apresentação de defesa
A skill `tcc-07-apresentacao` SHALL orientar a preparação da apresentação para a defesa, sugerindo a estrutura dos slides, o roteiro da fala e a distribuição de tempo a partir do conteúdo do trabalho.

#### Scenario: Estrutura da apresentação
- **WHEN** o orientador solicita apoio para a preparação da defesa
- **THEN** a skill propõe a estrutura da apresentação com base no trabalho
- **AND** sugere roteiro e divisão do tempo disponível

### Requirement: Simulação de banca
A skill `tcc-07-apresentacao` SHALL simular perguntas e arguições típicas de banca para preparar o aluno, e fornecer ao orientador perguntas e pontos prováveis de questionamento.

#### Scenario: Simulação de arguição
- **WHEN** o orientador solicita preparação para a banca
- **THEN** a skill gera perguntas prováveis da banca
- **AND** sugere como orientar o aluno a respondê-las

### Requirement: Registro no Anexo de Acompanhamento
A skill `tcc-07-apresentacao` SHALL registrar os próximos passos e pendências da preparação da defesa no Anexo de Acompanhamento, sem editar o texto do TCC.

#### Scenario: Registro da preparação
- **WHEN** uma rodada de preparação da defesa é concluída
- **THEN** a skill registra os próximos passos da preparação no Anexo de Acompanhamento

### Requirement: Auto-contenção (invocação parcial)
A skill `tcc-07-apresentacao` SHALL funcionar de forma isolada, sem assumir que fases anteriores rodaram ou que o Anexo de Acompanhamento existe, produzindo a preparação da defesa sempre e criando o anexo apenas se houver próximos passos a persistir.

#### Scenario: Invocação como primeira skill
- **WHEN** o orientador invoca `tcc-07-apresentacao` sem fases anteriores nem anexo existente
- **THEN** a skill propõe a preparação com base no que o orientador fornecer
- **AND** cria o anexo apenas se houver próximos passos a registrar

### Requirement: Descoberta do texto por glob
A skill `tcc-07-apresentacao` SHALL localizar os arquivos `.md`/`.typ` do TCC por glob no diretório do repo, excluindo o Anexo de Acompanhamento e o diretório `.opencode/`, usando-os como base para a preparação da defesa.

#### Scenario: Trabalho localizado por glob
- **WHEN** há arquivos `.md`/`.typ` do TCC no repo
- **THEN** a skill os localiza por glob e os usa como base da apresentação e simulação de banca

#### Scenario: Nenhum arquivo encontrado
- **WHEN** o glob não encontra arquivos do TCC
- **THEN** a skill prepara a apresentação a partir do que o orientador informar sobre o trabalho