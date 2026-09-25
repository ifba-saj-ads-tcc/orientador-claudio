# Normas ABNT para Trabalhos Acadêmicos — Checklist de Validação

> Base para a skill `revisar-typst`. Cada regra abaixo cita a norma de origem
> e, quando possível, é redigida como item de checklist verificável.
> ⚠️ Sempre que o template Typst do curso ou um manual próprio do IFBA-SAJ
> divergir daqui, o template/manual institucional prevalece.

## Normas de referência utilizadas
- **NBR 14724** (2011/2024) — Trabalhos acadêmicos — Apresentação
- **NBR 6027:2012** — Sumário — Apresentação
- **NBR 6024:2012** — Numeração progressiva das seções
- **NBR 6028:2021** — Resumo, resenha e recensão — Apresentação
- **NBR 10520:2023** — Citações em documentos
- **NBR 6023:2018** (com atualizações posteriores) — Referências — Elaboração

---

## 1. Estrutura do documento (NBR 14724)

| Bloco | Elemento | Obrigatório? |
|---|---|---|
| Parte externa | Capa | Sim |
| Parte externa | Lombada | Não |
| Pré-textual | Folha de rosto | Sim |
| Pré-textual | Folha de aprovação | Sim |
| Pré-textual | Errata, dedicatória, agradecimentos, epígrafe | Não |
| Pré-textual | Resumo em português | Sim |
| Pré-textual | Resumo em língua estrangeira (abstract) | Sim |
| Pré-textual | Listas de ilustrações/tabelas/siglas/símbolos | Não |
| Pré-textual | Sumário | Sim |
| Textual | Introdução, Desenvolvimento, Conclusão | Sim |
| Pós-textual | Referências | Sim |
| Pós-textual | Glossário, apêndice, anexo, índice | Não |

**Checklist**
- [ ] Todos os elementos pré-textuais obrigatórios presentes
- [ ] Ordem dos elementos segue exatamente a tabela acima
- [ ] Nenhum capítulo do bloco textual ausente

## 2. Formatação física

- Papel A4; margens 3 cm (superior e esquerda), 2 cm (inferior e direita)
- Fonte tamanho 12 no corpo do texto; tamanho 10 em notas de rodapé, citações longas e legendas
- Espaçamento 1,5 entre linhas no corpo do texto; espaço simples em citações longas, notas de rodapé, referências, resumo e legendas
- Parágrafo com recuo de primeira linha (~1,25 cm)
- Paginação: contada a partir da folha de rosto, mas o número só aparece a partir do primeiro elemento textual (Introdução), no canto superior direito

**Checklist**
- [ ] Margens configuradas no template conforme acima
- [ ] Tamanhos de fonte diferenciados corpo/citações-notas
- [ ] Espaçamento correto por tipo de elemento
- [ ] Numeração de página visível só a partir da Introdução

## 3. Resumo e Abstract (NBR 6028)

- Extensão: **150 a 500 palavras** para trabalhos acadêmicos (TCC se enquadra aqui — diferente de artigo de periódico, que é 100–250)
- Um único parágrafo, **sem tópicos e sem marcadores**
- Redigido preferencialmente na terceira pessoa
- **Sem** citações, tabelas, fórmulas ou equações
- Estrutura recomendada: objetivo, metodologia, resultados e conclusão (resumo informativo)
- Palavras-chave: 3 a 6 termos, iniciais minúsculas, **separadas por ponto e vírgula**, com ponto final após a última
- Abstract obrigatório, com keywords traduzidas no mesmo padrão

**Checklist automatizável**
- [ ] Contagem de palavras do resumo entre 150 e 500
- [ ] Resumo é um único bloco de parágrafo (sem quebras internas de lista)
- [ ] Nenhuma citação (padrão "SOBRENOME, ano") dentro do resumo
- [ ] 3 a 6 palavras-chave, separadas por `;`
- [ ] Abstract presente e com o mesmo número de keywords do resumo

> ⚠️ **Quando checar**: assim que o resumo existir no texto — normalmente logo após a conclusão
> (ver `etapas/07-conclusao.md`) — e não apenas na revisão final pré-defesa. Resumo/abstract com
> problema é rápido de corrigir, mas só se sobrar tempo; descoberto em cima da defesa, vira
> pressa e piora a qualidade.

## 4. Citações (NBR 10520:2023)

