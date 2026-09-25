# Design: multi-aluno-submodule-sync

## Context

Ver `proposal.md` para motivação. Estado atual: skills `tcc-*` rodam com `cwd = fork do aluno`; glob `**/*.md|typ` descobre o TCC, anexo em `./anexo-acompanhamento.md`, `gh` com `--repo` implícito. Dois repos base existem: `orientador-llm` (este) e `ifba-saj-tcc-typst` (template); cada aluno forka o template. O orientador precisa ler `alunos/<id>/` mas nunca commitar lá.

## Goals / Non-Goals

**Goals:**
- Um único checkout (`orientador-llm`) dá acesso read-only ao texto de todos os orientandos ativos e acesso gravável aos seus anexos.
- `alunos.json` é fonte de verdade única; `.gitmodules` é derivado (sem divergência).
- `git pull` + um comando traz a ponta dos forks; sem commit automático por Action.

**Non-Goals:**
- Editar/commits no texto do aluno a partir do `orientador-llm`.
- Suportar orientandos fora do modelo fork-do-template.
- UI gráfica de seleção de aluno (selector é CLI: `aluno=<id>` ou leitura de `alunos.json`).

## Decisions

### D1 — Submodule por aluno em `alunos/<id>/` com `branch = main`

**Escolha:** cada orientando é `git submodule` com `branch` pinado. `git submodule update --remote --merge` avança para a ponta.

**Alternativas descartadas:**
- Clone raso ignorado (`.gitignore`): perde vínculo declarativo do commit analisado.
- Leitura só via `gh api`: não permite navegação local no editor, que é requisito.

**Detalhe:** `.gitmodules` gerado a partir de `alunos.json` por script; edição manual de `.gitmodules` é desencorajada.

### D2 — `alunos.json` como fonte de verdade

Schema: `{ alunos: [{ id, repo, branch }] }`. `id` é filesystem-safe e vira nome de pasta e de anexo. Script valida unicidade de `id` e existência de `repo`.

### D3 — Anexo em `acompanhamento/<id>.md`

Separado fisicamente dos submodules — evita gravar arquivo do orientador dentro da working tree do submodule. Template copiado de `_shared/anexo-acompanhamento.md` no primeiro uso. Um espelho de issues por anexo.

### D4 — Sync via `scripts/sync-alunos.sh` + Action read-only

Script: lê `alunos.json`, para cada entrada `git submodule update --remote --merge -- <path>` (ou `git submodule add` se ainda não existe). Action `sync-alunos.yml` roda em cron/manual, executa o script em dry-run e abre issue/comentário se há commits novos — **não commita**.

**Alternativa descartada:** `post-merge` hook — hooks não são distribuídos por clone, exigem setup manual.

### D5 — Skills parametrizadas por `aluno=<id>`

Skills resolvem `aluno` por: arg explícito > `ALUNO` env > prompt interativo se ambíguo. Globs escopados: `alunos/<id>/**/*.{md,typ}` excluindo `.opencode/`. Anexo resolvido para `acompanhamento/<id>.md`. `gh` sempre com `--repo <repo-do-aluno>`.

## Risks / Trade-offs

- **Commit acidental em `alunos/<id>/`:** skill nunca escreve lá; adicionar `pre-commit` hook que bloqueia `git add alunos/*` e CI check.
- **Submodule pinado vs ponta:** se orientador esquecer o sync, analisa commit defasado. Mitigação: skill imprime `aluno@<sha curta>` no início e avisa se `origin/main` está à frente.
- **Divergência `alunos.json` ↔ `.gitmodules`:** `.gitmodules` é gerado; CI valida que `git config -f .gitmodules` cobre todo `alunos.json`.
- **Muitos submodules (dezenas):** `git submodule update --remote` fica lento. Script suporta `--aluno <id>` para sync seletivo.

## Migration Plan

1. Criar `alunos.json` vazio, `acompanhamento/` e `scripts/sync-alunos.sh`.
2. Para cada orientando ativo: `sync-alunos.sh --add <id> <repo>` (adiciona submodule + entrada).
3. Atualizar `_shared/contrato-e-decisoes.md` e SKILLs para modo multi-aluno (com fallback single-repo para compatibilidade).
4. Migrar anexos existentes (se houver) de `./anexo-acompanhamento.md` para `acompanhamento/<id>.md`.
5. Rollback: remover submodules e voltar a operar por repo; anexos em `acompanhamento/` permanecem como histórico.

## Open Questions

- Nome do campo `repo`: `owner/repo` vs URL completa? (default: `owner/repo`).
- Limite de orientandos simultâneos antes de paginar `alunos.json`? (deferível).
