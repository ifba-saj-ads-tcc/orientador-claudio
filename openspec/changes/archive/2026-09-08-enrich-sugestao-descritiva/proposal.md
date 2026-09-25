## Why

O campo `Sugestão` das pendências rastreáveis (Anexo §3 → Body da issue via `tcc-00`) é hoje uma frase imperativa curta (ex.: `Reescrever resumo/abstract em 150-250 palavras IMRaD espelhados`), que omite o significado de siglas/normas e não dá passos verificáveis. O aluno lê a issue isolada no GitHub sem contexto, o que gera retrabalho e dúvidas para o orientador.

## What Changes

- Padronizar `Sugestão` de **todas** as pendências (abordagem A — só prompt, sem mudar schema/contrato/GitHub): toda sugestão SHALL conter ação específica + conceito explicado inline (sigla/norma na primeira ocorrência) + passos numerados + critério de verificação.
- Atualizar instrução de `Sugestão` em `_shared/contrato-e-decisoes.md` § Saída padrão de feedback e em cada `tcc-0*`/`tcc-*` SKILL que gera pendências, orientando LLM a produzir 3–5 linhas descritivas inline (ex.: `IMRaD (Introdução-Métodos-Resultados-Discussão)`, `NBR 6028:2021 150–500 palavras`).
- Manter `tcc-00-sync-issues` inalterado (só replica `Sugestão: <sug>`); tabela do Anexo pode ficar larga — aceito.

## Capabilities

### New Capabilities
<!-- none — behavior change on existing capability -->

### Modified Capabilities
- `feedback-traceability`: requisito de formato/conteúdo do campo `Sugestão` da linha rica passa a exigir explicação inline + passos + critério.
- `issue-mirror-offline`: espelho do Anexo reflete sugestões enriquecidas (sem mudar colunas/estados).

## Impact

- Arquivos afetados: `_shared/contrato-e-decisoes.md`, `openspec/specs/feedback-traceability/spec.md`, `openspec/specs/issue-mirror-offline/spec.md`, skills `tcc-01`–`tcc-07` e `tcc-00-sync-issues` (apenas prompt/texto guia).
- Sem breaking change de API/schema; Body da issue continua `Sugestão: <sug>` mas com conteúdo mais longo. Pendências antigas permanecem curtas até reavaliação.
