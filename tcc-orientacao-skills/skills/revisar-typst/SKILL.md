---
name: revisar-typst
description: Revisa o documento Typst de um TCC contra as normas ABNT (NBR 14724, 6028, 10520, 6023, 6024, 6027) usando normas/normas-abnt-detalhado.md, e contra o checklist de conteúdo da etapa atual. Use antes de uma entrega parcial, antes da revisão final pré-defesa, ou sempre que o orientador pedir para "checar a formatação" ou "revisar o ABNT" de um TCC.
---

# revisar-typst

Leia `contrato/contrato-de-acesso.md`. Texto do aluno é **somente leitura**; todo problema
encontrado vira uma linha de pendência no acompanhamento — esta skill nunca corrige o `.typ`
do aluno nem cria issue diretamente.

Esta skill é chamada em **vários pontos do processo**, não só uma vez no fim:
- Em revisões parciais, ao longo das etapas.
- **Assim que o resumo/abstract existir** no documento (normalmente logo depois da conclusão —
  ver `etapas/07-conclusao.md`) — a checagem de 150–500 palavras + estrutura IMRaD (NBR 6028)
  acontece **aqui**, não fica guardada para a revisão final. Deixar para o fim tira o tempo que
  o aluno teria para reescrever com calma.
- Na revisão final pré-defesa (`etapas/08-preparacao-defesa.md`), cobrindo o documento inteiro —
  nesse ponto o resumo já deveria estar validado; se não estiver, é sinal de que a etapa 07 foi
  pulada.

## Fluxo de trabalho
1. Resolva o `slug`, garanta que `alunos/<slug>/` está atualizado (`git submodule update`).
2. Leia `normas/normas-abnt-detalhado.md` — use a seção 9 (checklist automatizável) como roteiro
   de verificação mecânica, e as seções 1–8 para justificar cada apontamento pela norma correta.
3. Rode as checagens automatizáveis:
   - Contagem de palavras do resumo/abstract (150–500, NBR 6028)
   - Resumo é parágrafo único, sem citação
   - 3–6 palavras-chave separadas por `;`
   - Toda citação `(AUTOR, ano)` tem referência correspondente e vice-versa (NBR 10520/6023)
   - Numeração de seção não ultrapassa 5 níveis, sem saltos (NBR 6024)
   - Sumário bate com os títulos reais (NBR 6027)
   - Referências em ordem alfabética
4. Para os itens que exigem leitura crítica (coerência objetivos↔metodologia↔resultados,
   qualidade da discussão teórica), avalie o texto e registre como pendência quando fraco —
   sem confundir com opinião de estilo pessoal.
5. Para cada problema encontrado, registre uma linha de pendência em
   `registro/acompanhamento/<slug>.md` (mesmo formato de `registrar-solicitacao`): Localização,
   Citação, Diagnóstico (citando a norma), Sugestão (ação concreta), Prioridade, Labels
   (sempre incluir `abnt` quando for questão de formatação), Estado `pendente`.
6. Entregue ao orientador um checklist consolidado com status por item (ok / pendente / n/a),
   sem repetir o texto do aluno além do necessário para localizar o problema.

## Regras
- Nunca reproduza trechos longos do TCC do aluno na resposta — cite só o necessário para
  localizar o problema (poucas palavras).
- Se o documento não for encontrado em `alunos/<slug>/`, pergunte ao orientador o caminho ou
  aceite um trecho colado como alternativa — não bloqueie a revisão por isso.
- Itens de estilo/preferência pessoal do orientador (não normativos) vão no Histórico, não na
  tabela de pendências rastreáveis — pendência rastreável é reservada a algo que o aluno
  precisa corrigir de fato.
