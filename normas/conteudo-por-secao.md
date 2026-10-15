# Conteúdo por seção — o que cada parte do TCC DEVE e NÃO DEVE ter

> Fonte única das regras de conteúdo e de posição usadas pela `tcc-50-revisar` e pela
> `tcc-20-orientar`. As regras de formatação ABNT ficam em `normas/normas-abnt-detalhado.md`.
> Se o template Typst do curso ou o Regimento divergirem daqui, eles prevalecem.

## Como usar

- Cada regra tem um **código** (ex.: `INT-05`). Toda pendência gerada a partir de uma regra cita
  o código no Diagnóstico, e a issue do aluno mostra o mesmo código.
- **Verificação**: `auto` = a skill confere mecanicamente no `.typ` (títulos, ordem, tipo de
  lista, contagem); `leitura` = exige leitura crítica do texto.
- **Etapa**: etapa de orientação (`etapas/NN-*.md`) em que a seção é trabalhada. A revisão
  confere as regras da etapa atual **e** as regras de posição (`auto`) de todas as seções que já
  existem no texto, mesmo que sejam de outra etapa.

## Estrutura recomendada

A ordem abaixo é obrigatória. Títulos podem ser adaptados ao tema, desde que o conteúdo e a
posição de cada seção se mantenham.

| Seção | Etapa |
|---|---|
| **1 INTRODUÇÃO** | 01 a 03, 08 |
| 1.1 Contextualização | 01 |
| 1.2 Problema de pesquisa | 01 |
| 1.3 Hipótese ou pressuposto da solução | 02 |
| 1.4 Objetivo geral | 03 |
| 1.5 Objetivos específicos | 03 |
| 1.6 Justificativa | 01 |
| 1.7 Organização do trabalho | 08 |
| **2 REFERENCIAL TEÓRICO** | 04 |
| 2.1 Conceitos da área do problema | 04 |
| 2.2 Tecnologias utilizadas | 04 |
| 2.3 Engenharia de software | 04 |
| **3 TRABALHOS CORRELATOS** | 04 |
| 3.1 Critérios de comparação | 04 |
| 3.2 Trabalhos analisados | 04 |
| 3.3 Análise comparativa e lacuna | 04 |
| **4 METODOLOGIA** | 05 |
| 4.1 Natureza da pesquisa | 05 |
| 4.2 Método de desenvolvimento | 05 |
| 4.3 Levantamento de requisitos | 05 |
| 4.4 Tecnologias e ferramentas | 05 |
| 4.5 Procedimentos de avaliação | 05 |
| **5 DESENVOLVIMENTO DO SOFTWARE** | 06 |
| 5.1 Requisitos | 06 |
| 5.2 Arquitetura | 06 |
| 5.3 Modelagem | 06 |
| 5.4 Implementação | 06 |
| 5.5 Testes | 06 |
| **6 RESULTADOS E AVALIAÇÃO** | 07 |
| **7 CONSIDERAÇÕES FINAIS** | 08 |

Os trabalhos correlatos têm **capítulo próprio** (3): ficam depois do referencial teórico e antes da
metodologia, nem dentro do capítulo 2 nem depois do capítulo 4. A etapa 04 acompanha os capítulos
2 e 3.

## Regras gerais de estrutura (EST)

| Código | Regra | Verificação |
|---|---|---|
| EST-01 | DEVE seguir a ordem de capítulos e seções da estrutura recomendada. | auto |
| EST-02 | NÃO DEVE ter seção de um capítulo dentro de outro (ex.: trabalhos correlatos dentro do referencial ou da metodologia). | auto |
| EST-03 | NÃO DEVE ter seção vazia ou só com o título, exceto as de etapas futuras ainda não trabalhadas. | auto |
| EST-04 | NÃO DEVE ter placeholder do template (texto de exemplo, "lorem ipsum", ficha catalográfica ou banca de exemplo) em seção já trabalhada. | auto |

---

## 1 Introdução (INT)

### 1.1 Contextualização — etapa 01

| Código | Regra | Verificação |
|---|---|---|
| INT-01 | DEVE situar o tema e o cenário real em que o problema aparece, com fontes. | leitura |
| INT-02 | NÃO DEVE apresentar a solução, a ferramenta ou a tecnologia do trabalho (ex.: "este trabalho desenvolve um app em React…"). A proposta só aparece na 1.3. | leitura |
| INT-03 | NÃO DEVE adiantar resultados nem trazer citação longa (4 linhas ou mais). | leitura |

### 1.2 Problema de pesquisa — etapa 01

| Código | Regra | Verificação |
|---|---|---|
| INT-04 | DEVE formular o problema de forma explícita, de preferência como pergunta, e dizer o que fica fora do escopo. | leitura |
| INT-05 | NÃO DEVE formular o problema como solução disfarçada ("o problema é que não existe o sistema X"). | leitura |

### 1.3 Hipótese ou pressuposto da solução — etapa 02

