---
name: registrar-solicitacao
description: Registra um pedido ou apontamento do orientador para um aluno (correção, ajuste, tarefa) na tabela de Pendências rastreáveis do acompanhamento. Use sempre que o orientador disser algo como "pede pro aluno corrigir X", "anota que ele precisa fazer Y", ou relatar um problema encontrado no TCC que o aluno deve resolver. Não cria a issue no GitHub — isso é feito depois pela sincronizar-issues.
---

# registrar-solicitacao

Leia `contrato/contrato-de-acesso.md` antes de agir. Esta skill **nunca** chama `gh issue
create` — só grava no acompanhamento. A issue nasce depois, quando `sincronizar-issues` rodar.

## Fluxo de trabalho
1. Resolva o `slug` do aluno.
2. Monte a linha da pendência com todos os campos da tabela "Pendências rastreáveis":
   - **Localização**: capítulo/arquivo/linha, o mais específico possível.
   - **Citação**: trecho literal do texto do aluno, se aplicável.
   - **Diagnóstico**: o problema, em uma frase.
   - **Sugestão**: o que o aluno deve fazer — ação concreta, autocontida (a issue vai mostrar
     só isso), com passos numerados quando fizer sentido.
   - **Prioridade**: alta / média / baixa.
   - **Labels**: escolha da taxonomia em `contrato/contrato-de-acesso.md` (capítulo + natureza +
     prioridade, mais `entregavel` se bloquear a entrega).
   - **Estado**: sempre `pendente` ao criar.
3. Anexe a linha em `registro/acompanhamento/<slug>.md`, seção 3, sem apagar linhas existentes.
4. Confirme ao orientador o que foi registrado e informe que a issue será aberta na próxima
   sincronização (ou ofereça rodar `sincronizar-issues` agora, se o orientador quiser).

## Regras
- Uma solicitação = uma linha. Não agrupe vários problemas diferentes em uma linha só.
- Se o orientador pedir algo que não é uma pendência acionável pelo aluno (ex.: uma nota pessoal
  do orientador), registre no Histórico (seção 2), não na tabela de pendências.
