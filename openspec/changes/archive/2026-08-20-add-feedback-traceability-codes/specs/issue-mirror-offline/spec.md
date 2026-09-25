# issue-mirror-offline

## Purpose

Capacidade de manter no Anexo de Acompanhamento um espelho (projeção somente-leitura) das issues do repositório privado, permitindo ao orientador ler o estado do acompanhamento offline, sincronizado por rodada (skill) e por um GitHub Action em eventos de issues.

## ADDED Requirements

### Requirement: Espelho de issues no Anexo
O Anexo de Acompanhamento SHALL conter uma seção **Espelho de issues** que lista as issues do repositório com número, labels, título resumido, estado e prioridade, permitindo leitura sem conexão.

#### Scenario: Leitura offline do estado
- **WHEN** o orientador consulta o Anexo de Acompanhamento sem acesso à internet
- **THEN** o espelho de issues apresenta número, labels, título, estado e prioridade de cada issue

#### Scenario: Vínculo com a issue no GitHub
- **WHEN** há conectividade disponível
- **THEN** cada linha do espelho oferece o link para a issue correspondente no GitHub

### Requirement: Sincronização por rodada
A skill de orientação SHALL refrescar o espelho de issues no Anexo de Acompanhamento a cada rodada, consultando as issues do repositório e registrando a data da última atualização.

#### Scenario: Refrescamento do espelho na rodada
- **WHEN** uma rodada de feedback é concluída
- **THEN** a skill consulta as issues via `gh` e reescreve o espelho de issues no Anexo
- **AND** registra a data da última atualização no espelho

### Requirement: Sincronização por GitHub Action
Um GitHub Action SHALL regenerar o espelho de issues no Anexo de Acompanhamento quando houver eventos de issues ou comentários, garantindo que o espelho permaneça atualizado entre rodadas.

#### Scenario: Regeneração automática do espelho
- **WHEN** uma issue é criada, editada, fechada, reaberta ou recebe comentário
- **THEN** o GitHub Action regenera o espelho de issues no Anexo de Acompanhamento
- **AND** commita a atualização no repositório

### Requirement: Aviso de defasagem
O espelho de issues SHALL indicar que é uma projeção offline e que a fonte de verdade são as issues no GitHub, registrando a data da última sincronização.

#### Scenario: Indicação de fonte de verdade
- **WHEN** o orientador lê o espelho de issues
- **THEN** o espelho informa que a fonte de verdade são as issues no GitHub e apresenta a data da última atualização