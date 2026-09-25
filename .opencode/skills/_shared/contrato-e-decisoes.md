# Contrato e Decisões Transversais da Família `tcc-*`

Referência compartilhada para todas as skills `tcc-*`. Leia antes de produzir saída ou gravar.

## Contrato de acesso

- **Texto do TCC (`.md` / `.typ`): SOMENTE LEITURA.** Nenhuma skill edita, reformata ou corrige o texto do aluno. Todo diagnóstico vira **sugestão** de mudança.
- **Anexo de Acompanhamento:** única área gravável. Em modo multi-aluno: `acompanhamento/<id>.md` por aluno (versionado no `orientador-llm`); em modo legado single-repo: `anexo-acompanhamento.md` na raiz. Registra marcos, histórico e **espelho de issues**.
- **Texto do TCC (`alunos/<id>/`): SOMENTE LEITURA.** Submodules em `alunos/<id>/` (fork do template) nunca recebem commit deste repo (pre-commit hook bloqueia).
- **Issues do GitHub = fonte de verdade das pendências** (ver seção "Rastreabilidade por issues").
- **Modelo do anexo:** copie de `_shared/anexo-acompanhamento.md` quando for criá-lo (destino: `acompanhamento/<id>.md` em multi-aluno).
- **Registro de orientandos:** `alunos.json` é a fonte de verdade única (`{ alunos: [{ id, repo, branch }] }`); `.gitmodules` é derivado. Um anexo por aluno — sem colisão.

## Rastreabilidade por issues (anexo-first, gate tcc-00)

- **Anexo é fonte do conteúdo; GitHub é projeção do estado.** Toda pendência acionável é gravada primeiro no Anexo como linha rica (`Localização | Citação | Diagnóstico | Sugestão | Prioridade | Labels | Body replay | Estado | Comentários`) com `Estado: pendente`. A issue no GitHub é criada exclusivamente por `tcc-00-sync-issues`.
- **Gate tcc-00:** apenas `tcc-00-sync-issues` executa `gh issue create/edit/comment/close/reopen` e `gh label create` (ensure-labels). Skills `tcc-01`–`tcc-07` SHALL NOT chamar `gh issue create` diretamente; elas apenas registram pendências no Anexo. O filtro "só pendência que o aluno deve resolver vira issue" é aplicado por `tcc-00`.
- Cada **feedback/pendência** que vira issue no repositório do TCC (privado) usa o **número da issue** como código de rastreabilidade — estável, único e legível. Antes de criada, usa `— pendente`.
- **Repositório alvo:** as issues devem ser abertas **no repositório do aluno** (`repo` de `alunos.json`) e **nunca no `orientador-llm` nem no upstream do template**. Ao operar com `gh`, sempre passe `--repo <repo-do-aluno>` derivado de `alunos.json` (ou `ALUNO` env). Em modo legado, `--repo` aponta para o repo atual.
- **Issues desabilitadas:** se o repositório do TCC estiver com issues desabilitadas, **habilite-as** com `gh repo edit <repo-do-TCC> --enable-issues` antes de criar issues.
- **Ciclo de vida** da pendência = estado no Anexo (`pendente | criada #N | falha: <erro> | corrigida aguardando validacao | reincidente | fechada confirmada | reaberta | rejeitada | n/a`) espelhado no estado da issue GitHub (`open/closed/reopened`). `corrigida aguardando validacao` é estado intermediário gravado pela skill `tcc-*` quando reavaliação detecta correção no texto — fica visível na tabela como "skill verificou, falta validar" antes de qualquer `tcc-00`; no momento do `tcc-00`, **manter** esse estado equivale a concordância do orientador e SHALL promover para `fechada confirmada` e fechar a issue (sem prompt); alterar para outro estado reabre/mantém conforme regra. `rejeitada` é decisão exclusiva do orientador, sem justificativa obrigatória: mantém a linha no Anexo com `#` preservado (não reutilizado) mas SHALL NOT gerar issue; `tcc-00` SHALL ignorar `rejeitada`/`n/a` (não cria/atualiza) e SHALL fechar issue preexistente se houver. Transição `rejeitada`→`pendente` recria issue idempotentemente. `tcc-00` sincroniza via dupla: ao detectar `CLOSED` no GitHub, appenda comentário na coluna `Comentários` (thread completa) e registra no Histórico §2, solicitando validação do orientador antes de reabrir/confirmar. Não se cria duplicata.
- As "siglas" são **labels** do GitHub, combináveis por issue; `tcc-00` garante `ensure-labels` antes do create.
- O Anexo mantém **pendências rastreáveis** (§3) com todos os campos ricos e coluna `Comentários` (thread), permitindo leitura offline e replay idempotente mesmo sem `gh` auth. O carimbo de data indica a última sincronização via `tcc-00`.

### Taxonomia de labels

| Dimensão | Labels |
|----------|--------|
| Domínio/capítulo | `cap-introducao`, `cap-fundamentacao`, `cap-metodologia`, `cap-desenvolvimento`, `cap-resultados`, `cap-conclusao` |
| Tipo de apontamento | `fato`, `fonte`, `formato`, `coerencia`, `abnt`, `seguranca` |
| Prioridade | `prio-alta`, `prio-media`, `prio-baixa` |
| Categoria procedural | `entregavel` (ex.: remoção do anexo do material entregue) |

## D8 — Skills auto-contidas (invocação parcial)

A família atende TCCs em fases diferentes; **qualquer skill pode ser a primeira (ou única) a ser chamada**. Regras:

