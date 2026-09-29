---
name: tcc-70-relatorio
description: Gera um relatório consolidado da situação de todos os orientandos (ou de um subconjunto) — etapa atual, pendências abertas, prazos regimentais próximos. Use antes de reuniões de colegiado, quando o orientador perguntar "como estão meus orientandos" ou "quem está atrasado", ou periodicamente para acompanhar a turma.
---

# tcc-70-relatorio

Leia `contrato/contrato-de-acesso.md`. Esta skill só lê — nunca grava no acompanhamento nem mexe
em issues.

## Fluxo de trabalho
1. Leia `registro/orientandos.yaml` inteiro (todos com `status: em andamento`, a menos que o
   orientador peça um filtro).
2. Para cada orientando, leia `registro/acompanhamento/<slug>.md`: histórico recente,
   pendências com Estado diferente de `fechada confirmada`, `rejeitada` e `n/a`.
3. Cruze com os prazos regimentais de `etapas/09-defesa.md` (e de
   `normas/regimento-tcc-ads-ifba-saj.md`, quando existir): banca com 15 dias mínimos de leitura
   antes da defesa; até 30 dias para reformulação depois da defesa; versão final 15 dias antes da
   colação de grau.
4. Monte uma tabela: Aluno | Etapa atual (00 a 09) | Pendências abertas (alta/média/baixa) |
   Última sessão | Próximo prazo | Observação.
5. Destaque no topo quem está com pendência de prioridade alta há mais tempo, sem sessão há mais
   de uma semana, ou com prazo regimental próximo.

## Regras
- Não invente prazos: se um prazo não estiver registrado, reporte a ausência da informação.
- Um relatório consolidado numa resposta só, a menos que o orientador peça um por aluno.
