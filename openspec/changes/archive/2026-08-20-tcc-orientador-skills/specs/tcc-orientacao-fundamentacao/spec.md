## ADDED Requirements

### Requirement: Análise da fundamentação teórica
A skill `tcc-04-fundamentacao` SHALL analisar a fundamentação teórica do TCC usando os critérios da rubrica derivada do `analise.md` (abrangência e atualidade da revisão, clareza das definições, estrutura e coerência).

#### Scenario: Análise completa da fundamentação
- **WHEN** o orientador apresenta o capítulo de fundamentação teórica do aluno
- **THEN** a skill produz uma análise detalhada cobrindo abrangência, atualidade, clareza de definições e estrutura da revisão de literatura

### Requirement: Verificação de aderência ao escopo
A skill `tcc-04-fundamentacao` SHALL identificar conceitos e teorias que não fazem parte do escopo da pesquisa ou que não estão diretamente relacionados ao tema central.

#### Scenario: Conceito fora do escopo
- **WHEN** a fundamentação apresenta um conceito sem conexão clara com o tema central da pesquisa
- **THEN** a skill aponta o conceito como fora do escopo
- **AND** sugere como o orientador pode questionar o aluno sobre a conexão com o tema

### Requirement: Identificação de inconsistências e contradições
A skill `tcc-04-fundamentacao` SHALL identificar inconsistências, contradições e ambiguidades na definição de conceitos dentro da fundamentação teórica.

#### Scenario: Conceitos contraditórios ou ambíguos
- **WHEN** a fundamentação contém conceitos que se contradizem ou são usados de forma ambígua
- **THEN** a skill aponta a inconsistência e sugere caminhos para esclarecimento

### Requirement: Avaliação da base para metodologia e resultados
A skill `tcc-04-fundamentacao` SHALL avaliar se a fundamentação estabelece base sólida para a metodologia e contribui para a compreensão dos resultados da pesquisa.

#### Scenario: Verificação da ligação fundamentação-metodologia
- **WHEN** o orientador solicita avaliação da ligação entre fundamentação e metodologia
- **THEN** a skill analisa se a fundamentação sustenta as escolhas metodológicas
- **AND** indica lacunas que comprometem a compreensão dos resultados

### Requirement: Saída em tabela com citações
A skill `tcc-04-fundamentacao` SHALL apresentar a análise em tabela com colunas de localização, citação do aluno, diagnóstico, sugestão ao orientador e prioridade, usando a rubrica como critério de diagnóstico.

#### Scenario: Apresentação tabular dos achados
- **WHEN** a análise da fundamentação é concluída
- **THEN** a skill apresenta os achados em tabela com localização, citação literal, diagnóstico, sugestão ao orientador e prioridade

### Requirement: Registro dos achados no Anexo de Acompanhamento
A skill `tcc-04-fundamentacao` SHALL registrar as pendências e feedbacks da análise no Anexo de Acompanhamento, sem editar o texto do TCC.

#### Scenario: Registro de pendências da fundamentação
- **WHEN** a análise da fundamentação identifica pendências
- **THEN** a skill registra as pendências na seção de Pendências e feedbacks do Anexo de Acompanhamento

### Requirement: Auto-contenção (invocação parcial)
A skill `tcc-04-fundamentacao` SHALL funcionar de forma isolada, sem assumir que fases anteriores rodaram ou que o Anexo de Acompanhamento existe, produzindo a análise sempre e criando o anexo apenas se houver pendências a persistir.

#### Scenario: Invocação sem fases anteriores
- **WHEN** o orientador invoca `tcc-04-fundamentacao` sem fases anteriores nem anexo existente
- **THEN** a skill analisa o capítulo de fundamentação entregue
- **AND** produz a tabela de achados, criando o anexo somente se houver pendências a registrar

### Requirement: Descoberta do texto por glob
A skill `tcc-04-fundamentacao` SHALL localizar o capítulo de fundamentação entre os arquivos `.md`/`.typ` do TCC por glob no diretório do repo, excluindo o Anexo de Acompanhamento e o diretório `.opencode/`, e consultar o orientador quando não for encontrado.

#### Scenario: Capítulo localizado por glob
- **WHEN** o capítulo de fundamentação está entre os arquivos `.md`/`.typ` do repo
- **THEN** a skill o localiza por glob e o usa como entrada da análise

#### Scenario: Capítulo não encontrado
- **WHEN** o glob não encontra o capítulo de fundamentação
- **THEN** a skill pergunta ao orientador onde está ou aceita o capítulo colado como fallback