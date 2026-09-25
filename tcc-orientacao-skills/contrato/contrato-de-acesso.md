# Contrato de Acesso e Escrita — leitura obrigatória para todas as skills

Este arquivo define as regras que **toda skill** deste repositório deve respeitar.
Nenhuma skill grava fora do que está autorizado aqui.

## Onde cada skill pode escrever

| Local | Pode escrever? | Skill autorizada |
|---|---|---|
| Repo do aluno (`alunos/<slug>/`, submódulo): texto do TCC em `docs/TCC/` e código do projeto | **Nunca** | Nenhuma — sempre somente leitura |
| `registro/acompanhamento/<slug>.md` | Sim | `registrar-solicitacao`, `orientar-etapa`, `revisar-typst`, `registrar-frequencia` |
| Issues no GitHub do aluno | Sim, **só uma skill** | `sincronizar-issues` — nenhuma outra skill chama `gh issue create/edit/close/comment` |
| `registro/orientandos.yaml` | Sim | `gerenciar-orientandos` |

Toda skill que identifica um problema no texto do aluno registra uma **linha rica** em
`registro/acompanhamento/<slug>.md` — nunca edita o texto do aluno e nunca cria a issue
diretamente. Quem transforma isso em issue é sempre a `sincronizar-issues`.

A estrutura esperada do repositório do aluno (código + `docs/TCC/`) está em
`contrato/estrutura-repo-aluno.md`.

## Por que um único ponto de escrita no GitHub

Evita issue duplicada, mantém um único lugar responsável por idempotência, e permite que o
acompanhamento funcione **mesmo offline** (sem `gh` autenticado) — as pendências ficam
registradas no arquivo local e são sincronizadas depois.

## Máquina de estados de uma pendência

```
pendente ──► criada #N ──► corrigida aguardando validação ──► fechada confirmada
   │              │                                               ▲
   │              └──► reincidente ─────────────────────────────┘
   │
   └──► rejeitada (decisão do orientador, não vira issue, número preservado)
```

- **pendente**: registrada no acompanhamento, ainda não existe issue.
- **criada #N**: `sincronizar-issues` já abriu a issue; `#N` é o código de rastreabilidade.
- **corrigida aguardando validação**: uma skill de revisão detectou que o aluno corrigiu, mas o
  orientador ainda não confirmou. Manter esse estado na próxima sincronização **equivale a
  aprovar** — a skill promove automaticamente para `fechada confirmada` e fecha a issue.
- **reincidente**: o problema voltou a aparecer depois de fechado.
- **fechada confirmada**: encerrada de fato, permanece no histórico.
- **rejeitada**: o orientador decidiu que não procede — nunca vira issue; se já existia issue
  aberta, ela é fechada.
- **n/a**: não se aplica a este TCC; ignorada pela sincronização.

## Taxonomia de labels (GitHub)

| Dimensão | Valores |
|---|---|
| Capítulo | `cap-introducao`, `cap-referencial`, `cap-metodologia`, `cap-desenvolvimento`, `cap-resultados`, `cap-conclusao` |
| Natureza do apontamento | `fato`, `fonte`, `formato`, `coerencia`, `abnt`, `seguranca` |
| Prioridade | `prio-alta`, `prio-media`, `prio-baixa` |
| Procedural | `entregavel` (ex.: pendência que bloqueia a entrega final) |

`sincronizar-issues` garante que essas labels existam no repositório do aluno antes de usá-las
(cria as que faltarem, sem duplicar).

## Regra de auto-contenção

Qualquer skill pode ser chamada isoladamente (o orientando pode estar em qualquer fase).
Toda skill:
1. Tenta descobrir seu contexto sozinha (lê `registro/orientandos.yaml`, clona/atualiza o
   submódulo do aluno, lê o acompanhamento existente).
2. Sempre entrega uma resposta útil ao orientador, mesmo sem acompanhamento prévio.
3. Só cria/edita o arquivo de acompanhamento se houver algo que precise persistir para uma
   rodada futura.

## Descoberta do slug do aluno

Ordem de resolução: parâmetro explícito > única entrada correspondente em
`registro/orientandos.yaml` > pergunta ao orientador se houver ambiguidade.
