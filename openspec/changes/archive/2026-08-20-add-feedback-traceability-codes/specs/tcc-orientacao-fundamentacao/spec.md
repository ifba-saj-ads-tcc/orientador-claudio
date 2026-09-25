# tcc-orientacao-fundamentacao

## Purpose

Capacidade de analisar a fundamentação teórica de um TCC usando os critérios do analise.md (abrangência e atualidade, aderência ao escopo, inconsistências e contradições, base para metodologia e resultados), produzindo achados em tabela com citações e sugestões ao orientador. Cada achado é rastreado como uma issue, e o espelho no Anexo é atualizado.

## MODIFIED Requirements

### Requirement: Saída em tabela com citações
A skill `tcc-04-fundamentacao` SHALL apresentar a análise em tabela com colunas de localização, citação do aluno, diagnóstico, sugestão ao orientador, prioridade e a referência da issue correspondente, usando a rubrica como critério de diagnóstico.

#### Scenario: Apresentação tabular dos achados
- **WHEN** a análise da fundamentação é concluída
- **THEN** a skill apresenta os achados em tabela com localização, citação literal, diagnóstico, sugestão ao orientador e prioridade
- **AND** associa cada achado à issue que o rastreia

### Requirement: Registro dos achados no Anexo de Acompanhamento
A skill `tcc-04-fundamentacao` SHALL registrar os achados da análise como issues no repositório e atualizar o espelho no Anexo de Acompanhamento, sem editar o texto do TCC.

#### Scenario: Registro de achados como issues
- **WHEN** a análise da fundamentação identifica pendências
- **THEN** a skill cria ou reutiliza issues para os achados
- **AND** refresca o espelho de issues no Anexo de Acompanhamento