| Código | Regra | Verificação |
|---|---|---|
| INT-06 | DEVE ficar **nesta seção**: depois do problema (1.2) e antes dos objetivos (1.4). | auto |
| INT-07 | NÃO DEVE aparecer na contextualização, no problema, nos objetivos nem na justificativa. Hipótese ou proposta de solução fora da 1.3 vira pendência. | leitura |
| INT-08 | DEVE ser testável: ao final do trabalho, o capítulo 6 precisa conseguir dizer se ela se sustentou. | leitura |

### 1.4 Objetivo geral — etapa 03

| Código | Regra | Verificação |
|---|---|---|
| INT-09 | DEVE ser uma frase, com um único verbo no infinitivo, que responda ao problema da 1.2. | leitura |
| INT-10 | NÃO DEVE ser um passo de método ("fazer revisão bibliográfica", "estudar a tecnologia X"). | leitura |

### 1.5 Objetivos específicos — etapa 03

| Código | Regra | Verificação |
|---|---|---|
| INT-11 | DEVE ser uma **lista não numerada** (marcador `-` no Typst). Lista numerada (`+`, `1.`, `a)`) ou objetivos corridos num parágrafo viram pendência. | auto |
| INT-12 | DEVE ter de 3 a 5 itens, cada um com um verbo no infinitivo e verificável na conclusão. | auto (contagem) + leitura |
| INT-13 | NÃO DEVE usar verbos vagos (conhecer, entender, compreender, estudar) nem sair do escopo do objetivo geral. | leitura |

### 1.6 Justificativa — etapa 01

| Código | Regra | Verificação |
|---|---|---|
| INT-14 | DEVE vir depois dos objetivos e explicar por que o problema importa, com evidências (dados, fontes, contexto). | auto (posição) + leitura |
| INT-15 | NÃO DEVE se basear só em opinião pessoal nem repetir a contextualização. | leitura |

### 1.7 Organização do trabalho — etapa 08

| Código | Regra | Verificação |
|---|---|---|
| INT-16 | DEVE descrever, em um parágrafo curto por capítulo, o que cada capítulo seguinte contém. É escrita quando todos os capítulos existem. | leitura |
| INT-17 | NÃO DEVE citar capítulo que não existe nem divergir dos títulos reais. | auto |

---

## 2 Referencial teórico (REF) — etapa 04

| Código | Seção | Regra | Verificação |
|---|---|---|---|
| REF-01 | geral | DEVE ligar cada seção a um objetivo específico ou a uma decisão do trabalho. | leitura |
| REF-02 | geral | DEVE usar fontes acadêmicas e atuais (preferência pelos últimos 5 a 10 anos, salvo obras clássicas) e fazer os autores dialogarem. | leitura |
| REF-03 | geral | NÃO DEVE descrever o sistema do aluno nem trazer resultados. | leitura |
| REF-04 | geral | NÃO DEVE ser "colcha de retalhos": um parágrafo por autor, sem síntese. | leitura |
| REF-05 | 2.1 | DEVE apresentar os conceitos da área do problema indispensáveis para entender o restante do texto. | leitura |
| REF-06 | 2.2 | DEVE explicar por que cada tecnologia importa para o problema. NÃO DEVE virar tutorial nem manual de instalação. | leitura |
| REF-07 | 2.2 | NÃO DEVE usar blog ou documentação de fornecedor como única base de conceito central. | leitura |
| REF-08 | 2.3 | DEVE tratar os conceitos de engenharia de software que o trabalho aplica (processo, requisitos, arquitetura, testes). | leitura |

> REF-09 e REF-10 (antiga seção 2.4) foram substituídas pelas regras COR-02 a COR-06 do capítulo 3.
> Os códigos não são reutilizados.

---

## 3 Trabalhos correlatos (COR) — etapa 04

| Código | Seção | Regra | Verificação |
|---|---|---|---|
| COR-01 | geral | DEVE ser um capítulo próprio (3), depois do referencial teórico e antes da metodologia. | auto |
| COR-02 | 3.1 | DEVE declarar os critérios de comparação (ex.: público, tecnologia, funcionalidades, forma de avaliação) antes de comparar os trabalhos. | leitura |
| COR-03 | 3.2 | DEVE trazer, para **cada** trabalho analisado, **objetivo** (o que o autor fez), **solução** (como resolveu o problema) e **lacuna** (o que não resolveu ou onde difere deste TCC). Falta de qualquer um dos três vira pendência, uma por trabalho. | leitura |
| COR-04 | 3.2 | NÃO DEVE só listar ou resumir trabalhos, sem comparação. | leitura |
| COR-05 | 3.3 | DEVE comparar os trabalhos e a proposta do aluno pelos critérios da 3.1, de preferência numa tabela. | leitura |
| COR-06 | 3.3 | DEVE fechar mostrando a lacuna que este TCC ocupa, a partir das lacunas dos trabalhos analisados. | leitura |
| COR-07 | geral | DEVE usar trabalhos verificáveis (com referência completa) e ligados ao problema, de preferência dos últimos 5 a 10 anos. | leitura |

Prioridade sugerida das pendências: lacuna ausente (COR-03) e capítulo fora do lugar (COR-01) são
**alta**; objetivo ou solução ausentes (COR-03) são **média**.

