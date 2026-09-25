## MODIFIED Requirements

### Requirement: Análise da fundamentação teórica
A skill `tcc-04-fundamentacao` SHALL analisar a fundamentação teórica usando os critérios de `rubrica-fundamentacao.md` e `rubrica-rigor-textual.md`, produzindo tabela rica com localização, citação literal, diagnóstico, sugestão ao orientador, prioridade, labels e Body replay, e SHALL gravar cada achado no Anexo de Acompanhamento com `Estado: pendente`; a criação da issue no GitHub SHALL ocorrer exclusivamente via `tcc-00-sync-issues`.

#### Scenario: Análise completa da fundamentação
- **WHEN** o orientador apresenta o capítulo de fundamentação teórica
- **THEN** a skill produz tabela rica e grava cada achado no Anexo como `pendente` com dados suficientes para replay

### Requirement: Rastreamento de achados
Cada achado da fundamentação SHALL ser registrado como linha `pendente` no Anexo; `tcc-00-sync-issues` SHALL criar a issue no GitHub para achados filtrados como pendência do aluno, aplicando labels e atualizando o Anexo com `# real` ou `falha`.

#### Scenario: Achado registrado como pendente
- **WHEN** a skill identifica um achado na fundamentação
- **THEN** grava linha rica no Anexo com `Estado: pendente`; `tcc-00` cria a issue posteriormente

### Requirement: Reavaliação de fundamentação
Em nova versão da fundamentação, a skill SHALL reavaliar achados anteriores pelo número da pendência e registrar `reincidente` ou `resolvida` no Anexo para `tcc-00` sincronizar com o GitHub após validação do orientador.

#### Scenario: Reavaliação com reincidência
- **WHEN** nova versão mantém achado anterior já fechado no GitHub
- **THEN** a skill registra `reincidente` no Anexo; `tcc-00` solicita confirmação do orientador antes de reabrir a issue
