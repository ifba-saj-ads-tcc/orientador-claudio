# Contrato de Acesso e Escrita — leitura obrigatória para todas as skills

Este arquivo define as regras que **toda skill** deste repositório deve respeitar.
Nenhuma skill grava fora do que está autorizado aqui.

## Onde cada skill pode escrever

| Local | Pode escrever? | Skill autorizada |
|---|---|---|
| Repo do aluno (`alunos/<slug>/`, submódulo): texto do TCC em `docs/TCC/` e código do projeto | **Nunca** | Nenhuma — sempre somente leitura |
| `registro/acompanhamento/<slug>.md` | Sim | `tcc-20-orientar`, `tcc-30-frequencia`, `tcc-40-solicitar`, `tcc-50-revisar`, `tcc-60-sincronizar` (estado e comentários das issues) |
| Issues no GitHub do aluno | Sim, **só uma skill** | `tcc-60-sincronizar` — nenhuma outra skill chama `gh issue create/edit/close/comment` |
| `registro/orientandos.yaml` — entradas novas, `status`, dados do aluno | Sim | `tcc-10-cadastrar` |
| `registro/orientandos.yaml` — só os campos `etapa_atual` e `ultima_atualizacao` | Sim, **depois da confirmação do orientador** | `tcc-20-orientar` (passo 20.7) |

Toda skill que identifica um problema no texto do aluno registra uma **linha rica** em
`registro/acompanhamento/<slug>.md` — nunca edita o texto do aluno e nunca cria a issue
diretamente. Quem transforma isso em issue é sempre a `tcc-60-sincronizar`.

Quando o problema viola uma regra de `normas/conteudo-por-secao.md`, o Diagnóstico da pendência
começa pelo código da regra (ex.: `INT-11: objetivos específicos em lista numerada`).
O código é **de uso interno** do orientador: fica no acompanhamento e nunca aparece nas issues.
Na issue, a regra é explicada ao aluno por uma descrição detalhada, sem código nem citação
(ver `skills/tcc-60-sincronizar/SKILL.md`).

A estrutura esperada do repositório do aluno (código + `docs/TCC/`) está em
`contrato/estrutura-repo-aluno.md`. O fluxo de uso das skills está em `docs/fluxo-de-uso.md`.

## Mudança de etapa

Mudar de etapa é **sempre decisão do orientador**. No passo 20.7, a `tcc-20-orientar` mostra se o
checklist da etapa foi atendido e pergunta; só grava a etapa nova em `registro/orientandos.yaml`
depois de uma confirmação explícita. Nenhuma skill muda de etapa sozinha.

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
- **criada #N**: `tcc-60-sincronizar` já abriu a issue; `#N` é o código de rastreabilidade.
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
| Capítulo | `cap-proposta`, `cap-introducao`, `cap-referencial`, `cap-correlatos`, `cap-metodologia`, `cap-desenvolvimento`, `cap-resultados`, `cap-consideracoes`, `cap-pretextual`, `cap-pos-textual` |
| Natureza do apontamento | `estrutura`, `fato`, `fonte`, `formato`, `coerencia`, `abnt`, `codigo`, `seguranca` |
| Prioridade | `prio-alta`, `prio-media`, `prio-baixa` |
| Procedural | `entregavel` (ex.: pendência que bloqueia a entrega final) |

`tcc-60-sincronizar` garante que essas labels existam no repositório do aluno antes de usá-las
(cria as que faltarem, sem duplicar).
Pendências migradas do repositório antigo podem trazer labels anteriores (ex.: `cap-conclusao`,
`cap-fundamentacao`); elas continuam válidas nas issues já criadas e não precisam ser renomeadas.

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
