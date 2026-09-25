# tcc-orientacao-acompanhamento

## Purpose

Capacidade de produzir feedback contínuo sobre o texto do TCC entregue pelo aluno, em formato de tabela, operando em loop e acionando a skill de fundamentação quando o capítulo entregue for o de fundamentação teórica. Cada item de feedback é rastreado como uma issue no repositório privado do TCC, e o Anexo de Acompanhamento mantém o espelho para leitura offline.

## MODIFIED Requirements

### Requirement: Feedback do texto do aluno
A skill `tcc-05-acompanhamento` SHALL analisar o texto do TCC entregue pelo aluno e produzir feedback contínuo para o orientador, em formato de tabela com localização, citação do aluno, diagnóstico, sugestão ao orientador, prioridade e a referência da issue correspondente.

#### Scenario: Análise de um trecho entregue
- **WHEN** o orientador apresenta um trecho ou capítulo do texto do aluno
- **THEN** a skill produz uma tabela de feedback com localização, citação literal, diagnóstico, sugestão ao orientador e prioridade
- **AND** associa cada item à issue que o rastreia

### Requirement: Iteração em loop de acompanhamento
A skill `tcc-05-acompanhamento` SHALL funcionar como skill de loop, sendo invocada repetidamente conforme o aluno entrega novas versões, e SHALL acionar a skill `tcc-04-fundamentacao` quando o capítulo entregue for o de fundamentação teórica. Em nova versão, a skill SHALL reavaliar pendências anteriores pelo número da issue.

#### Scenario: Entrega do capítulo de fundamentação
- **WHEN** o texto entregue pelo aluno é o capítulo de fundamentação teórica
- **THEN** a skill aciona `tcc-04-fundamentacao` para análise especializada

#### Scenario: Nova versão de capítulo já analisado
- **WHEN** o orientador apresenta uma nova versão de um capítulo já avaliado
- **THEN** a skill reavalia o texto e verifica, pelo número da issue, se pendências anteriores foram resolvidas ou reincidem
- **AND** fecha ou reabre as issues correspondentes conforme o resultado

### Requirement: Atualização do Anexo de Acompanhamento
A skill `tcc-05-acompanhamento` SHALL atualizar o histórico de orientações e o espelho de issues no Anexo de Acompanhamento a cada rodada de feedback, sem editar o texto do TCC.

#### Scenario: Atualização do histórico após feedback
- **WHEN** uma rodada de feedback é concluída
- **THEN** a skill adiciona registro no histórico de orientações
- **AND** refresca o espelho de issues no Anexo de Acompanhamento