---

## 4 Metodologia (MET) — etapa 05

| Código | Seção | Regra | Verificação |
|---|---|---|---|
| MET-01 | geral | DEVE ligar cada passo metodológico a um objetivo específico da 1.5. | leitura |
| MET-02 | geral | NÃO DEVE trazer resultados, telas do sistema pronto nem repetir a teoria do capítulo 2. | leitura |
| MET-03 | 4.1 | DEVE classificar a pesquisa (natureza, abordagem, objetivos) e justificar a classificação. | leitura |
| MET-04 | 4.2 | DEVE descrever o método de desenvolvimento usado de fato (ex.: Scrum adaptado, prototipação) e como foi aplicado. NÃO DEVE copiar a descrição genérica do livro. | leitura |
| MET-05 | 4.3 | DEVE dizer como os requisitos foram levantados (com quem, com quais técnicas). A lista de requisitos fica na 5.1. | leitura |
| MET-06 | 4.4 | DEVE justificar a escolha de cada tecnologia e ferramenta. A teoria sobre elas fica na 2.2. | leitura |
| MET-07 | 4.5 | DEVE definir como o software será avaliado: métricas, critérios, participantes e instrumentos. O capítulo 6 segue exatamente esse plano. | leitura |

---

## 5 Desenvolvimento do software (DES) — etapa 06

| Código | Seção | Regra | Verificação |
|---|---|---|---|
| DES-01 | geral | DEVE descrever o que foi feito, com decisões técnicas justificadas. | leitura |
| DES-02 | geral | NÃO DEVE reproduzir listagens longas de código no corpo do texto (vão para apêndice). | auto |
| DES-03 | geral | NÃO DEVE ter figura sem fonte ou que não seja citada no texto. | auto |
| DES-04 | 5.1 | DEVE listar os requisitos funcionais e não funcionais que saíram do levantamento da 4.3. | leitura |
| DES-05 | 5.2 | DEVE apresentar a arquitetura com diagrama e explicação de cada parte. | leitura |
| DES-06 | 5.3 | DEVE trazer a modelagem (casos de uso, classes, dados) coerente com os requisitos. | leitura |
| DES-07 | 5.4 | O que o texto afirma que foi implementado DEVE existir no código do repositório do aluno. Funcionalidade descrita e ausente no código vira pendência. | leitura (código) |
| DES-08 | 5.5 | DEVE descrever os testes realizados e o que cobrem. | leitura |

---

## 6 Resultados e avaliação (RES) — etapa 07

| Código | Regra | Verificação |
|---|---|---|
| RES-01 | DEVE aplicar a avaliação planejada na 4.5, com evidências (métricas, dados, testes, telas). | leitura |
| RES-02 | DEVE discutir os resultados à luz do referencial e dos trabalhos correlatos (capítulo 3). | leitura |
| RES-03 | DEVE dizer se a hipótese da 1.3 se sustentou e declarar as limitações. | leitura |
| RES-04 | NÃO DEVE apresentar conceito teórico novo, mudar o método nem afirmar algo sem evidência. | leitura |

---

## 7 Considerações finais (CON) — etapa 08

| Código | Regra | Verificação |
|---|---|---|
| CON-01 | DEVE retomar o objetivo geral e cada objetivo específico, na mesma ordem da 1.5, dizendo se foi atingido. | leitura |
| CON-02 | DEVE confrontar a hipótese da 1.3 com os resultados do capítulo 6. | leitura |
| CON-03 | DEVE trazer limitações e trabalhos futuros concretos. | leitura |
| CON-04 | NÃO DEVE trazer informação nova, citações nem ser genérica a ponto de servir para qualquer TCC. | leitura |

---

## Resumo e abstract (RSM) — etapa 08

Complementa a seção 3 de `normas/normas-abnt-detalhado.md` (NBR 6028).

| Código | Regra | Verificação |
|---|---|---|
| RSM-01 | DEVE ter de 150 a 500 palavras, em parágrafo único. | auto |
| RSM-02 | DEVE cobrir problema, método, resultados e conclusão. | leitura |
| RSM-03 | DEVE ter de 3 a 6 palavras-chave separadas por `;`, e o abstract as mesmas keywords traduzidas. | auto |
| RSM-04 | NÃO DEVE ter citações, siglas sem explicação nem a lista de objetivos específicos. | auto + leitura |

## Pré-textuais e pós-textuais (PRE, POS) — revisados na etapa 09

| Código | Regra | Verificação |
|---|---|---|
| PRE-01 | Folha de rosto, folha de aprovação e ficha catalográfica NÃO DEVEM ter dados de exemplo do template. | auto |
| PRE-02 | O sumário DEVE bater com os títulos reais (NBR 6027). | auto |
| POS-01 | Toda citação DEVE ter referência correspondente, e toda referência DEVE ser citada (NBR 10520/6023). | auto |
| POS-02 | Apêndice DEVE ser material do próprio aluno; anexo, material de terceiros. | leitura |
