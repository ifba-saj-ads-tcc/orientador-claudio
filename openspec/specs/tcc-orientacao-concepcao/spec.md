# tcc-orientacao-concepcao

## Purpose

Capacidade de orientar a fase de concepção do TCC, lapidando a ideia inicial do aluno em um problema de pesquisa definido, delimitando escopo e perguntas de pesquisa, e sugerindo direções de pesquisa.

## Requirements

### Requirement: Lapidação da ideia inicial
A skill `tcc-01-concepcao` SHALL conduzir o orientador na fase de concepção do TCC, ajudando a refinar a ideia inicial do aluno em um problema de pesquisa definido, com escopo delimitado e perguntas de pesquisa claras.

#### Scenario: Refinamento da ideia
- **WHEN** o orientador invoca `tcc-01-concepcao` e descreve a ideia inicial do aluno
- **THEN** a skill faz perguntas orientadoras para delimitar o tema, o problema de pesquisa e o escopo
- **AND** sugere caminhos de pesquisa relacionados à ideia

### Requirement: Sugestão de pesquisas e referencial inicial
A skill `tcc-01-concepcao` SHALL sugerir tópicos de pesquisa, autores e áreas de investigação relevantes ao tema, apontando direções para o referencial teórico inicial.

#### Scenario: Sugestão de direções de pesquisa
- **WHEN** o orientador apresenta um tema geral
- **THEN** a skill propõe eixos de investigação e termos de busca úteis
- **AND** indica onde procurar literatura (bases, periódicos, anais)

### Requirement: Registro da concepção
A skill `tcc-01-concepcao` SHALL registrar as decisões da fase de concepção no Anexo de Acompanhamento (histórico de orientações), sem editar o texto do TCC.

#### Scenario: Registro da orientação inicial
- **WHEN** a fase de concepção produz definições (tema, problema, escopo)
- **THEN** a skill adiciona um registro no histórico de orientações do Anexo de Acompanhamento
- **AND** o texto do TCC do aluno permanece inalterado

### Requirement: Auto-contenção (invocação parcial)
A skill `tcc-01-concepcao` SHALL funcionar de forma isolada, sem assumir que fases anteriores rodaram ou que o Anexo de Acompanhamento existe, coletando do orientador o contexto mínimo necessário quando o texto e o anexo estiverem ausentes.

#### Scenario: Primeira invocação da família
- **WHEN** o orientador invoca `tcc-01-concepcao` como primeira skill, sem texto do aluno nem anexo existentes
- **THEN** a skill conduz a orientação a partir das informações fornecidas pelo orientador
- **AND** produz a saída normalmente, criando o anexo apenas se houver decisões a persistir

### Requirement: Descoberta do texto por glob
A skill `tcc-01-concepcao` SHALL localizar os arquivos `.md`/`.typ` do TCC por glob no diretório do repo, excluindo o Anexo de Acompanhamento e o diretório `.opencode/`, e consultar o orientador quando nenhum arquivo for encontrado.

#### Scenario: Arquivos do TCC presentes no repo
- **WHEN** há arquivos `.md`/`.typ` do TCC no repo
- **THEN** a skill os localiza por glob e usa como contexto
- **AND** ignora o anexo e o diretório `.opencode/`

#### Scenario: Nenhum arquivo encontrado
- **WHEN** o glob não encontra arquivos do TCC no repo
- **THEN** a skill pergunta ao orientador onde estão os arquivos
- **AND** aceita trecho colado como fallback