- Sistema de chamada: autor-data (mais comum em TCC) ou numérico — escolher um e manter consistente em todo o documento
- Citação direta **curta** (até 3 linhas): entre aspas, no corpo do parágrafo
- Citação direta **longa** (4 linhas ou mais): bloco recuado 4 cm da margem esquerda, sem aspas, fonte menor, espaçamento simples
- Citação indireta (paráfrase): sem aspas, mas ainda exige a chamada autor-data
- No sistema autor-data, sobrenome em maiúsculas quando a chamada está entre parênteses; caixa normal quando o sobrenome aparece integrado à frase
- Vários autores citados juntos: separados por ponto e vírgula, em ordem alfabética
- "apud" (citação de citação) só deve ser usado quando não houve acesso à fonte original

**Checklist automatizável**
- [ ] Toda citação no padrão `(SOBRENOME, ano)` tem entrada correspondente em Referências
- [ ] Citações de mais de 3 linhas estão formatadas como bloco recuado, não como citação curta
- [ ] Sistema de chamada é único (não mistura autor-data com numérico)

## 5. Numeração progressiva das seções (NBR 6024)

- Algarismos arábicos, alinhados à esquerda
- Vai até a seção quinária (ex.: 3.1.1.1.1) — evitar ultrapassar esse nível
- Seções primárias (1, 2, 3...) normalmente iniciam em nova página
- A partir da seção secundária, os números são separados por ponto (3.1, 3.1.1), sem ponto após o último algarismo, antes do título

**Checklist**
- [ ] Nenhuma seção ultrapassa o 5º nível de profundidade
- [ ] Numeração sequencial sem saltos (não pula de 3.1 para 3.3 sem o 3.2, por exemplo)

## 6. Sumário (NBR 6027)

- Último elemento pré-textual
- Deve reproduzir exatamente a mesma grafia, ordem e numeração das seções do corpo do texto
- Deve indicar a página inicial de cada seção

**Checklist automatizável**
- [ ] Sumário gerado automaticamente (não digitado manualmente) — o template Typst deve cuidar disso
- [ ] Títulos do sumário batem 100% com os títulos reais das seções (checagem estrutural)

## 7. Referências (NBR 6023)

- Lista única, em ordem alfabética pelo sobrenome do primeiro autor (ou ordem numérica, se esse for o sistema de chamada escolhido)
- Elementos essenciais variam por tipo de fonte:
  - **Livro**: autor, título, edição, local, editora, ano
  - **Artigo de periódico**: autor, título do artigo, título do periódico, local, volume, número, páginas, ano
  - **Documento online**: os itens acima + disponível em: URL + acesso em: data
- Alinhamento à margem esquerda, espaço simples entre linhas de uma mesma referência, espaço duplo entre referências diferentes

**Checklist automatizável**
- [ ] Toda obra citada no texto aparece na lista de referências
- [ ] Toda referência listada é citada ao menos uma vez no texto
- [ ] Lista em ordem alfabética por sobrenome
- [ ] Nenhuma referência sem ano (ou "[s.d.]" quando de fato não houver data)

## 8. Estrutura interna do "Desenvolvimento" — IMRaD como boa prática

IMRaD (Introduction, Methods, Results, and Discussion) não é uma norma ABNT — é uma
convenção internacional de escrita científica. A NBR 14724 exige apenas
Introdução/Desenvolvimento/Conclusão como elementos textuais, mas **dentro do
"Desenvolvimento"**, é boa prática (e é o que a Ficha de Avaliação do Regimento
de TCC do ADS/IFBA-SAJ cobra) seguir a lógica IMRaD adaptada:

Introdução → Referencial Teórico (Fundamentação) → Metodologia → Resultados/Discussão → Conclusão

Isso já está refletido nos arquivos de `etapas/04` a `etapas/07` deste repositório.

**Checklist**
- [ ] Desenvolvimento segue a sequência lógica Metodologia → Resultados → Discussão
- [ ] Discussão dos resultados dialoga explicitamente com o Referencial Teórico

---

## Resumo executivo para a skill `revisar-typst`

Regras que dá para checar **automaticamente** (contagem, regex, estrutura):
1. Contagem de palavras do resumo (150–500) + estrutura IMRaD — **checar na etapa 07
   (Conclusão), assim que o resumo existir, não na revisão final**
2. Resumo em parágrafo único, sem citações
3. 3–6 palavras-chave separadas por `;`
4. Toda citação `(AUTOR, ano)` tem referência correspondente (e vice-versa)
5. Numeração de seção não ultrapassa 5 níveis, sem saltos
6. Sumário bate com os títulos reais
7. Referências em ordem alfabética

Regras que exigem **leitura crítica humana** (o orientador, apoiado pela skill `orientar-etapa`):
- Coerência entre objetivos, metodologia, resultados e conclusão
- Qualidade da discussão teórica (não é só formatação)
- Adequação do tipo de citação (direta vs. indireta) ao contexto
