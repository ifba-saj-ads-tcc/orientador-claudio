# Tasks: multi-aluno-submodule-sync

## 1. Registro e estrutura base

- [x] 1.1 Criar `alunos.json` (schema `{ alunos: [{ id, repo, branch }] }`) e `acompanhamento/.gitkeep`; verificar `openspec validate --changes` passa
- [x] 1.2 Criar `scripts/sync-alunos.sh` (lê `alunos.json`, `git submodule add/update --remote`, suporta `--aluno <id>` e `--dry-run`); verificar execução com `alunos.json` de exemplo
- [x] 1.3 Adicionar derivação/validacão `.gitmodules` a partir de `alunos.json` (script gera/atualiza `.gitmodules` com `branch = <branch>`); verificar `git config -f .gitmodules --list` cobre todos os `id`s

## 2. Sincronização e proteções

- [x] 2.1 Adicionar `pre-commit` hook / `lefthook` que bloqueia `git add` em `alunos/*`; verificar hook rejeita stage em `alunos/joao/`
- [x] 2.2 Criar Action `sync-alunos.yml` (cron/manual, roda `sync-alunos.sh --dry-run`, notifica sem commitar); verificar workflow sintaxe com `actionlint` ou `gh workflow view`
- [x] 2.3 Documentar fluxo `git pull` + `sync-alunos.sh` no README/contrato; verificar instrução reproduzível por novo clone

## 3. Contrato e skills (multi-aluno)

- [x] 3.1 Atualizar `_shared/contrato-e-decisoes.md` (anexo por aluno, texto read-only em `alunos/<id>/`, `gh --repo` explícito); verificar diff reflete D1-D5 do design
- [x] 3.2 Atualizar SKILLs `tcc-04`/`tcc-05`/`tcc-06`/`tcc-07` para resolver `aluno=<id>` (param/env/prompt) e escopar globs para `alunos/<id>/` e anexo `acompanhamento/<id>.md`; verificar skill lê `alunos/joao/` quando `aluno=joao`
- [x] 3.3 Atualizar `tcc-*` para usar `gh --repo <repo-do-aluno>` derivado de `alunos.json` e imprimir `aluno@<sha>` no início; verificar issue criada no repo do aluno correto

## 4. Migração e validação

- [x] 4.1 Migrar anexo existente (se houver) de `./anexo-acompanhamento.md` para `acompanhamento/<id>.md` (script ou instrução manual); verificar histórico preservado
- [x] 4.2 Validação fim-a-fim: adicionar aluno fictício, rodar sync, invocar `tcc-05` com `aluno=<id>`, gerar anexo em `acompanhamento/<id>.md` e issue no repo do aluno; verificar `openspec validate --changes` e teste manual passam
