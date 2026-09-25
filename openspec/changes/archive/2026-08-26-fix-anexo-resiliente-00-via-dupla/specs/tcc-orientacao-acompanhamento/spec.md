## MODIFIED Requirements

### Requirement: Feedback do texto do aluno
A skill `tcc-05-acompanhamento` e qualquer skill `tcc-01`–`tcc-07` que identifique pendência acionável SHALL produzir feedback em tabela rica com localização, citação literal, diagnóstico, sugestão ao orientador, prioridade, labels e Body replay, e SHALL gravar a linha no Anexo de Acompanhamento com `Estado: pendente` sem chamar `gh issue create`; a criação da issue ocorre exclusivamente via `tcc-00-sync-issues` para pendências filtradas.

#### Scenario: Análise de um trecho entregue
- **WHEN** o orientador apresenta um trecho ou capítulo do texto do aluno
- **THEN** a skill produz tabela rica e grava cada item no Anexo como `pendente` com todos os campos necessários para replay

### Requirement: Iteração em loop de acompanhamento
A skill `tcc-05-acompanhamento` SHALL funcionar como skill de loop, sendo invocada repetidamente conforme o aluno entrega novas versões, e SHALL acionar a skill `tcc-04-fundamentacao` quando o capítulo entregue for o de fundamentação teórica. Em nova versão, a skill SHALL reavaliar pendências anteriores pelo número da issue/pendência e registrar o resultado no Anexo (não via `gh` direto).

#### Scenario: Entrega do capítulo de fundamentação
- **WHEN** o texto entregue pelo aluno é o capítulo de fundamentação teórica
- **THEN** a skill aciona `tcc-04-fundamentacao` para análise especializada

#### Scenario: Nova versão de capítulo já analisado
- **WHEN** o orientador apresenta nova versão de capítulo já avaliado
- **THEN** a skill reavalia o texto e verifica, pelo número da pendência, se itens anteriores foram resolvidos ou reincidem, atualizando o Anexo com `reincidente` ou `resolvida` para `tcc-00` sincronizar

### Requirement: Atualização do Anexo de Acompanhamento
A skill `tcc-05-acompanhamento` (e demais `tcc-*` quando aplicável) SHALL atualizar o histórico de orientações e a tabela de pendências no Anexo de Acompanhamento em `acompanhamento/<id>.md` (multi-aluno) ou `./anexo-acompanhamento.md` (legado), a cada rodada, sem editar o texto do TCC em `alunos/<id>/`; mesmo com falha de `gh`, o Anexo SHALL conter a tabela completa.

#### Scenario: Atualização do histórico após feedback
- **WHEN** rodada de feedback é concluída para o aluno <id>
- **THEN** a skill adiciona registro no histórico de orientações em `acompanhamento/<id>.md` e grava/atualiza as linhas de pendências com `Estado: pendente` e Body replay

### Requirement: Auto-contenção (invocação parcial)
A skill `tcc-05-acompanhamento` SHALL funcionar de forma isolada, sem assumir que fases anteriores rodaram ou que o Anexo existe, lendo o anexo se existir e produzindo feedback sempre, criando o anexo apenas se houver algo a persistir, com tabela rica completa mesmo sem `gh`.

#### Scenario: Invocação como primeira skill
- **WHEN** o orientador invoca `tcc-05-acompanhamento` sem anexo existente
- **THEN** a skill analisa o texto e produz a tabela rica e cria o anexo com pendências `pendente` se houver pendências

#### Scenario: Anexo existente
- **WHEN** o anexo já existe
- **THEN** a skill o lê para verificar pendências anteriores e reavaliar sua resolução, registrando o resultado no Anexo

### Requirement: Descoberta do texto por glob
A skill `tcc-05-acompanhamento` SHALL localizar os arquivos `.md`/`.typ` do TCC por glob escopado em `alunos/<id>/` (quando em modo multi-aluno) ou no repo atual (modo legado single-repo), excluindo o Anexo e o diretório `.opencode/`, e consultar o orientador quando nenhum arquivo for encontrado.

#### Scenario: Arquivos localizados por glob
- **WHEN** há arquivos `.md`/`.typ` do TCC no repo do aluno <id>
- **THEN** a skill os localiza por glob escopado e os usa como entrada do feedback

#### Scenario: Nenhum arquivo encontrado
- **WHEN** o glob escopado não encontra arquivos do TCC
- **THEN** a skill pergunta ao orientador onde estão ou aceita trecho colado como fallback