1. **Descubra/colete seu contexto:** leia o texto do aluno (se houver), leia o anexo (se existir). Na ausência de ambos, **pergunte ao orientador o mínimo necessário**.
2. **A saída ao orientador é sempre produzida**, independentemente de o anexo existir.
3. **Crie o anexo apenas se houver algo a persistir para uma rodada futura.** Em invocação única (ex.: só `tcc-06-revisao-final`), a entrega é a análise/checklist e a criação do anexo é opcional.

## D9 — Descoberta do texto por glob

1. **Modo multi-aluno** (quando `alunos.json` existe e `aluno=<id>` resolvido): varra `alunos/<id>/**/*.md` e `alunos/<id>/**/*.typ`. Exclua `acompanhamento/` e `.opencode/`. Ao iniciar, imprima `aluno@<sha-curta>` e avise se `origin/<branch>` está à frente.
2. **Modo legado** (single-repo): varra `**/*.md` e `**/*.typ` na raiz, excluindo `anexo-acompanhamento.md` e `.opencode/`.
3. Resolução do aluno: parâmetro `aluno=<id>` > variável `ALUNO` > prompt interativo se ambíguo.
4. Se não encontrar, **pergunte ao orientador** onde estão ou aceite **trecho colado** como fallback.

## Sincronização multi-aluno

- `alunos.json` é a fonte de verdade; `.gitmodules` é derivado (com `branch = <branch>` por submodule).
- Atualize com `scripts/sync-alunos.sh` (ou `git submodule update --remote --merge -- alunos/<id>`). `git pull` + sync traz a ponta dos forks.
- Action `sync-alunos.yml` verifica em cron/manual sem commitar automaticamente.

## Ordem de chamada (numeração)

`tcc-01-concepcao` → `tcc-02-estrutura` → `tcc-03-cronograma` → `tcc-04-fundamentacao` → `tcc-05-acompanhamento` → `tcc-06-revisao-final` → `tcc-07-apresentacao`.

A numeração reflete o ciclo de vida, mas:
- `03`, `04` e `05` formam um **loop de acompanhamento**: a `05` aciona a `04` quando o capítulo entregue é o de fundamentação, e ambos atualizam o anexo.
- A invocação parcial (D8) permite entrar em qualquer fase.

## Saída padrão de feedback (tabela rica transversal)

> **Nível de exigência:** toda avaliação de texto segue `_shared/rubrica-rigor-textual.md` — coerência, fluidez, ausência de redundância e correta colocação de conteúdo — com rigor de TCC de nível superior, em todas as rodadas e capítulos. Aplicável a qualquer skill `tcc-01`–`tcc-07` quando houver pendência acionável.

| Issue | Localização | Citação do aluno | Diagnóstico | Sugestão ao orientador | Prioridade | Labels | Estado | Comentários |
|-------|-------------|------------------|-------------|------------------------|------------|--------|--------|-------------|

- **Issue:** número da issue (`#N`) ou `— pendente` se ainda não criada via `tcc-00`.
- **Localização:** capítulo/seção/linha (ex.: `Cap. 2 §2.3`, `arquivo.md:120`).
- **Citação do aluno:** trecho literal para o orientador localizar rápido.
- **Diagnóstico:** problema identificado (vinculado à rubrica e a `fato/fonte/formato/coerencia/abnt/seguranca`).
- **Sugestão ao orientador:** encaminhamento descritivo e auto-contido (nunca edição direta) — SHALL conter ação específica com localização + explicação inline de siglas/normas/conceitos na primeira ocorrência (ex.: `IMRaD (Introdução-Métodos-Resultados-Discussão)`, `NBR 6028:2021 — resumo 150–500 palavras`) + passos numerados (2–4) + critério de verificação (como orientador/aluno confirma que está ok). Deve ser legível isolada no comentário da issue (3–5 linhas); tabela do Anexo pode ficar larga. Ex.: `Reescrever resumo (main.typ:7) e abstract (main.typ:9) em parágrafo único de 150–500 palavras (NBR 6028:2021) com estrutura IMRaD (Introdução-problema/fragmentação 190/192/193; Métodos-arquitetura OpenRouter/validação JSON; Resultados-benchmark 7×4 com Gemini; Discussão-viabilidade + limitação N=1). Passos: 1) contar palavras, 2) checar cada letra do IMRaD, 3) espelhar PT/EN. Critério: NBR 6028 ok + orientador aprova redação.`
- **Prioridade:** alta / média / baixa.
- **Labels:** `cap-*`, `fato/fonte/...`, `prio-*`, `entregavel` (ver Taxonomia).
- **Estado:** `pendente | criada #N | falha: <erro> | corrigida aguardando validacao | reincidente | fechada confirmada | reaberta | rejeitada | n/a` (`corrigida aguardando validacao` = skill verificou correção, falta validar via `tcc-00` — manter = concordar; `rejeitada` = descartada pelo orientador, não gera issue, preserva `#`).
- **Comentários:** thread completa de comentários do GitHub (append, nunca overwrite).

Toda skill `tcc-01`–`tcc-07` que identificar pendência acionável SHALL gravar a linha rica no Anexo com `Estado: pendente` e Body replay (`Localização+Citação+Diagnóstico+Sugestão`) — sem chamar `gh`. A criação da issue é exclusiva de `tcc-00`. A tabela é o esqueleto; pode ser complementada por resumo executivo e pontos para a reunião.