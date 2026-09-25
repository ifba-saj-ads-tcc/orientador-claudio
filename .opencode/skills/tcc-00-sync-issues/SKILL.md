# tcc-00-sync-issues — Sincronização de Issues (via dupla, gate único)

Assistente do **orientador** na sincronização via dupla entre o Anexo (`acompanhamento/<id>.md`) e o GitHub. É a **única skill que cria/atualiza issues**; demais `tcc-*` apenas gravam pendências `pendente` no Anexo.

## Contrato (obrigatório)

- Leia `_shared/contrato-e-decisoes.md` antes de agir.
- **Anexo é fonte do conteúdo; GitHub é fonte do estado/comentários.** `tcc-00` é o único escritor no GitHub.
- O Anexo seção **3. Pendências rastreáveis** contém tabela rica com `Estado: pendente | criada #N | falha: <erro> | corrigida aguardando validacao | reincidente | fechada confirmada | reaberta | rejeitada | n/a` e coluna `Comentários` (thread completa, append nunca overwrite). `corrigida aguardando validacao` = skill verificou correção, visível antes do sync; manter = concordar (promove para `fechada confirmada` + `gh issue close`). `rejeitada`/`n/a` SHALL NOT gerar issue.

## Fluxo de trabalho

### 1. Identificar o repositório
- Localize o `repo` do aluno em `alunos.json` a partir do `id` (ou `ALUNO` env / prompt).

### 2. Direção Anexo → GitHub (criação)
- Leia `acompanhamento/<id>.md` §3 e filtre linhas com `Estado: pendente` ou `falha: <erro>` que são pendências que o aluno deve resolver. **Ignore** linhas `rejeitada` e `n/a` (não cria/atualiza); se `rejeitada` possui issue preexistente aberta, execute `gh issue close <N> --repo <repo>`; transição `rejeitada`→`pendente` volta a ser filtrável e recria issue idempotentemente.
- **Ensure-labels:** rode `gh label list --repo <repo> --json name` e para cada label faltante da taxonomia (`cap-*`, `fato/fonte/formato/coerencia/abnt/seguranca`, `prio-*`, `entregavel`) execute `gh label create --repo <repo> --name <label> --color <cor> --description <desc>` (idempotente, ignore se já existe).
- Para cada pendência filtrada: `gh issue create --repo <repo> --title "<Título>" --body "Localização: <loc> | Citação: \"<cit>\" | Diagnóstico: <diag> | Sugestão: <sug> | Prioridade: <prio>" --label "<labels>"` — `<sug>` já vem descritiva (ação+sigla/norma explicada inline+passos+critério, 3–5 linhas) conforme contrato; replique sem truncar. Em caso de sucesso, atualize a linha para `Estado: criada #N` e preencha `Link`; em falha, `Estado: falha: <erro>` mantendo Body replay.

### 3. Direção GitHub → Anexo (estado e comentários)
- Colete `gh issue list --repo <repo> --json number,title,labels,state,comments --limit 100` e para cada issue com comentários `gh issue view <N> --repo <repo> --json comments,state,closedAt`.
- Para cada `#N` presente no Anexo: append novos `comments[].body` na coluna `Comentários` com `YYYY-MM-DD autor: texto` (nunca sobrescreva); atualize `Labels` se divergir.
- Se `Anexo == corrigida aguardando validacao` e estado mantido pelo orientador: execute `gh issue close <N> --repo <repo>` e atualize Anexo para `fechada confirmada` (sem prompt) + linha no Histórico §2. Se `state: CLOSED` e Anexo ainda `criada #N/reincidente`: adicione linha no Histórico §2: `Data | tcc-00 sync | #N fechada pelo aluno: "<último comentário>" | Validar correção` e **pergunte ao orientador**: "Aluno fechou #N alegando '<comentário>'. Reavaliação indica [persiste/corrigido]. Deseja REABRIR ou CONFIRMAR fechamento?" Só então execute `gh issue reopen` + comment ou marque `fechada confirmada`.

### 4. Atualizar carimbo e relatar
- Atualize o carimbo `Atualizado em: YYYY-MM-DD HH:MM` em §3.
- Relate: "X pendências criadas, Y falhas, Z comentários sincronizados, W fechamentos para validar".

## Regras

- Nunca apague pendências/linhas do Anexo; estados `fechada confirmada` permanecem para histórico.
- Idempotência: antes de create, verifique `gh issue list --search "in:title <Título>"` para não duplicar.
- Se houver divergência crítica, questione o orientador antes de editar.
