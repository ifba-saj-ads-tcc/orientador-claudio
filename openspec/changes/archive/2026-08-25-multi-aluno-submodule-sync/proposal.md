# Proposal: multi-aluno-submodule-sync

## Why

Hoje o fluxo `tcc-*` assume **um repo por TCC** (`contrato-e-decisoes.md:11`): a skill roda dentro do fork do aluno e o anexo fica na raiz desse fork. O orientador precisa orientar **vários alunos simultaneamente**, cada um com seu fork do template `ifba-saj-tcc-typst`, mas quer operar a partir de um único repo (`orientador-llm`) — centralizando os anexos de acompanhamento e mantendo as issues nos repos dos alunos.

## What Changes

- **Modelo multi-aluno no `orientador-llm`**: cada orientando é um **git submodule** em `alunos/<id>/` apontando para seu fork do template. Texto do TCC em `alunos/<id>/` é **somente leitura** (nenhuma skill commita lá).
- **Anexo por aluno em `acompanhamento/<id>.md`** (versionado no `orientador-llm`, não no fork). É a única área gravável; um anexo por aluno, sem colisão.
- **Registro declarativo `alunos.json` como fonte de verdade única** dos orientandos ativos (`id`, `repo`, `branch`). `.gitmodules` é derivado dele. Adicionar/remover aluno = editar `alunos.json`.
- **Sincronização automatizada simples**: script `scripts/sync-alunos.sh` que lê `alunos.json` e executa `git submodule update --remote` por aluno. `git pull` no `orientador-llm` + script traz a ponta dos forks. Action de sync **não commita automaticamente** (apenas notifica/valida).
- **Skills parametrizadas por aluno**: `tcc-04`/`tcc-05`/etc. passam a receber `aluno=<id>` e escopam globs para `alunos/<id>/` e anexo para `acompanhamento/<id>.md`; issues via `gh --repo <repo-do-aluno>` (parametrizado, nunca implícito).
- **BREAKING**: `contrato-e-decisoes.md` — premissa "um repo por TCC / anexo na raiz" passa a "um anexo por aluno em `acompanhamento/<id>.md`; texto em `alunos/<id>/` read-only". D9 (descoberta por glob) passa a ser escopada por aluno.

## Capabilities

### New Capabilities
- `orientacao-multi-aluno`: registro, ciclo de vida e sincronização de múltiplos orientandos via `alunos.json` + submodules + script de sync.

### Modified Capabilities
- `tcc-orientacao-acompanhamento`: escopo por aluno, anexo em `acompanhamento/<id>.md`, issues com `--repo` explícito.
- `tcc-orientacao-fundamentacao`: idem (mesma parametrização).
- `tcc-orientacao-revisao-final`: idem.
- `issue-mirror-offline`: espelho por aluno (um espelho por anexo).
- `feedback-traceability`: rastreabilidade parametrizada por repo do aluno.

## Impact

- `.opencode/skills/_shared/contrato-e-decisoes.md`, `_shared/anexo-acompanhamento.md`, `tcc-04`/`tcc-05`/`tcc-06`/`tcc-07` SKILL.md.
- Novo: `alunos.json`, `acompanhamento/`, `alunos/` (submodules), `scripts/sync-alunos.sh`, `.gitmodules`, Action `sync-alunos.yml` (read-only check).
- `gh` usage em todas as skills passa a exigir `--repo` derivado de `alunos.json`.
