---
name: tcc-50-revisar
description: Revisa o TCC (Typst em docs/TCC do repositório do aluno) contra a estrutura recomendada e as regras DEVE / NÃO DEVE de cada seção (normas/conteudo-por-secao.md) e contra as normas ABNT (NBR 14724, 6028, 10520, 6023, 6024, 6027). É chamada pela tcc-20-orientar em toda sessão (passo 20.2), em todas as etapas de 00 a 09, e também pode ser chamada direto quando o orientador pedir para "revisar", "checar a formatação" ou "revisar o ABNT".
---

# tcc-50-revisar

Leia antes de agir: `contrato/contrato-de-acesso.md`, `normas/conteudo-por-secao.md` e
`normas/normas-abnt-detalhado.md`. O texto do aluno é **somente leitura**: todo problema vira uma
linha de pendência no acompanhamento. Esta skill nunca corrige o `.typ` nem cria issue.

## Escopo por etapa

A revisão acontece em **toda sessão** de orientação. O escopo depende da `etapa_atual`:

| Etapa | O que revisar |
|---|---|
| 00 | A proposta inicial: tema, problema candidato, escopo. Se já houver `docs/TCC`, só as regras EST |
| 01 a 08 | As seções da etapa (ver `etapas/NN-*.md`), com todas as regras delas, **mais** as regras `auto` de todas as seções que já existem no texto |
| 08 | Também o resumo e o abstract (RSM-01 a RSM-04 e NBR 6028) — não deixar para a 09 |
| 09 | O documento inteiro: todas as regras de conteúdo, PRE, POS e a ABNT completa |

As regras `auto` valem sempre, em qualquer etapa. Exemplos: hipótese fora da 1.3 (INT-06),
objetivos específicos em lista numerada (INT-11), justificativa antes dos objetivos (INT-14),
seções fora de ordem (EST-01).

## Fluxo de trabalho
1. Resolva o `slug`, atualize `alunos/<slug>/` (`git submodule update`) e localize
   `alunos/<slug>/<tcc_dir>/main.typ` (padrão `docs/TCC/`). Se não estiver lá, siga
   "Repositório fora do padrão" em `contrato/estrutura-repo-aluno.md`.
2. **Estrutura (EST).** Extraia os títulos (`=`, `==`, `===`) e compare com a estrutura
   recomendada: ordem, seções ausentes, seção de um capítulo dentro de outro, seções vazias,
   placeholders do template.
3. **Checagens automáticas no Typst**, sempre:
   - Posição da hipótese: conteúdo de hipótese ou proposta de solução só na 1.3 (INT-06, INT-07).
   - Tipo de lista na 1.5: itens com `-` são aceitos; `+`, `1.`, `a)` ou parágrafo corrido viram
     pendência (INT-11). Conte os itens: de 3 a 5 (INT-12).
   - Ordem 1.4 → 1.5 → 1.6 (INT-14) e 1.7 coerente com os capítulos reais (INT-17).
   - Listagens longas de código no corpo e figuras sem fonte ou sem citação (DES-02, DES-03).
   - Trabalhos correlatos como capítulo próprio (3), entre o referencial (2) e a metodologia (4)
     (COR-01, EST-01); correlatos dentro do referencial ou da metodologia viram pendência.
   - Resumo/abstract quando existirem: 150 a 500 palavras, parágrafo único, 3 a 6 palavras-chave
     separadas por `;` (RSM-01, RSM-03).
   - ABNT: citações `(AUTOR, ano)` × referências, numeração de seções até 5 níveis sem saltos,
     sumário × títulos, referências em ordem alfabética (ver o "Resumo executivo" de
     `normas/normas-abnt-detalhado.md`).
4. **Leitura crítica** das regras `leitura` da etapa: coerência problema ↔ hipótese ↔ objetivos
   ↔ metodologia ↔ resultados ↔ considerações, qualidade da discussão teórica, correspondência
   entre texto e código (DES-07, lendo o código do repositório nas etapas 06 e 07).
   **Trabalhos correlatos (capítulo 3):** para cada trabalho analisado, confira objetivo, solução
   e lacuna (COR-03). Uma pendência por trabalho incompleto, apontado por autor e ano, sem
   reproduzir o texto do aluno; lacuna ausente é prioridade alta, objetivo ou solução ausentes são
   média. Label `cap-correlatos`.
5. **Registrar.** Para cada problema, uma linha de pendência em
   `registro/acompanhamento/<slug>.md`, seção 3 (mesmo formato da `tcc-40-solicitar`):
   Localização (`docs/TCC/main.typ:120`), Citação curta, Diagnóstico começando pelo código da
   regra (ex.: `INT-11: ...`), Sugestão com ação concreta, Prioridade, Labels (capítulo +
   natureza; `abnt` para formatação, `estrutura` para EST, `codigo` para DES-07), Estado
   `pendente`. Não duplique pendência que já existe aberta — atualize a existente.
6. **Correções.** Pendência `criada #N` que o aluno corrigiu passa para
   `corrigida aguardando validação`. Problema que voltou depois de fechado vira `reincidente`.
7. **Entregar.** Checklist consolidado por regra (ok / pendente / n/a), agrupado por seção, para
   a pauta da `tcc-20-orientar`.

## Regras
- Nunca reproduza trechos longos do TCC na resposta — só o necessário para localizar.
- Se o documento não existir, aceite um trecho colado pelo orientador — não bloqueie a revisão.
- Preferência de estilo do orientador que não é regra vai no Histórico, não nas pendências.
- Toda pendência baseada em regra cita o código da regra no acompanhamento. O código é interno:
  nas issues do aluno ele é trocado por uma descrição detalhada da regra (ver `tcc-60-sincronizar`).
