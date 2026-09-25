---
name: relatorio-acompanhamento
description: Gera um relatório consolidado do status de todos os orientandos (ou de um subconjunto) — etapa atual, pendências abertas, prazos regimentais próximos do vencimento. Use antes de reuniões de colegiado, quando o orientador perguntar "como estão meus orientandos" ou "quem está atrasado", ou periodicamente para acompanhar uma turma inteira.
---

# relatorio-acompanhamento

Leia `contrato/contrato-de-acesso.md`. Esta skill só lê — nunca grava em acompanhamento nem
mexe em issues.

## Fluxo de trabalho
1. Leia `registro/orientandos.yaml` inteiro (todos os `status: em andamento`, a menos que o
   orientador peça um filtro).
2. Para cada orientando, leia `registro/acompanhamento/<slug>.md`: etapa atual, marcos com
   status, pendências com Estado diferente de `fechada confirmada`/`rejeitada`/`n/a`.
3. Cruze com os prazos regimentais relevantes (ver `etapas/08-preparacao-defesa.md` e
   `normas/regimento-tcc-ads-ifba-saj.md`, quando existir): banca precisa de 15 dias mínimos de
   leitura antes da defesa; pós-defesa há até 30 dias para reformulação; entrega final 15 dias
   antes da colação de grau.
4. Monte uma tabela consolidada: Aluno | Etapa atual | Pendências abertas (alta/média/baixa) |
   Próximo prazo relevante | Observação.
5. Destaque no topo quem está com pendência de prioridade alta há mais tempo, ou com prazo
   regimental próximo.

## Regras
- Não invente prazos: se um prazo não estiver registrado em lugar nenhum, não presuma — apenas
  reporte a ausência dessa informação.
- Relatório sempre em uma única resposta consolidada, não um por aluno, a menos que pedido.
