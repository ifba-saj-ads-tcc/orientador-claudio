---
name: sincronizar-issues
description: Única skill autorizada a criar, comentar, fechar ou reabrir issues no repositório GitHub de um aluno, a partir das Pendências rastreáveis do acompanhamento — e a trazer de volta comentários/fechamentos feitos pelo aluno no GitHub. Use quando o orientador disser "sincroniza as issues", "abre as pendências no GitHub", ou quiser saber o status atual das issues de um ou todos os alunos.
---

# sincronizar-issues

Leia `contrato/contrato-de-acesso.md` — esta é a única skill que executa `gh issue`
create/edit/close/reopen/comment e `gh label create`. Todas as outras skills só escrevem no
acompanhamento; esta skill é o portão (gate) entre o acompanhamento e o GitHub real.

## Fluxo de trabalho

### 1. Acompanhamento → GitHub (abrir/atualizar pendências)
- Leia `registro/acompanhamento/<slug>.md`, seção 3. Filtre linhas com Estado `pendente`.
- Garanta que as labels da taxonomia existem no repo do aluno (`gh label list --repo <repo>`;
  crie as que faltarem com `gh label create`, idempotente).
- Para cada linha `pendente`: `gh issue create --repo <repo> --title "<título>" --body
  "Localização: ... | Citação: \"...\" | Diagnóstico: ... | Sugestão: ... | Prioridade: ..."
  --label "<labels>"`. Em sucesso, atualize a linha para `criada #N` com o link; em falha,
  registre `falha: <erro>` sem perder o conteúdo (para retentar depois).
- Antes de criar, cheque duplicidade (`gh issue list --search "in:title <título>"`) — nunca crie
  duas issues para a mesma pendência.
- Linhas `rejeitada`: se existir issue aberta correspondente, feche-a (`gh issue close`). Nunca
  crie issue para uma linha `rejeitada` ou `n/a`.

### 2. GitHub → Acompanhamento (trazer estado e comentários)
- Para cada issue referenciada no acompanhamento (`criada #N` ou posterior), colete estado e
  comentários (`gh issue view <N> --repo <repo> --json state,comments,closedAt`).
- Anexe comentários novos na coluna Comentários (sempre acrescentando, nunca sobrescrevendo).
- Se a linha estava `corrigida aguardando validação` e o orientador não pediu para reabrir,
  promova para `fechada confirmada` e feche a issue — manter esse estado sem alteração equivale
  a aprovar a correção.
- Se a issue foi fechada pelo aluno no GitHub mas o acompanhamento ainda mostra `criada #N`,
  não feche automaticamente: registre no Histórico e pergunte ao orientador se confirma o
  fechamento ou reabre.

### 3. Relatar
- Ao final, informe: quantas pendências foram criadas, quantas falharam, quantos comentários
  novos foram sincronizados, quantas aguardam validação do orientador.
- Atualize o carimbo "Atualizado em" no acompanhamento.

## Regras
- Nunca apague uma linha da tabela de pendências, mesmo fechada — é histórico.
- Se o repositório do aluno estiver com issues desabilitadas, habilite antes
  (`gh repo edit <repo> --enable-issues`).
- Em caso de ambiguidade sobre reabrir/confirmar um fechamento, sempre pergunte ao orientador —
  nunca decida sozinha.
