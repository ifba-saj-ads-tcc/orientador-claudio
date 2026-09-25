## ADDED Requirements

### Requirement: Feedback do texto do aluno
A skill `tcc-05-acompanhamento` SHALL analisar o texto do TCC entregue pelo aluno e produzir feedback contínuo para o orientador, em formato de tabela com localização, citação do aluno, diagnóstico, sugestão ao orientador e prioridade.

#### Scenario: Análise de um trecho entregue
- **WHEN** o orientador apresenta um trecho ou capítulo do texto do aluno
- **THEN** a skill produz uma tabela de feedback com localização, citação literal, diagnóstico, sugestão ao orientador e prioridade

### Requirement: Iteração em loop de acompanhamento
A skill `tcc-05-acompanhamento` SHALL funcionar como skill de loop, sendo invocada repetidamente conforme o aluno entrega novas versões, e SHALL acionar a skill `tcc-04-fundamentacao` quando o capítulo entregue for o de fundamentação teórica.

#### Scenario: Entrega do capítulo de fundamentação
- **WHEN** o texto entregue pelo aluno é o capítulo de fundamentação teórica
- **THEN** a skill aciona `tcc-04-fundamentacao` para análise especializada

#### Scenario: Nova versão de capítulo já analisado
- **WHEN** o orientador apresenta uma nova versão de um capítulo já avaliado
- **THEN** a skill reavalia o texto e verifica se pendências anteriores foram resolvidas

### Requirement: Atualização do Anexo de Acompanhamento
A skill `tcc-05-acompanhamento` SHALL atualizar o histórico de orientações e as pendências no Anexo de Acompanhamento a cada rodada de feedback, sem editar o texto do TCC.

#### Scenario: Atualização do histórico após feedback
- **WHEN** uma rodada de feedback é concluída
- **THEN** a skill adiciona registro no histórico de orientações
- **AND** atualiza a seção de pendências do Anexo de Acompanhamento

### Requirement: Auto-contenção (invocação parcial)
A skill `tcc-05-acompanhamento` SHALL funcionar de forma isolada, sem assumir que fases anteriores rodaram ou que o Anexo de Acompanhamento existe, lendo o anexo se existir e produzindo feedback sempre, criando o anexo apenas se houver algo a persistir.

#### Scenario: Invocação como primeira skill
- **WHEN** o orientador invoca `tcc-05-acompanhamento` sem anexo existente
- **THEN** a skill analisa o texto entregue e produz a tabela de feedback
- **AND** cria o anexo apenas se houver histórico ou pendências a registrar

#### Scenario: Anexo existente
- **WHEN** o anexo já existe em rodadas anteriores
- **THEN** a skill o lê para verificar pendências anteriores e reavaliar sua resolução

### Requirement: Descoberta do texto por glob
A skill `tcc-05-acompanhamento` SHALL localizar os arquivos `.md`/`.typ` do TCC por glob no diretório do repo, excluindo o Anexo de Acompanhamento e o diretório `.opencode/`, e consultar o orientador quando nenhum arquivo for encontrado.

#### Scenario: Arquivos localizados por glob
- **WHEN** há arquivos `.md`/`.typ` do TCC no repo
- **THEN** a skill os localiza por glob e os usa como entrada do feedback

#### Scenario: Nenhum arquivo encontrado
- **WHEN** o glob não encontra arquivos do TCC
- **THEN** a skill pergunta ao orientador onde estão ou aceita trecho colado como fallback