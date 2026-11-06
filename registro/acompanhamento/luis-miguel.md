# Acompanhamento da Orientação — Luís Miguel de Jesus Oliveira

> Documento de trabalho do orientador. **Não faz parte do TCC entregue.**
> Único lugar gravável pelas skills, além das issues do GitHub (ver `contrato/contrato-de-acesso.md`).

## 1. Marcos do cronograma

| Etapa | Marco | Data alvo | Data revisada | Status |
|---|---|---|---|---|
| 00 | Concepção: tema, escopo, estrutura de tópicos e primeiras leituras | | | pendente |
| 01 | Problema: 1.1 Contextualização, 1.2 Problema, 1.6 Justificativa | | | pendente |
| 02 | Hipótese: 1.3 | | | pendente |
| 03 | Objetivos: 1.4 e 1.5 | | | pendente |
| 04 | Referencial teórico e trabalhos correlatos: caps. 2 e 3 | | | pendente |
| 05 | Metodologia: cap. 4 | | | pendente |
| 06 | Desenvolvimento do software: cap. 5 | | | pendente |
| 07 | Resultados e avaliação: cap. 6 | | | pendente |
| 08 | Considerações finais: cap. 7, 1.7, resumo e abstract | | | pendente |
| 09 | Defesa | | | pendente |

## 2. Histórico de orientações

> Uma linha por sessão (passo 20.6 da `tcc-20-orientar`) e por encontro registrado pela
> `tcc-30-frequencia`. Mudanças de etapa (passo 20.7) também ficam aqui.

| Data | Etapa/Tópico | Decisões | Próximos passos |
|---|---|---|---|
| 2026-11-05 | Revisão 20.2 — etapa 00 (pré-reunião) | Aluno já escreveu a **Introdução completa** (1.1 a 1.6, 614 palavras) e preencheu título, autor e orientador no `main.typ`: comparação de Spring MVC, Spring WebFlux e Threads Virtuais (Project Loom) em microsserviços Java sob alta concorrência de I/O. Capítulos 2 a 7 e pré-textuais continuam no template. Regras `auto` OK: hipótese na 1.3, ordem 1.4→1.5→1.6, capítulos na ordem EST-01. Problemas: 1.2 sem pergunta e sem delimitação de escopo (INT-04), capítulo sem nenhuma citação (INT-01), objetivos específicos corridos em parágrafo (INT-11). Aderência ao curso é forte: concorrência, desempenho e escalabilidade — a linha do orientador. | Reunião: fechar a pergunta de pesquisa, o escopo negativo e o desenho do experimento (carga, ambiente, métricas, repetições); definir se o código vai para o repositório (layout 1). |
| 2026-11-05 | Correção de registro — codificação | A pendência 6 (mojibake no `main.typ`) foi **falso positivo**: a checagem contava qualquer `Ã` como corrupção, e `Ã` é legítimo em "NÃO DEVE" nas caixas de orientação. Verificação byte a byte: arquivo em UTF-8 sem BOM, título e autor corretos (o orientador confirmou no VS Code). Pendência marcada como `rejeitada`. | Nenhuma ação do aluno. |
| 2026-11-06 | Revisão dos textos das issues | Corpos das 8 issues conferidos contra o texto do aluno: todos os trechos citados existem literalmente; localizações por seção, não por linha; nenhum código de regra nos corpos; labels conferidas contra a taxonomia. Corrigida a pendência 2: a bibliografia não sai vazia — traz as referências de exemplo dos capítulos 2 e 4. | Publicar quando o orientador autorizar. |
| 2026-11-06 | Reescrita explicativa das issues | Corpos das 8 issues reescritos para orientar a execução sem nova reunião: cada um ganhou o passo a passo em `Como resolver` (com exemplos de redação, comandos e estrutura de pastas), o checklist `Como saber que ficou pronto` e uma explicação do porquê da exigência. Removido o campo "Esforço estimado", a pedido do orientador. Também foram retiradas as referências a este documento de acompanhamento (que o aluno não vê): as issues agora são autocontidas, citando as obras pelo nome e tratando o layout do repositório sem mencionar o controle interno do orientador. | Revisar a seção 5 e autorizar a publicação. |
| 2026-11-06 | Publicação das issues | Criadas 8 issues no repositório do aluno: pendências 1→#1, 2→#2, 3→#3, 4→#4, 5→#5, 7→#6, 8→#7, 9→#8. Corpos conferidos contra o registro (idênticos). Issues já estavam habilitadas. **Labels não aplicadas**: a conta do orientador tem só leitura no repositório (`push:false`, `triage:false`), então `gh label create` retorna 404 e não há como rotular. | Pedir ao aluno que adicione `leandro-costa` como colaborador (Write ou Triage) e, depois, criar as 9 labels e aplicá-las às issues conforme a coluna Labels. |

## 3. Pendências rastreáveis

> Preenchido pela `tcc-20-orientar`, `tcc-40-solicitar` e `tcc-50-revisar`; sincronizado com o
> GitHub apenas pela `tcc-60-sincronizar`. O Diagnóstico começa pelo código da regra de
> `normas/conteudo-por-secao.md`, quando houver. O código é interno: nas issues do aluno ele é
> trocado por uma descrição detalhada da regra. Estados em `contrato/contrato-de-acesso.md`.

