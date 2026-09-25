## Why

Hoje a tabela `Pendências rastreáveis` não mostra o que a skill já verificou como corrigido antes do `tcc-00` sincronizar — ex.: #17 corrigida para 214 palavras IMRaD continua `criada #1`, dando impressão de nada mudou. O orientador quer usar a tabela como buffer de validação: skill propõe `corrigido aguardando validação`, orientador confirma implicitamente ao rodar `tcc-00` mantendo o estado.

## What Changes

- Novo estado `corrigida aguardando validacao` (ou `verificada — aguardando sync`) no domínio `Estado` — skill grava quando reavaliação detecta correção no texto; visível na tabela antes de qualquer `gh`.
- Semântica: manter o estado no momento do `tcc-00` = concordância do orientador → `tcc-00` fecha a issue e promove para `fechada confirmada`; alterar para `reaberta`/`criada` = discordância → reabre/mantém.
- Atualizar `tcc-00-sync-issues` para não mais perguntar interativamente quando o Anexo já está em `corrigida aguardando validacao` — age direto conforme o estado.
- Ajustar todos `tcc-*` que reavaliam pendências para gravar o novo estado em vez de `fechada confirmada` diretamente.

## Capabilities

### New Capabilities
<!-- none -->

### Modified Capabilities
- `feedback-traceability`: domínio de `Estado` e ciclo de vida — novo estado intermediário de validação e regra "manter = concordar".
- `issue-mirror-offline`: espelho reflete o novo estado e carimbo; `tcc-00` sincroniza conforme estado de validação.

## Impact

- `openspec/specs/feedback-traceability`, `openspec/specs/issue-mirror-offline`, `_shared/contrato-e-decisoes.md`, `tcc-00-sync-issues/SKILL.md`, `tcc-04/05/06` SKILLs, `acompanhamento/*.md` (exibição).
- Sem breaking de API externa; mudança de semântica de fluxo — orientador não precisa mais responder prompt interativo para casos verificados pela skill.
