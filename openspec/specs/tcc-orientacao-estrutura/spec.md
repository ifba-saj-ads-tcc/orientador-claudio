# tcc-orientacao-estrutura

## Purpose

Capacidade de gerar e revisar a estrutura do documento de TCC (esqueleto de capítulos e seções) conforme normas ABNT/IFBA, apoiando a definição do sumário e a revisão de estruturas já esboçadas.

## Requirements

### Requirement: Esqueleto do documento conforme ABNT
A skill `tcc-02-estrutura` SHALL gerar e revisar a estrutura do documento do TCC (esqueleto de capítulos e seções) seguindo as normas ABNT e IFBA, a partir do tema e da estrutura definidos na fase de concepção.

#### Scenario: Geração do esqueleto
- **WHEN** o orientador solicita a estrutura do documento para um tema definido
- **THEN** a skill propõe um esqueleto com capítulos e seções conforme as normas ABNT/IFBA
- **AND** indica o conteúdo esperado de cada seção

#### Scenario: Revisão da estrutura existente
- **WHEN** o orientador apresenta um sumário ou esboço de estrutura já produzido pelo aluno
- **THEN** a skill avalia a aderência às normas e sugere ajustes de organização

### Requirement: Registro da estrutura
A skill `tcc-02-estrutura` SHALL registrar as decisões sobre a estrutura do documento no Anexo de Acompanhamento, sem editar o texto do TCC.

#### Scenario: Registro da estrutura acordada
- **WHEN** o orientador e o aluno acordam a estrutura do documento
- **THEN** a skill registra a estrutura acordada e os próximos passos no Anexo de Acompanhamento

### Requirement: Auto-contenção (invocação parcial)
A skill `tcc-02-estrutura` SHALL funcionar de forma isolada, sem assumir que a fase de concepção rodou ou que o Anexo de Acompanhamento existe, coletando do orientador o contexto mínimo necessário quando estes estiverem ausentes.

#### Scenario: Invocação sem fase anterior
- **WHEN** o orientador invoca `tcc-02-estrutura` sem que a concepção tenha sido registrada
- **THEN** a skill pergunta o tema e o tipo de trabalho para gerar a estrutura
- **AND** produz a saída normalmente, criando o anexo apenas se houver decisões a persistir

### Requirement: Descoberta do texto por glob
A skill `tcc-02-estrutura` SHALL localizar os arquivos `.md`/`.typ` do TCC por glob no diretório do repo, excluindo o Anexo de Acompanhamento e o diretório `.opencode/`, e consultar o orientador quando nenhum arquivo for encontrado.

#### Scenario: Estrutura existente localizada por glob
- **WHEN** há um sumário ou esboço do TCC entre os arquivos `.md`/`.typ` do repo
- **THEN** a skill o localiza por glob e o usa para revisar a estrutura

#### Scenario: Nenhum arquivo encontrado
- **WHEN** o glob não encontra arquivos do TCC no repo
- **THEN** a skill pergunta ao orientador ou aceita o esboço colado como fallback