| # | Labels | Título | Localização | Citação | Diagnóstico | Sugestão | Prioridade | Estado | Issue | Comentários |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | `cap-introducao` `estrutura` | Problema de pesquisa sem pergunta e sem escopo negativo | `capitulos/01-introducao.typ:18` | "identifica-se uma certa escassez em dados experimentais e concretos" | INT-04: a 1.2 descreve uma lacuna, mas não formula o problema como pergunta nem diz o que fica fora do escopo. Sem isso, não há como verificar se o objetivo geral responde ao problema. | Reescrever 1.2 com uma pergunta explícita (ex.: *como as três abordagens se comparam em desempenho e consumo de recursos sob a mesma carga?*) e um parágrafo de escopo negativo (fora: otimização de JVM, tuning de banco, custo financeiro, outros frameworks). Definir numericamente o que é "alta concorrência" (faixas de usuários simultâneos). | alta | criada #1 | [#1](https://github.com/LuisMiguelADS/template-tcc/issues/1) | |
| 2 | `cap-introducao` `fonte` | Introdução sem nenhuma citação | `capitulos/01-introducao.typ:14-37` | "Com o avanço na utilização da arquitetura de microsserviços..." | INT-01 e INT-14: nenhuma afirmação da introdução tem fonte (`#cite`/`#prose` ausentes). As únicas referências que chegariam ao PDF são as dos exemplos do template nos capítulos 2 e 4 (sommerville2011, martin2008, newman2021, wazlawick2014, brooke1996), que o texto não discute. A justificativa ainda afirma que houve "levantamento bibliográfico realizado", que não aparece no texto. | Citar as fontes de cada afirmação técnica (modelo de threads, WebFlux, Loom) e sustentar a lacuna com os correlatos do capítulo 3. Se o levantamento ainda não foi feito, retirar a afirmação até ele existir. Remover as citações de exemplo do template ao reescrever os capítulos 2 e 4. | alta | criada #2 | [#2](https://github.com/LuisMiguelADS/template-tcc/issues/2) | Leituras verificadas na seção 4; texto da issue revisado em 2026-11-06. |
| 3 | `cap-introducao` `estrutura` | Objetivos específicos corridos em parágrafo | `capitulos/01-introducao.typ:30-33` | "Desenvolver microsserviços Java... Realizar testes de carga..." | INT-11: os quatro objetivos estão em linhas soltas, que o Typst junta em um parágrafo único; a norma exige lista não numerada com marcador `-`. | Transformar em lista `- Levantar ...;` `- Implementar ...;` etc., um objetivo por item. A contagem (4) está dentro do limite de 3 a 5 (INT-12). | alta | criada #3 | [#3](https://github.com/LuisMiguelADS/template-tcc/issues/3) | |
| 4 | `cap-introducao` `estrutura` | Quarto objetivo com dois verbos e termo incorreto | `capitulos/01-introducao.typ:32-33` | "como throughout, tempo de resposta" | INT-12: o objetivo 4 tem dois verbos no infinitivo ("Comparar ... para fornecer"); o objetivo 3 grafa *throughout* em vez de *throughput*. | Deixar um verbo por item (o "para fornecer um caminho analítico" vira a contribuição descrita na justificativa ou na conclusão) e corrigir o termo para *throughput*. | média | criada #4 | [#4](https://github.com/LuisMiguelADS/template-tcc/issues/4) | |
| 5 | `cap-introducao` `coerencia` | Hipótese com afirmação que o método não mede | `capitulos/01-introducao.typ:22` | "mantendo o desenvolvimento mais prático e simples anulando a complexidade da abordagem reativa" | INT-08: a hipótese promete três resultados — desempenho, consumo de recursos e simplicidade de desenvolvimento —, mas o desenho previsto só mede os dois primeiros. A parte não verificável enfraquece a defesa. | Manter na hipótese apenas o que o capítulo 6 poderá confirmar ou refutar (desempenho, latência e recursos) e tratar a simplicidade como discussão qualitativa, apoiada em literatura, não como hipótese testada. | média | criada #5 | [#5](https://github.com/LuisMiguelADS/template-tcc/issues/5) | |
| 6 | `formato` | Título e autor corrompidos no `main.typ` (mojibake) | `main.typ:21-22` | "Desempenho computacional em microsserviços Java" | **Falso positivo.** A checagem contava qualquer `Ã` como corrupção, e `Ã` aparece legitimamente em "NÃO DEVE" nas caixas de orientação. Verificação byte a byte em 2026-11-05: o arquivo está em UTF-8 sem BOM, com título e autor corretos. | Nada a corrigir. | alta | rejeitada | | Orientador confirmou no VS Code que o texto aparece correto; checagem refeita com o padrão `Ã` + Latin-1 deu 0 ocorrências. |
| 7 | `estrutura` `codigo` | Repositório precisa passar ao layout 1 (código + TCC em `docs/`) | `main.typ:1` (raiz do repositório) | — | Formato: o repositório está em layout 2 (só TCC), mas o trabalho exige implementar três versões do serviço e rodar testes de carga. Sem `src/` no repositório, o capítulo 5 não tem o que comprovar e o experimento não é reproduzível (DES-07). | Mover o template para `docs/`, criar `src/` com as três implementações, os scripts de carga e a configuração do ambiente, e ajustar `TCC_DIR: docs` no workflow. | alta | criada #6 | [#6](https://github.com/LuisMiguelADS/template-tcc/issues/6) | Avisar o orientador para atualizar o `tcc_dir` no registro. |
| 8 | `cap-proposta` `estrutura` | Adaptar os títulos das seções ao tema | `capitulos/02-referencial-teorico.typ` a `capitulos/07-consideracoes-finais.typ` | "== Conceitos da área do problema / == Tecnologias utilizadas" | EST-01: a ordem está correta, mas os títulos são genéricos do template. O trabalho precisa de títulos que anunciem o conteúdo real de cada seção. | 2.1 Concorrência em Java: threads de plataforma, modelo reativo e threads virtuais; 2.2 Spring MVC, Spring WebFlux e Project Loom; 2.3 Microsserviços, arquitetura e avaliação de desempenho; 3.1 Critérios de comparação; 3.2 Trabalhos analisados; 3.3 Análise comparativa e lacuna; 4.1 Natureza da pesquisa; 4.2 Método de experimentação; 4.3 Requisitos do serviço de referência; 4.4 Tecnologias e ferramentas; 4.5 Procedimentos de avaliação; 5.1 Requisitos; 5.2 Arquitetura das três implementações; 5.3 Modelagem do domínio; 5.4 Implementação; 5.5 Testes funcionais e de carga; 6.1 Desempenho; 6.2 Consumo de recursos; 6.3 Discussão; 6.4 Limitações; 7.1 Retomada dos objetivos; 7.2 Trabalhos futuros. | alta | criada #7 | [#7](https://github.com/LuisMiguelADS/template-tcc/issues/7) | Estrutura completa proposta na sessão de 2026-11-05. |
| 9 | `cap-referencial` `fonte` | Incorporar as leituras sugeridas | `capitulos/02-referencial-teorico.typ` | — | Fonte: as leituras registradas na seção 4 cobrem modelo de threads do Java e threads virtuais, avaliação de microsserviços em contêineres e metodologia de teste de carga; nenhuma está no texto. | Ler as obras e incorporar ao referencial (2.1 e 2.2), aos correlatos (3.2) e à metodologia (4.5), citando com `#cite`/`#prose` e atualizando `referencias.bib`. | média | criada #8 | [#8](https://github.com/LuisMiguelADS/template-tcc/issues/8) | Verificadas por DOI/ISBN em 2026-11-05. |

