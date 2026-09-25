# Design: ps-scripts-only

## Context

Ver proposal.md. Hoje `orientacao-multi-aluno` referencia `scripts/sync-alunos.sh`; já existe `scripts/sync-alunos.ps1` e `.sh` causa falha por `\r` no Windows.

## Goals / Non-Goals

**Goals:** Padronizar scripts em PowerShell, remover `.sh`, ajustar Action para `pwsh`.
**Non-Goals:** Mudar lógica de `alunos.json` ou estrutura de submodules.

## Decisions

- **D1 PowerShell como único runtime:** `scripts/sync-alunos.ps1` com params `-Aluno`/`-DryRun`; remove `.sh` para evitar divergência.
- **D2 Remover Action: sync somente por skill/manual;** `sync-alunos.yml` usa `shell: pwsh` e `pwsh ./scripts/sync-alunos.ps1 -DryRun`.
- **D3 Espelhamento somente por skill:** remover `sync-issue-mirror.yml` + `generate-issue-mirror.sh`; qualquer `tcc-*` pode refrescar `acompanhamento/<id>.md` via `gh --repo <aluno>` — sem Action, pois issues estão em repos sem relação de fork.

## Risks / Trade-offs

- Runner ubuntu precisa de `pwsh` disponível (já incluso em `ubuntu-latest`).
- Usuários bash precisarão usar `pwsh` ou `powershell`.

## Migration Plan

1. Remover `scripts/sync-alunos.sh` e `.sh` de create-issues.
2. Atualizar spec e Action.
3. Validar `openspec validate --changes` e execução `pwsh ./scripts/sync-alunos.ps1 -DryRun`.
