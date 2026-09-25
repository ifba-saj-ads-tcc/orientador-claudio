# Proposal: ps-scripts-only

## Why

Scripts em bash (`scripts/sync-alunos.sh`) falham no fluxo Windows/PowerShell do orientador e a spec `orientacao-multi-aluno` ainda referencia `.sh`. Padronizar em PowerShell elimina CRLF/`\r` e compatibilidade com `pwsh` na Action.

## What Changes

- **BREAKING**: Remover `scripts/sync-alunos.sh`; manter apenas `scripts/sync-alunos.ps1` como script de sincronização.
- Atualizar `scripts/create-issues-*.ps1` como padrão; remover equivalente `.sh`.
- Alterar `.github/workflows/sync-alunos.yml` para usar `pwsh` em vez de `bash`.
- **BREAKING**: Remover `.github/workflows/sync-issue-mirror.yml` e `.github/scripts/generate-issue-mirror.sh` — espelhamento passa a ser **somente por skill** (qualquer `tcc-*` pode sincronizar), sem Action. Issues estão nos repos dos alunos (submodules, sem relação de fork), então trigger no `orientador-llm` nunca dispara.
- Ajustar documentação/contrato para referenciar `.ps1`.

## Capabilities

### New Capabilities
- (none)

### Modified Capabilities
- `orientacao-multi-aluno`: requisito "Sincronização via script" passa de `scripts/sync-alunos.sh` para `scripts/sync-alunos.ps1` (PowerShell, params `-Aluno`/`-DryRun`).
- `issue-mirror-offline`: remover requisito "Sincronização por GitHub Action"; manter apenas "Sincronização por rodada" (qualquer skill `tcc-*` SHALL refrescar `acompanhamento/<id>.md` via `gh --repo <repo-do-aluno>`).

## Impact

- `scripts/sync-alunos.sh` removido, `scripts/sync-alunos.ps1` é fonte de verdade.
- `.github/workflows/sync-alunos.yml` usa `pwsh`.
- Docs e specs atualizadas.