## 4. Leituras sugeridas

> Preenchido pela `tcc-20-orientar` (passo 20.3). Só referências verificadas: a coluna
> Verificação traz o DOI, ISBN ou link conferido.

| Data | Tópico / seção | Referência (ABNT) | Verificação | Situação |
|---|---|---|---|---|
| 2026-11-05 | 2.1 Modelo de threads e threads virtuais | VEEN, R.; VLIJMINCX, D. **Virtual Threads in Java**. Apress, 2024. | ISBN 979-8-8688-0181-5 | sugerida |
| 2026-11-05 | 2.1 e 2.2 Fonte primária do Project Loom | OPENJDK. **JEP 444: Virtual Threads**. 2023. Disponível em: https://openjdk.org/jeps/444. Acesso em: 5 nov. 2026. | Página oficial verificada (HTTP 200) | sugerida |
| 2026-11-05 | 2.2 Modelo reativo e contrapressão | DAVIS, A. L. **Reactive Streams in Java**: concurrency with RxJava, Reactor, and Akka Streams. Apress, 2019. | ISBN 978-1-4842-4175-2 | sugerida |
| 2026-11-05 | 3.2 Comparação entre threads virtuais e de plataforma | SIROTIĆ, Z.; SOVILJ, S.; ORŠULIĆ, M.; PRIPUŽIĆ, K. Comparison of Java Virtual and Non-Virtual Threads in Parallel Programming. In: **2025 MIPRO 48th ICT and Electronics Convention**, 2025. p. 1956-1961. | DOI 10.1109/MIPRO65660.2025.11131818 | sugerida |
| 2026-11-05 | 3.2 e 4.4 Desempenho de microsserviços em contêineres | AMARAL, M.; POLO, J.; CARRERA, D.; MOHOMED, I.; UNUVAR, M.; STEINDER, M. Performance Evaluation of Microservices Architectures Using Containers. In: **2015 IEEE 14th International Symposium on Network Computing and Applications (NCA)**, 2015. p. 27-34. | DOI 10.1109/NCA.2015.49 | sugerida |
| 2026-11-05 | 4.5 Metodologia de teste de carga | JIANG, Z. M.; HASSAN, A. E. A Survey on Load Testing of Large-Scale Software Systems. **IEEE Transactions on Software Engineering**, v. 41, n. 11, p. 1091-1118, 2015. | DOI 10.1109/TSE.2015.2445340 | sugerida |
| 2026-11-05 | 3.2 Benchmarks públicos de frameworks | TECHEMPOWER. **Framework Benchmarks**. Disponível em: https://www.techempower.com/benchmarks/. Acesso em: 5 nov. 2026. | Página oficial verificada (HTTP 200) | sugerida |

## 5. Corpo das issues — pré-aprovado em 2026-11-05, revisado em 2026-11-06

> Corpos das 8 issues publicadas (mantidos aqui como registro do que foi enviado ao aluno). Os
> textos seguem o formato exigido pela `tcc-60-sincronizar` e **não contêm códigos de regra**, que
> são de uso interno.
>
> **Publicadas em 2026-11-06** em `LuisMiguelADS/template-tcc`: pendências 1 a 5 e 7 a 9 →
> issues #1 a #8. A **6 está `rejeitada`** (falso positivo de codificação) e não virou issue.
> As issues ficaram **sem labels**: a conta do orientador tem apenas leitura no repositório
> (`push:false`, `triage:false`), e o GitHub não permite criar nem aplicar labels sem permissão de
> triagem. Veja "Pendência operacional" abaixo.
>
> **Formato ampliado (2026-11-06):** cada corpo tem seis seções —
> `O que esta parte do TCC precisa ter`, `Onde`, `Trecho`, `O que encontramos`,
> `Como resolver` (passo a passo, com exemplos de redação e comandos) e
> `Como saber que ficou pronto` (checklist) —, fechando com a prioridade. A intenção é que o aluno
> consiga executar a tarefa sozinho, sem precisar de uma nova reunião para entender o pedido.
>
> Publicar as pendências 1, 2, 3, 4, 5, 7, 8 e 9. A **6 está `rejeitada`** (falso positivo de
> codificação): não publicar.
>
> **Revisado em 2026-11-06:** todos os trechos citados foram conferidos contra o texto do aluno e
> existem literalmente no arquivo; as localizações apontam a seção (não a linha), para não
> envelhecer; nenhum código de regra aparece nos corpos. A pendência 2 foi corrigida — a
> bibliografia **não** sai vazia, ela traz as referências de exemplo dos capítulos 2 e 4.
>
> Os blocos de corpo estão cercados por **quatro crases**, e não três, para permitir exemplos de
> código dentro da própria issue. Ao copiar para o `gh`, copie do início da cerca até o
> fechamento.
>
> Se a pendência 7 (mover para `docs/`) for executada antes das demais, os caminhos
> `capitulos/...` dos itens "Onde" passam a ser `docs/capitulos/...`.

### Publicação — 2026-11-06
1. Repositório: `LuisMiguelADS/template-tcc`, branch `main` — issues **já estavam habilitadas**
   (`has_issues: true`).
