# orientacao-multi-aluno

## Purpose

Permite ao orientador gerenciar varios TCCs simultaneamente a partir do repo orientador-llm, registrando orientandos em alunos.json, mantendo cada TCC como submodule read-only e centralizando anexos em acompanhamento/<id>.md.

## Requirements

### Requirement: Registro declarativo de orientandos
O sistema SHALL manter um arquivo alunos.json na raiz do orientador-llm como fonte de verdade unica dos orientandos ativos, com entradas { id, repo, branch }. O .gitmodules SHALL ser derivado de alunos.json.

#### Scenario: Adicionar orientando
- **WHEN** o orientador adiciona uma entrada em alunos.json
- **THEN** o sistema registra o orientando e o script de sync cria o submodule em alunos/<id>/

#### Scenario: Fonte de verdade unica
- **WHEN** alunos.json e .gitmodules divergem
- **THEN** a validacao falha e orienta regenerar .gitmodules a partir de alunos.json

### Requirement: Submodule read-only por aluno
Cada orientando SHALL corresponder a um git submodule em alunos/<id>/ apontando para seu fork do template ifba-saj-tcc-typst, com branch configurado, e o conteudo em alunos/<id>/ SHALL ser somente leitura para as skills.

#### Scenario: Leitura do texto do aluno
- **WHEN** uma skill precisa do texto do TCC do aluno <id>
- **THEN** ela le arquivos em alunos/<id>/ sem modifica-los

#### Scenario: Bloqueio de escrita
- **WHEN** uma tentativa de commit/stage em alunos/<id>/ ocorre
- **THEN** o pre-commit hook bloqueia e a skill nunca escreve nesse caminho

### Requirement: Sincronizacao via script
O sistema SHALL prover scripts/sync-alunos.ps1 (PowerShell) que le alunos.json e executa git submodule update --remote por aluno (ou seletivo -Aluno <id>), e o orientador SHALL obter a ponta dos forks com git pull + sync. O script SHALL suportar -DryRun para verificacao sem escrita.

#### Scenario: Sync completo
- **WHEN** o orientador executa pwsh ./scripts/sync-alunos.ps1
- **THEN** cada submodule avanca para a ponta do branch configurado

#### Scenario: Sync seletivo
- **WHEN** o orientador executa pwsh ./scripts/sync-alunos.ps1 -Aluno joao
- **THEN** apenas alunos/joao e atualizado

#### Scenario: Dry run
- **WHEN** o orientador executa pwsh ./scripts/sync-alunos.ps1 -DryRun
- **THEN** o sistema apenas verifica sem modificar submodules

### Requirement: Anexo por aluno centralizado
O sistema SHALL manter um anexo por aluno em acompanhamento/<id>.md (versionado no orientador-llm), copiado do template _shared/anexo-acompanhamento.md no primeiro uso, como unica area gravavel por aluno.

#### Scenario: Criacao do anexo
- **WHEN** a primeira rodada para o aluno <id> precisa persistir historico
- **THEN** o sistema cria acompanhamento/<id>.md a partir do template

#### Scenario: Anexo isolado por aluno
- **WHEN** dois alunos sao orientados simultaneamente
- **THEN** seus anexos nao colidem (arquivos distintos)

### Requirement: Action de sync sem commit automatico
A Action sync-alunos.yml SHALL verificar em cron/manual se submodules estao desatualizados e notificar, sem commitar automaticamente no orientador-llm.

#### Scenario: Verificacao read-only
- **WHEN** a Action detecta que alunos/<id> esta atras de origin/<branch>
- **THEN** ela notifica (issue/comentario/log) sem fazer commit
