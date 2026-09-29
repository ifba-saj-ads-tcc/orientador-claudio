---
name: tcc-40-solicitar
description: Registra um pedido avulso do orientador para um aluno (correção, ajuste, tarefa) na tabela de Pendências rastreáveis do acompanhamento. Use quando o orientador disser "pede pro aluno corrigir X", "anota que ele precisa fazer Y", ou relatar um problema fora de uma sessão da tcc-20-orientar. Não cria a issue no GitHub — isso é feito depois pela tcc-60-sincronizar.
---

# tcc-40-solicitar

Leia `contrato/contrato-de-acesso.md` antes de agir. Esta skill **nunca** chama
`gh issue create` — só grava no acompanhamento. A issue nasce quando a `tcc-60-sincronizar` rodar.

## Fluxo de trabalho
1. Resolva o `slug` do aluno.
2. Monte a linha da pendência com todos os campos da tabela "Pendências rastreáveis":
   - **Localização**: seção e arquivo/linha, o mais específico possível
     (ex.: `1.5 · docs/TCC/main.typ:88`).
   - **Citação**: trecho literal curto do texto do aluno, se aplicável.
   - **Diagnóstico**: o problema, em uma frase. Se viola uma regra de
     `normas/conteudo-por-secao.md`, comece pelo código (ex.: `INT-07: hipótese dentro da
     contextualização`).
   - **Sugestão**: ação concreta e autocontida (a issue mostra só isso), com passos numerados
     quando fizer sentido.
   - **Prioridade**: alta / média / baixa.
   - **Labels**: capítulo + natureza + prioridade, da taxonomia do contrato; `entregavel` se
     bloquear a entrega.
   - **Estado**: sempre `pendente` ao criar.
3. Anexe a linha em `registro/acompanhamento/<slug>.md`, seção 3, sem apagar linhas existentes.
4. Confirme ao orientador o que foi registrado e ofereça rodar a `tcc-60-sincronizar`.

## Regras
- Uma solicitação = uma linha. Não agrupe problemas diferentes.
- Nota pessoal do orientador que não é tarefa do aluno vai no Histórico (seção 2).