2. Duplicidade checada antes de criar: nenhuma issue existente no repositório.
3. Criadas 8 issues (#1 a #8), com corpo idêntico ao registrado abaixo.
4. Estados atualizados para `criada #N` e coluna Issue preenchida.

#### Pendência operacional — labels
- A conta `leandro-costa` tem **somente leitura** no repositório do aluno
  (`admin:false`, `maintain:false`, `push:false`, `triage:false`). Consequências:
  - não foi possível criar as labels da taxonomia (`gh label create` → 404);
  - não foi possível aplicar labels nas issues (exige permissão de triagem);
  - as 8 issues estão **sem label** — só o título e o corpo identificam o assunto.
- Para resolver: o aluno precisa adicionar `leandro-costa` como colaborador com papel **Write**
  (Settings → Collaborators → Add people) ou **Triage**, se quiser apenas rotular.
- Depois disso, criar e aplicar, nesta ordem:
  1. criar as labels `cap-introducao`, `cap-proposta`, `cap-referencial`, `estrutura`, `codigo`,
     `fonte`, `coerencia`, `prio-alta`, `prio-media`;
  2. `gh issue edit <N> --repo LuisMiguelADS/template-tcc --add-label "<labels>"` para #1 a #8,
     conforme o campo **Labels** de cada bloco abaixo.

### Pendência 1 — prioridade alta
**Título:** Formular o problema de pesquisa como pergunta e delimitar o escopo
**Labels:** `cap-introducao` `estrutura` `prio-alta`

````markdown
## O que esta parte do TCC precisa ter

A seção 1.2 é o coração do capítulo 1: é ela que diz, em uma frase, o que o trabalho quer
descobrir. O formato mais claro — e o mais fácil de defender — é uma **pergunta única**, que o
objetivo geral (1.4) depois responde com um verbo no infinitivo.

A mesma seção precisa dizer o que **não** faz parte do trabalho. Esse parágrafo de escopo não é
formalidade: ele impede que a banca cobre algo que você nunca pretendeu fazer e mostra que as
decisões foram tomadas de propósito, não por omissão.

## Onde

`capitulos/01-introducao.typ` — seção 1.2 (Problema de pesquisa)

## Trecho

> "identifica-se uma certa escassez em dados experimentais e concretos"

## O que encontramos

O texto descreve uma lacuna, mas não a transforma em pergunta e não delimita o que fica de fora.
O termo "alta concorrência", que aparece na hipótese e nos objetivos, também não está definido em
números — sem isso, cada leitor imagina uma carga diferente.

## Como resolver

1. **Escreva a pergunta em uma frase.** Use a estrutura "Como ... se comporta/compara ... em
   termos de ...?". Exemplo para adaptar, não para copiar sem revisar: *Sob a mesma carga de I/O
   e o mesmo ambiente de execução, como Spring MVC, Spring WebFlux e threads virtuais se comparam
   em throughput, latência de cauda e consumo de recursos computacionais?*

2. **Reorganize a 1.2 em três blocos**, nesta ordem:
   - um parágrafo curto retomando a lacuna, com fonte;
   - a pergunta em frase própria, destacada em itálico;
   - o parágrafo de escopo.

3. **Escreva o escopo negativo.** Comece com "Ficam fora do escopo deste trabalho:". Candidatos
   naturais para o seu caso: ajuste fino de JVM e coletor de lixo, otimização de consultas e
   índices do banco, custo financeiro de nuvem, comparação com frameworks de outras linguagens,
   correção funcional das três versões e avaliação com usuários.

4. **Defina a carga em números.** Diga as faixas que serão testadas (por exemplo, 100, 500, 1.000
   e 2.000 usuários simultâneos, ou uma taxa de requisições por segundo). Se ainda não souber, use
   a faixa do teste-piloto e ajuste depois.

5. **Confira o encaixe com a 1.4.** Leia a pergunta e o objetivo geral em sequência: o objetivo
   deve responder exatamente à pergunta. Se um dos dois mudar, ajuste o outro.

## Como saber que ficou pronto

- [ ] A 1.2 contém uma pergunta explícita, terminando em "?".
- [ ] Existe um parágrafo começando por "Ficam fora do escopo...".
- [ ] As faixas de concorrência estão escritas em números.
- [ ] A pergunta e o objetivo geral (1.4) tratam do mesmo fenômeno.

**Prioridade:** alta
````

### Pendência 2 — prioridade alta
**Título:** Citar as fontes das afirmações da introdução
**Labels:** `cap-introducao` `fonte` `prio-alta`

````markdown
## O que esta parte do TCC precisa ter

Toda afirmação sobre o cenário, o problema ou a tecnologia precisa de uma fonte identificável no
texto. O template monta a lista de referências **a partir das citações**: o que não é citado não
aparece, e o que aparece sem ser discutido soa como enfeite. Citar não é decorar o texto — é
mostrar de onde vem cada afirmação técnica que você usa.

## Onde

`capitulos/01-introducao.typ` — capítulo 1 inteiro (da 1.1 à 1.6); depois, capítulos 2 e 4, ao
reescrevê-los.

## Trecho

> "Com o avanço na utilização da arquitetura de microsserviços..."

## O que encontramos

A introdução não tem nenhuma citação. A justificativa afirma que houve "levantamento
bibliográfico realizado", mas esse levantamento não aparece no texto. Hoje as únicas referências
que chegariam ao PDF vêm dos exemplos do template nos capítulos 2 e 4 (Sommerville, Martin,
Newman, Wazlawick e Brooke) — obras que o trabalho não discute.

## Como resolver

1. **Liste as afirmações factuais da introdução** e marque uma por uma: "cada requisição do
   Spring MVC ocupa uma thread até o fim do processamento", "o WebFlux libera a thread e executa
   em segundo plano", "threads virtuais são mais leves que threads de plataforma". São essas que
   precisam de fonte.

2. **Escolha a fonte de cada afirmação.** As obras de base do trabalho são: a especificação
   oficial das threads virtuais (JEP 444), Veen e Vlijmincx (2024) para o funcionamento interno,
   Davis (2019) para o modelo reativo, Sirotić et al. (2025) para comparação experimental e a
   documentação oficial do Spring para o comportamento de cada framework. Uma afirmação pode ter
   mais de uma fonte; nenhuma pode ficar sem.

3. **Cadastre a obra no `referencias.bib`** com uma chave curta (ex.: `veen2024`) e cite no texto.
   Exemplo de frase: "A abordagem bloqueante mantém uma thread do sistema ocupada durante todo o
   processamento da requisição #cite(\"veen2024\")."

4. **Escolha o comando certo:** `#cite("chave")` para a chamada da referência e `#prose("chave")`
   quando você reescrever a ideia com suas palavras. Siga o padrão que já existe no template.

5. **Reescreva a frase da justificativa** sobre o "levantamento bibliográfico": ou mostre o
   levantamento, citando as obras, ou troque por uma afirmação que você consiga sustentar.

6. **Ao reescrever os capítulos 2 e 4, apague as citações de exemplo do template.** Elas não
   devem sobreviver ao texto final.

## Como saber que ficou pronto

- [ ] Cada afirmação técnica da introdução tem citação.
- [ ] Toda chave citada existe no `referencias.bib`.
- [ ] O PDF lista apenas obras que o texto realmente discute.
- [ ] Nenhuma citação de exemplo do template permaneceu.

**Prioridade:** alta
````

### Pendência 3 — prioridade alta
**Título:** Transformar os objetivos específicos em lista
**Labels:** `cap-introducao` `estrutura` `prio-alta`

````markdown
## O que esta parte do TCC precisa ter

Os objetivos específicos são as etapas que, cumpridas, realizam o objetivo geral. Devem aparecer
como **lista não numerada**, com marcador `-`, um item por objetivo, cada um com um verbo no
infinitivo.

No Typst, linhas soltas viram um parágrafo único: sem o marcador, os quatro objetivos saem
emendados no PDF, como se fossem um texto só.

## Onde

`capitulos/01-introducao.typ` — seção 1.5 (Objetivos específicos)

## Trecho

> "Desenvolver microsserviços Java... Realizar testes de carga..."

## O que encontramos

Os quatro objetivos estão em linhas sem marcador. No PDF aparecem corridos, o que dificulta a
leitura e a conferência na conclusão do trabalho. A quantidade (4) está dentro do intervalo
esperado (3 a 5) — falta só o formato.

## Como resolver

1. Coloque `- ` no início de cada um dos quatro objetivos.
2. Termine cada item com `;` e o último com `.`.
3. Não numere nem use letras: a norma pede lista não numerada.

A forma final deve ficar assim (o conteúdo é seu; só a forma é exemplo):

```
- Desenvolver ...;
- Realizar ...;
- Coletar e analisar ...;
- Comparar ....
```

## Como saber que ficou pronto

- [ ] Quatro linhas começando com `- `.
- [ ] Um verbo no infinitivo por item.
- [ ] No PDF, quatro marcadores visíveis, um por linha.

**Prioridade:** alta
````

### Pendência 4 — prioridade média
**Título:** Um verbo por objetivo e correção do termo throughput
**Labels:** `cap-introducao` `estrutura` `prio-media`

````markdown
## O que esta parte do TCC precisa ter

Cada objetivo específico precisa ter **um único verbo no infinitivo**. O motivo é prático: nas
considerações finais você vai retomar os objetivos um por um e dizer se cada um foi cumprido. Um
item com dois verbos ("comparar e fornecer") não pode ser marcado como cumprido sem discussão,
porque uma metade pode estar pronta e a outra não.

## Onde

`capitulos/01-introducao.typ` — seção 1.5 (Objetivos específicos), itens 3 e 4

## Trecho

> "como throughout, tempo de resposta..."
> "Comparar de forma prática os resultados para fornecer um caminho analítico..."

## O que encontramos

- O **quarto** objetivo tem dois verbos ("comparar" e "fornecer"), então não é verificável de
  forma isolada.
- O **terceiro** grafa *throughout* onde deveria ser *throughput*. São palavras diferentes:
  *throughput* é a vazão (quantas requisições por segundo o serviço entrega); *throughout* significa
  "ao longo de". Como a palavra está em uma lista de métricas, o leitor entende que é a vazão.

## Como resolver

1. **No quarto objetivo, escolha o verbo que descreve a entrega principal.** O verbo é "comparar":
   os resultados da comparação já são o produto do trabalho. A parte "para fornecer um caminho
   analítico" deixa de ser objetivo e passa a ser a contribuição esperada — o lugar dela é a
   justificativa (1.6) ou as considerações finais (7). Sugestão de redação:
   *Comparar os resultados das três abordagens em termos das métricas definidas;*

2. **Corrija o termo** para *throughput* no terceiro objetivo. Se o texto estiver em português,
   considere a forma "vazão (*throughput*)", que fixa o conceito na primeira ocorrência e pode ser
   retomada em português no resto do trabalho.

3. **Aproveite para separar as métricas em dois grupos**, porque elas medem coisas diferentes e
   serão apresentadas assim no capítulo 6:
   - desempenho: *throughput*, latência p95 e p99, taxa de erro;
   - recursos: uso de CPU e consumo de memória.

4. **Releia os quatro objetivos em sequência** e confira que nenhum deles repete a ação de outro.
   Eles devem formar uma cadeia: montar → testar → medir → comparar.

## Como saber que ficou pronto

- [ ] Cada um dos quatro itens tem exatamente um verbo no infinitivo.
- [ ] A palavra *throughout* não aparece mais no capítulo.
- [ ] O quarto objetivo não menciona mais "fornecer um caminho analítico".
- [ ] A lista de métricas está dividida entre desempenho e recursos.
- [ ] Os quatro objetivos podem ser retomados um a um no capítulo 7.

**Prioridade:** média
````

### Pendência 5 — prioridade média
**Título:** Limitar a hipótese ao que o trabalho vai medir
**Labels:** `cap-introducao` `coerencia` `prio-media`

````markdown
## O que esta parte do TCC precisa ter

A hipótese é uma afirmação que o trabalho se compromete a **testar**. Por isso ela só pode conter
o que o desenho experimental é capaz de medir: no capítulo 6, cada parte da hipótese precisa
aparecer confirmada ou refutada por um resultado.

O que não é medido não é hipótese — é discussão, apoiada em literatura.

## Onde

`capitulos/01-introducao.typ` — seção 1.3 (Hipótese)

## Trecho

> "mantendo o desenvolvimento mais prático e simples anulando a complexidade da abordagem reativa"

## O que encontramos

A hipótese promete **três** resultados: desempenho, consumo de recursos e simplicidade de
desenvolvimento. O desenho previsto no capítulo 4 mede apenas os dois primeiros (teste de carga,
métricas de desempenho e de recursos). "Desenvolvimento mais prático e simples" não tem métrica
definida no trabalho — não há, por exemplo, contagem de linhas, tempo de implementação ou pesquisa
com desenvolvedores.

O risco é concreto: na defesa, a banca pergunta como a simplicidade foi medida e a resposta é que
não foi.

## Como resolver

1. **Reescreva a hipótese só com o que será medido.** Uma forma que funciona é a comparação
   explícita: *"Sob carga de I/O, as três abordagens apresentam desempenho distinto: espera-se que
   as threads virtuais alcancem throughput próximo ao do Spring WebFlux, com consumo de memória
   menor que o do Spring MVC, mantendo a latência p95 dentro de um limite aceitável."*

2. **Deixe cada termo mensurável nomeado**: *throughput*, latência p95 e p99, uso de CPU, consumo
   de memória. São exatamente as métricas do objetivo 3.

3. **Leve a simplicidade para a discussão (6.3).** Lá ela pode aparecer como observação
   qualitativa, sustentada por literatura — por exemplo, que o modelo bloqueante é mais simples de
   depurar porque a pilha de execução é preservada —, deixando claro que é análise, não medição.

4. **Faça a conferência inversa:** leia a hipótese e, para cada afirmação, pergunte "em que gráfico
   ou tabela do capítulo 6 isso aparece?". Se não houver resposta, a afirmação sai da hipótese.

5. **Não prometa resultado.** A hipótese pode dizer o que se espera, mas o texto deve deixar claro
   que o experimento pode refutá-la — é isso que a torna científica.

## Como saber que ficou pronto

- [ ] Cada afirmação da 1.3 tem uma métrica correspondente no capítulo 4.
- [ ] Cada afirmação da 1.3 pode ser respondida com um resultado do capítulo 6.
- [ ] A simplicidade de desenvolvimento não está mais na hipótese.
- [ ] A hipótese e o objetivo geral tratam do mesmo fenômeno.

**Prioridade:** média
````

### Pendência 7 — prioridade alta
**Título:** Mover o código do projeto para o repositório do TCC
**Labels:** `estrutura` `codigo` `prio-alta`

````markdown
## O que esta parte do TCC precisa ter

Quando o trabalho desenvolve software, o repositório tem **duas metades**: o código do projeto e o
texto do TCC. O template do curso já prevê essa organização — o texto vai para `docs/` e o código
fica na raiz (`src/`, scripts, configuração).

Isso não é formalidade de organização. É o que permite à banca conferir o que o texto afirma e
repetir as medições, e é o que sustenta o capítulo 5.

## Onde

Raiz do repositório. Hoje o texto está em `main.typ`, na raiz, e não há código.

## Trecho

> "# Repositório só do TCC: deixe TCC_DIR: . (main.typ na raiz)."
> "TCC_DIR: ."

## O que encontramos

O repositório tem apenas o template do TCC: `main.typ`, `capitulos/`, `pre-textuais/`,
`pos-textuais/`, `ifbasaj-tcc/`, `assets/`, `referencias.bib` e `data/resultados.csv` (esse
arquivo ainda traz dados de exemplo do template — Autenticação, Busca, Relatórios, Notificações).

O trabalho, porém, exige implementar **três** versões do mesmo serviço (Spring MVC, Spring WebFlux
e threads virtuais) e submetê-las a teste de carga. Sem o código no repositório:

- o capítulo 5 (Desenvolvimento) não tem o que descrever;
- o capítulo 6 (Resultados) não tem origem para os números;
- o experimento não pode ser repetido por outra pessoa.

## Como resolver

**Passo 1 — mover o texto para `docs/`, preservando o histórico.**

Use `git mv` (não arraste pelo explorador de arquivos), para que o Git entenda que é movimentação e
não exclusão seguida de criação. Vão para `docs/`:

```
main.typ
capitulos/
pre-textuais/
pos-textuais/
ifbasaj-tcc/
assets/
referencias.bib
data/
```

Ficam na raiz: `.github/`, `.gitignore`, `README.md`, `LICENSE` e `.vscode/`.

**Passo 2 — ajustar o workflow do PDF.**

Em `.github/workflows/pdf.yml` existe a variável `TCC_DIR: .`, com um comentário logo acima dizendo
que repositório só de TCC usa `.` e repositório com código usa `docs`. Troque para:

```yaml
TCC_DIR: docs
```

Depois do push, confira na aba **Actions** que o PDF continua sendo gerado — esse é o teste de que o
movimento não quebrou nada.

**Passo 3 — criar a pasta do código.**

Uma sugestão de estrutura, que já cobre o que os capítulos 4 e 5 vão precisar:

```
src/
  mvc/            implementação com Spring MVC
  webflux/        implementação com Spring WebFlux
  virtual-threads/  implementação com threads virtuais (uma thread virtual por requisição)
  comum/          domínio, contrato das rotas e configuração compartilhada
carga/
  k6/  ou  jmeter/   scripts de teste de carga
  docker-compose.yml ambiente de execução (serviço, banco, gerador de carga)
resultados/
  <data>/         saída bruta de cada execução
```

O ponto que mais importa para a validade do experimento: as três implementações devem ser
**funcionalmente equivalentes**. Mesmo domínio, mesmas rotas, mesmo banco, mesmo número de
operações por requisição. Só a estratégia de concorrência muda. Se uma delas fizer menos trabalho,
a comparação perde sentido — e é a primeira coisa que a banca vai perguntar.

**Passo 4 — documentar como rodar.**

Um `README.md` curto na raiz, com: requisitos (JDK, Docker), comando para subir cada implementação,
comando para executar a carga e onde os resultados aparecem. Sem isso, o experimento continua
irreproduzível mesmo com o código no repositório.

**Passo 5 — avisar o orientador.**

A mudança de layout muda o caminho do texto dentro do repositório. Avise o orientador quando o
push estiver feito, para que ele acompanhe o trabalho já na estrutura nova.

## Como saber que ficou pronto

- [ ] `main.typ` está em `docs/main.typ`, e a raiz não tem mais `capitulos/` nem `pre-textuais/`.
- [ ] O histórico dos arquivos movidos foi preservado (`git log --follow docs/main.typ` mostra os
      commits antigos).
- [ ] O workflow usa `TCC_DIR: docs` e o PDF é gerado com sucesso no Actions.
- [ ] `src/` tem as três implementações, e elas respondem às mesmas rotas.
- [ ] Existe um `README.md` explicando como executar o serviço e a carga.
- [ ] O orientador foi avisado sobre a mudança de estrutura.

**Prioridade:** alta
````

### Pendência 8 — prioridade alta
**Título:** Adaptar os títulos das seções ao tema
**Labels:** `cap-proposta` `estrutura` `prio-alta`

````markdown
## O que esta parte do TCC precisa ter

A **ordem** dos capítulos e seções do template está correta e deve ser mantida — ela segue a
estrutura exigida pelo curso. O que precisa mudar são os **títulos**: eles devem anunciar o
conteúdo real do trabalho, não o nome genérico do modelo.

Um título como "Tecnologias utilizadas" não diz nada sobre este TCC. "Spring MVC, Spring WebFlux e
Project Loom" diz exatamente o que o leitor vai encontrar. Quem lê o sumário precisa conseguir
reconstruir o argumento do trabalho só pelos títulos.

## Onde

`capitulos/02-referencial-teorico.typ` até `capitulos/07-consideracoes-finais.typ`

## Trecho

> "== Conceitos da área do problema"
> "== Tecnologias utilizadas"
> "== Engenharia de software"

## O que encontramos

Todos os títulos das seções dos capítulos 2 a 7 ainda são os genéricos do template. Os títulos dos
capítulos em si já estão adequados (Referencial teórico, Trabalhos correlatos, Metodologia,
Desenvolvimento do software, Resultados e avaliação, Considerações finais).

Há também uma seção que **não se aplica** a este trabalho: 6.2 "Avaliação com usuários". O
experimento compara desempenho, não opinião de usuários.

## Como resolver

1. **Renomeie só o texto do título, mantendo a âncora.** No Typst, o título termina com um
   identificador entre `<>`, usado pelos links internos. Em:

   ```
   == Tecnologias utilizadas <sec-tecnologias>
   ```

   o que muda é só "Tecnologias utilizadas". A parte `<sec-tecnologias>` fica intacta — se ela for
   apagada, os `@sec-tecnologias` espalhados pelo texto passam a apontar para nada e a compilação
   acusa erro.

2. **Aplique a lista sugerida** (a numeração é automática, não escreva "2.1" no título):

   | Seção | Título sugerido |
   |---|---|
   | 2.1 | Concorrência em Java: threads de plataforma, modelo reativo e threads virtuais |
   | 2.2 | Spring MVC, Spring WebFlux e Project Loom |
   | 2.3 | Microsserviços, arquitetura e avaliação de desempenho |
   | 3.1 | Critérios de comparação |
   | 3.2 | Trabalhos analisados |
   | 3.3 | Análise comparativa e lacuna |
   | 4.1 | Natureza da pesquisa |
   | 4.2 | Método de experimentação |
   | 4.3 | Requisitos do serviço de referência |
   | 4.4 | Tecnologias e ferramentas |
   | 4.5 | Procedimentos de avaliação |
   | 5.1 | Requisitos do serviço |
   | 5.2 | Arquitetura das três implementações |
   | 5.3 | Modelagem do domínio |
   | 5.4 | Implementação |
   | 5.5 | Testes funcionais e de carga |
   | 6.1 | Desempenho |
   | 6.2 | Consumo de recursos (hoje: "Avaliação com usuários") |
   | 6.3 | Discussão |
   | 6.4 | Limitações |
   | 7.1 | Retomada dos objetivos |
   | 7.2 | Trabalhos futuros |

   Os títulos de 3.x, 4.4, 4.5, 6.3, 6.4 e 7.x já servem; a lista está completa para você conferir
   o conjunto de uma vez.

3. **Adapte, não copie, se o seu recorte pedir.** Se, por exemplo, o capítulo 5 tiver um serviço de
   referência único com três implementações, "Arquitetura das três implementações" descreve melhor
   que "Arquitetura". O importante é que o título corresponda ao conteúdo que está abaixo dele.

4. **Se uma seção não se aplicar, não a apague sozinho.** A estrutura de seções é requisito do
   curso. O caso de 6.2 é o único previsto aqui (troca de título, não remoção); qualquer outra
   supressão deve ser combinada com o orientador.

5. **Compile e confira o sumário.** A numeração é gerada pelo Typst, então ela se ajusta sozinha;
   o que pode quebrar são as referências internas (`@sec-...`) e o sumário, que devem ser
   conferidos no PDF.

## Como saber que ficou pronto

- [ ] Nenhum título genérico do template sobrou nos capítulos 2 a 7.
- [ ] Todas as âncoras `<sec-...>` continuam nos títulos.
- [ ] O sumário do PDF mostra os títulos novos, com numeração contínua.
- [ ] A seção 6.2 não se chama mais "Avaliação com usuários".
- [ ] A compilação não acusa referência interna quebrada.

**Prioridade:** alta
````

### Pendência 9 — prioridade média
**Título:** Ler e incorporar as leituras sugeridas
**Labels:** `cap-referencial` `fonte` `prio-media`

````markdown
## O que esta parte do TCC precisa ter

O referencial teórico não é uma lista de obras: é uma **conversa entre fontes** que sustenta os
conceitos que o trabalho usa. Cada seção precisa que alguém com autoridade já tenha dito o que
você está dizendo — e o texto precisa mostrar de onde veio.

Listar obras na bibliografia sem citá-las no texto não cumpre esse papel, e citar sem ter lido
aparece rápido na defesa: basta uma pergunta sobre o método do estudo.

## Onde

- `capitulos/02-referencial-teorico.typ` — 2.1 (concorrência e threads) e 2.2 (Spring MVC, WebFlux e
  Loom)
- `capitulos/03-trabalhos-correlatos.typ` — 3.2 (trabalhos analisados)
- `capitulos/04-metodologia.typ` — 4.5 (procedimentos de avaliação)

## Trecho

> "A engenharia de software reúne práticas para produzir software de qualidade com custo previsível #cite(\"sommerville2011\")."

## O que encontramos

As obras abaixo foram levantadas e verificadas (DOI, ISBN ou página oficial), mas **nenhuma foi
incorporada ao texto**. Hoje o referencial ainda é o do template.

## Como resolver

**Passo 1 — distribua a leitura por seção.** Cada fonte tem um lugar natural:

| Fonte | O que ela sustenta | Onde citar |
|---|---|---|
| VEEN, R.; VLIJMINCX, D. *Virtual Threads in Java*. Apress, 2024. ISBN 979-8-8688-0181-5 | Como as threads virtuais funcionam sob o capô (carrier threads, continuations) e o que muda no modelo de concorrência | 2.1 |
| OPENJDK. *JEP 444: Virtual Threads*. 2023. https://openjdk.org/jeps/444 | Fonte primária: definição oficial, objetivos do projeto e limitações | 2.1 e 2.2 |
| DAVIS, A. L. *Reactive Streams in Java*. Apress, 2019. ISBN 978-1-4842-4175-2 | Modelo reativo, contrapressão e o custo de mudar o paradigma de programação | 2.2 |
| SIROTIĆ, Z. et al. *Comparison of Java Virtual and Non-Virtual Threads in Parallel Programming*. MIPRO, 2025. DOI 10.1109/MIPRO65660.2025.11131818 | Comparação experimental entre threads virtuais e de plataforma — o antecedente mais próximo do seu recorte | 3.2 |
| AMARAL, M. et al. *Performance Evaluation of Microservices Architectures Using Containers*. IEEE NCA, 2015. DOI 10.1109/NCA.2015.49 | Como avaliar desempenho de microsserviços em contêineres (métricas e desenho do experimento) | 3.2 e 4.5 |
| JIANG, Z. M.; HASSAN, A. E. *A Survey on Load Testing of Large-Scale Software Systems*. IEEE TSE, v. 41, n. 11, p. 1091-1118, 2015. DOI 10.1109/TSE.2015.2445340 | Metodologia de teste de carga: o que controlar, o que reportar, erros comuns | 4.5 |
| TECHEMPOWER. *Framework Benchmarks*. https://www.techempower.com/benchmarks/ | Benchmarks públicos de frameworks — referência para comparação e para discutir limitações | 3.2 |

**Passo 2 — leia com uma pergunta na cabeça.** Para cada obra, leia o resumo, a introdução, o
método e os resultados. Anote de 2 a 4 frases: qual problema o estudo resolve, como mediu e o que
concluiu. É esse resumo que vira parágrafo seu — não o texto do autor.

**Passo 3 — escreva o parágrafo antes de citar.** Redija a ideia com suas palavras e só então
insira a citação. Isso evita o contrário, que é comum: encaixar `#cite` em frases genéricas.

**Passo 4 — cadastre no `referencias.bib` e cite.**

```bibtex
@misc{openjdk2023jep444,
  author = {{OpenJDK}},
  title  = {JEP 444: Virtual Threads},
  year   = {2023},
  url    = {https://openjdk.org/jeps/444},
  note   = {Acesso em: 5 nov. 2026}
}

@inproceedings{sirotic2025,
  author    = {Siroti{\'c}, Z. and others},
  title     = {Comparison of Java Virtual and Non-Virtual Threads in Parallel Programming},
  booktitle = {MIPRO},
  year      = {2025},
  doi       = {10.1109/MIPRO65660.2025.11131818}
}
```

Use a forma do template para `#cite("chave")` e `#prose("chave")`; a chave é esse identificador
curto.

**Passo 5 — estabeleça a conversa entre as fontes.** O referencial fica bom quando uma fonte
responde à outra. Exemplos de movimento: "a JEP 444 define X, mas Veen e Vlijmincx mostram que, na
prática, Y"; "Sirotić et al. encontraram W em um recorte de CPU; este trabalho investiga um recorte
de I/O". É esse tipo de frase que a banca procura.

**Passo 6 — remova as citações de exemplo do template** ao reescrever os capítulos 2 e 4, para que
a bibliografia final reflita só o que o texto discute.

## Como saber que ficou pronto

- [ ] As 7 obras aparecem citadas no texto, não só na bibliografia.
- [ ] Cada seção do referencial tem pelo menos uma fonte acadêmica.
- [ ] Nenhuma citação foi feita sem leitura da obra.
- [ ] As chaves do `#cite`/`#prose` existem no `referencias.bib`.
- [ ] O capítulo 3 compara os trabalhos entre si, e não apenas os resume um a um.
- [ ] As citações de exemplo do template foram removidas.

**Prioridade:** média
````

### Conferência da publicação
- [x] Repositório certo: `LuisMiguelADS/template-tcc`
- [x] Issues habilitadas (já estavam)
- [ ] Labels criadas — **bloqueado**: conta do orientador sem permissão de triagem
- [x] 8 issues (pendências 1, 2, 3, 4, 5, 7, 8, 9), nenhuma para a 6
- [x] Nenhum código de regra no título, corpo ou label
- [x] Estados atualizados para `criada #N` depois da publicação
- [x] Corpos remotos conferidos contra os registrados aqui (idênticos, caractere a caractere)

Atualizado em: 2026-11-06
