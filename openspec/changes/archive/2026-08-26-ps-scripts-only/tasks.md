# Tasks: ps-scripts-only

## 1. Scripts PowerShell

- [x] 1.1 Remover `scripts/sync-alunos.sh` e `scripts/create-issues-fundamentacao-LEANDRO.sh` e verificar `git status` sem `.sh`
- [x] 1.2 Remover `.github/workflows/sync-issue-mirror.yml` e `.github/scripts/generate-issue-mirror.sh` (espelhamento somente por skill) e verificar `git status`
- [x] 1.3 Atualizar `.github/workflows/sync-alunos.yml` para usar `pwsh ./scripts/sync-alunos.ps1 -DryRun` com `shell: pwsh` e verificar sintaxe
- [x] 1.4 Atualizar SKILLs `tcc-*` para documentar que qualquer skill pode refrescar `acompanhamento/<id>.md` via `gh --repo <aluno>` e validar `openspec validate --changes` passa
