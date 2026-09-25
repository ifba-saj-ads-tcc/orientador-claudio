## Context

Ver `proposal.md` — Why. Hoje `Sugestão` é frase curta gerada por prompts em `_shared/contrato-e-decisoes.md:74` e SKILLs `tcc-*`; `tcc-00-sync-issues:19` replica como `Sugestão: <sug>` no Body da issue. Abordagem A escolhida: só refinar prompts (sem mudar schema, colunas ou fluxo `tcc-00`). Tabela pode ficar larga; explicações sempre inline.

## Goals / Non-Goals

**Goals:**
- Toda nova pendência gera Sugestão auto-contida legível isolada na issue.
- Siglas/normas explicadas na primeira ocorrência (ex.: IMRaD, NBR 6028:2021).
- Passos e critério verificáveis para orientador/aluno.

**Non-Goals:**
- Mudar colunas do Anexo, estados, labels ou fluxo gate `tcc-00`.
- Criar glossário externo ou novo campo `Detalhes`.
- Reescrever pendências históricas automaticamente.

## Decisions

- **Decisão: abordagem A (prompt-only)** — Alterar apenas texto instrucional em `_shared/contrato-e-decisoes.md` e SKILLs. Alternativa B (novo campo) descartada: mudaria contrato/specs e exigiria migração. A tem custo mínimo e atende "padronizar para todas".
- **Decisão: inline sempre** — Explicar sigla na Sugestão, não referenciar `_shared/`. Alternativa glossário descartada por exigência explícita do solicitante e por issue ser lida isolada.
- **Decisão: sem limite rígido de chars** — Aceitar tabela larga; instrução orienta 3–5 linhas mas sem validação automática. Limite GitHub Body (65536) não é risco prático.
- **Template da Sugestão:** `Ação (onde) + Conceito inline (Sigla (expansão) / Norma) + Passos: 1) 2) 3) + Critério: como verificar + validar com orientador (#N)`.

## Risks / Trade-offs

- [LLM alonga demais] → Mitigação: instrução explícita "3–5 linhas, inline, sem glossário" + 1 exemplo canônico no contrato.
- [Pendências antigas continuam curtas] → Aceito; reavaliação reescreve Sugestão quando reaberta.
- [Inconsistência entre skills] → Mitigação: editar contrato (fonte única) + replicar frase-guia idêntica em cada SKILL.md.

## Migration Plan

1. Merge dos deltas de spec; 2) editar `_shared/contrato-e-decisoes.md:74` e SKILLs `tcc-01`–`tcc-07`/`tcc-00`; 3) nenhuma migração de dados; próximas rodadas já geram Sugestões ricas.

## Open Questions

- Nenhuma.
