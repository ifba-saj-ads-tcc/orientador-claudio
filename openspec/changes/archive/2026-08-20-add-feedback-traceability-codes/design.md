## Context

As skills `tcc-*` produzem feedback em tabelas de diagnóstico e persistem pendências no Anexo de Acompanhamento (`anexo-acompanhamento.md`), única área gravável. Sem identificador estável, a reavaliação entre rodadas depende de interpretação textual. O repositório do TCC é **privado** (`ifba-saj-ads-tcc/tcc-Pedro-Victor-Hipolito-Cabral`) e o `gh` CLI está autenticado. O Anexo é um arquivo **separado** do TCC (nunca entra no documento entregue; deve ser excluído do material final). O orientador deseja rastreabilidade via **issues do GitHub** e acesso **offline** ao estado por meio do anexo.

## Goals / Non-Goals

**Goals:**
- Tratar cada feedback como issue; o número da issue é o identificador de rastreabilidade estável.
- Representar o ciclo de vida da pendência pelo estado da issue (open/closed/reopened).
- Codificar as siglas como labels (domínio, tipo, prioridade, categoria procedural).
- Manter no anexo um espelho de issues para leitura offline, sincronizado por rodada e por GitHub Action.
- Manter o TCC como somente leitura.

**Non-Goals:**
- Não implementar banco de dados ou serviço de rastreamento próprio.
- Não alterar a rubrica de análise da fundamentação.
- Não editar o texto do TCC.
- Não automatizar o julgamento semântico de nova/resolvida/reincidente (a decisão cabe ao orientador).
- Não incluir o anexo no documento entregue (o anexo é material de trabalho separado).

## Decisions

**D1 — Issues como fonte de verdade.**
Cada feedback vira uma issue no repo privado. O **número da issue** é o código de rastreabilidade (estável, global, legível). As issues são criadas/atualizadas via `gh` pelas skills.
- *Alternativas consideradas:* códigos manuais no markdown (`TC-001`) — descartado por não ter ciclo de vida nativo nem histórico estruturado; UUID — descartado por ilegível.
- *Por quê:* o GitHub já provê ID estável, estado, histórico de comentários e filtros.

**D2 — Ciclo de vida = estado da issue.**
`open` (nova/pendente) → `closed` (resolvida) → `reopened` (reincidente). A reavaliação em nova versão fecha ou reabre a mesma issue e comenta a rodada. Não se cunha número novo para pendência conhecida.
- *Por quê:* mapeia 1:1 com o modelo nova/resolvida/reincidente e o GitHub rastreia reaberturas.

**D3 — Labels como siglas.**
Taxonomia de labels combináveis por issue:

| Dimensão | Labels |
|---|---|
| Domínio/capítulo | `cap-introducao`, `cap-fundamentacao`, `cap-metodologia`, `cap-desenvolvimento`, `cap-resultados`, `cap-conclusao` |
| Tipo de apontamento | `fato`, `fonte`, `formato`, `coerencia`, `abnt`, `seguranca` |
| Prioridade | `prio-alta`, `prio-media`, `prio-baixa` |
| Categoria procedural | `entregavel` (ex.: remoção do anexo) |

- *Alternativas consideradas:* sigla embutida no código (`FATO-01`) — descartado, pois labels permitem múltiplas dimensões simultâneas e filtros.

**D4 — Espelho offline no Anexo.**
A seção **3. Espelho de issues** substitui a antiga tabela manual de pendências. Colunas: `#`, `Labels`, `Título`, `Estado`, `Prioridade`, com link para a issue e carimbo de data de atualização + aviso de que a fonte de verdade são as issues no GitHub.
- *Por quê:* mantém o anexo como o ponto de leitura offline, sem duplicar como fonte independente (é projeção rotulada e datada).
- *Impacto:* atualizar `_shared/anexo-acompanhamento.md` e `_shared/contrato-e-decisoes.md`.

**D5 — Sincronização em dois mecanismos.**
1. **Por rodada (Opção 1):** cada skill, ao concluir uma rodada, consulta as issues via `gh` e reescreve o espelho no anexo, registrando a data.
2. **GitHub Action (Opção 2):** workflow disparado em eventos `issues` e `issue_comment` que regenera o espelho e commita a atualização.
- *Por quê:* a rodada garante frescor no momento do trabalho; o Action cobre mudanças entre rodadas. O espelho é committado para estar disponível no clone offline.
- *Alternativa:* apenas um mecanismo — descartado por deixar lacunas (rodada cobre trabalho, Action cobre tempo ocioso).

**D6 — Pendência de remoção do anexo (caminho a).**
Como o anexo nunca entra no documento, a pendência é **"excluir `anexo-acompanhamento.md` do material entregue"**, rastreada como issue com label `entregavel`. Gatilho determinístico: presente no material → aberta; ausente → fechada.
- *Por quê:* semântica correta para arquivo separado; sem código reservado especial — é uma issue procedural como qualquer outra.

**D7 — Reframe do contrato.**
A "área gravável" passa a ser **issues (GitHub) + espelho do anexo**. O TCC permanece somente leitura. A mudança é registrada em `_shared/contrato-e-decisoes.md`.

## Risks / Trade-offs

- [Issues mudam fora de uma rodada → espelho defasado] → GitHub Action regenera o espelho; carimbo de data sinaliza defasagem.
- [Acesso a repo privado para criar issues] → `gh` já autenticado; skills executam via CLI com escopo `repo`.
- [Action escrevendo no repo (concorrência com skills)] → Gate de conflito: Action só regenera o espelho; skills não concorrem no mesmo commit simultaneamente (aceito; reverte-se facilmente).
- [Migração de pendências antigas do anexo] → Na primeira rodada pós-mudança, pendências existentes viram issues abertas com labels conforme o conteúdo.
- [Anexo sem código se espelho vazio] → Espelho vazio é um estado válido (sem pendências); a seção permanece com o carimbo de data.

## Migration Plan

1. Atualizar `_shared/contrato-e-decisoes.md` (issues como fonte de verdade, taxonomia de labels, formato do espelho).
2. Atualizar `_shared/anexo-acompanhamento.md` (seção 3 vira Espelho de issues).
3. Ajustar as quatro skills para criar/atualizar issues e refrescar o espelho.
4. Migrar pendências existentes do anexo real para issues abertas com labels.
5. Adicionar o GitHub Action de sincronização do espelho.
6. Rollback: remover o espelho e o Action, retornando à tabela manual de pendências.

## Open Questions

- Resolvidas: sincronização (Opções 1 e 2, decididas pelo orientador); labels como siglas (decidido); remoção do anexo como issue `entregavel` (decidido).