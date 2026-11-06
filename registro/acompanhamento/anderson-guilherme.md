# Acompanhamento da Orientação — Anderson Guilherme Santana Moraes

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
| 2026-11-05 | Revisão 20.2 — etapa 00 (pré-reunião) | Texto existente já cobre tema, problema, escopo, hipótese, objetivos e capítulos 2 a 4 como **proposta** de TCC. Observações de etapas futuras: cap. 5 e 6 escritos mas fora do `main.typ`; cap. 4 substitui as seções 4.2/4.3/4.4 recomendadas por "objeto de estudo", participantes, instrumentos etc.; cap. 5 sem modelagem e sem testes; correlatos são produtos comerciais sem referência. Placeholders de banca e ficha catalográfica ainda do template. | Reunião: decidir a estrutura do TCC (onde entram os cap. 5 e 6) e o que fazer com o texto de proposta. |
| 2026-11-05 | 20.3 — aderência ao curso e linha do orientador | Núcleo atual do trabalho é **avaliação de uso** (IHC/tecnologia educacional): objetivos e método giram em torno de percepção, SUS e entrevistas; a engenharia aparece só como descrição do objeto (cap. 5). O orientador quer linha técnica — desenvolvimento, desempenho e escalabilidade. Apresentadas três rotas: (A) avaliação de desempenho e escalabilidade do módulo de telemetria/painéis; (B) projeto e avaliação de um pipeline de learning analytics; (C) híbrido, com estudo de uso reduzido como capítulo secundário. Sem decisão nesta sessão. Restrição registrada: o repositório não tem código (layout 2), o que impede verificar DES-07 e reproduzir medições. | Decidir a rota e, se técnica, mover o código para o repositório (layout 1: `src/` + TCC em `docs/`) e reescrever cap. 4 a 6 e o resumo. |
| 2026-11-05 | 20.3 — direcionamento discutido com o aluno | Aluno propôs desenvolver um **módulo de sugestão de ajuste do cronograma/ciclo** a partir do desempenho do ciclo anterior; hoje o ajuste é manual, feito pelo próprio usuário olhando os resultados. Enquadrado como TCC de desenvolvimento: motor de recomendação explicável, com avaliação por simulação sobre ciclos históricos/sintéticos e piloto reduzido. Em aberto: abordagem (regras × alocação sob restrição), disponibilidade de dados históricos e definição do escopo mínimo. `data-banca` de 2026-12-10 confirmada como placeholder do template. | Fechar escopo do módulo (sinais de entrada, saída da sugestão, política de ajuste), definir o desenho de avaliação e só então reescrever 1.1–1.6 e cap. 4–6. |

## 3. Pendências rastreáveis

> Preenchido pela `tcc-20-orientar`, `tcc-40-solicitar` e `tcc-50-revisar`; sincronizado com o
> GitHub apenas pela `tcc-60-sincronizar`. O Diagnóstico começa pelo código da regra de
> `normas/conteudo-por-secao.md`, quando houver. O código é interno: nas issues do aluno ele é
> trocado por uma descrição detalhada da regra. Estados em `contrato/contrato-de-acesso.md`.

| # | Labels | Título | Localização | Citação | Diagnóstico | Sugestão | Prioridade | Estado | Issue | Comentários |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | `cap-introducao` `formato` | Texto dos capítulos corrompido (mojibake) | `capitulos/01-introducao.typ:1` (também 02 a 07 e `pos-textuais/apendice-a-roteiro.typ`) | "A preparaÃ§Ã£o para concursos..." | Formato: os arquivos `.typ` dos capítulos estão em dupla codificação (UTF-8 interpretado como Windows-1252), então todo acento sai corrompido no PDF. `main.typ` e `pre-textuais/` estão corretos. | Regravar os capítulos em UTF-8 sem BOM (reabrir no editor com a codificação certa ou aplicar conversão única de Windows-1252 para UTF-8) e conferir o PDF compilado. | alta | pendente | | Afeta a leitura do trabalho inteiro; é o primeiro item a resolver. |
| 2 | `cap-introducao` `estrutura` | Objetivos específicos com 7 itens | `capitulos/01-introducao.typ:45` | "- Descrever os recursos... / - Produzir recomendações..." | INT-12: a seção 1.5 tem 7 objetivos específicos; a norma pede de 3 a 5, cada um com verbo no infinitivo e verificável na conclusão. | Agrupar itens afins (recursos + usabilidade; indicadores + uso dos dados) até no máximo 5, preservando um verbo por item. | média | pendente | | |
| 3 | `cap-referencial` `fonte` | Incorporar as leituras sugeridas | `capitulos/02-referencial-teorico.typ` | — | Fonte: as quatro leituras registradas na seção 4 (Kizilcec et al., Jivet et al., Wong et al., Araka et al.) cobrem medição da autorregulação, painéis analíticos e apoio em ambientes online; ainda não estão no texto. | Ler as obras e incorporar ao referencial (2.1/2.2) e à justificativa da avaliação (4.5), citando com `#cite` e atualizando `referencias.bib`. | média | pendente | | Sugeridas na sessão de 2026-11-05, todas verificadas por DOI. |
| 4 | `cap-proposta` `estrutura` | Reescrever tema, problema, hipótese e objetivos para o módulo de recomendação | `capitulos/01-introducao.typ:9-51` | "o trabalho propõe uma avaliação acadêmica do ModoQAP" | Escopo: o problema e os objetivos atuais avaliam uso e percepção; a decisão de 2026-11-05 é desenvolver um módulo que sugere o ajuste do ciclo seguinte a partir do desempenho do ciclo anterior. | Reescrever 1.1 a 1.6 em torno da pergunta de pesquisa do módulo (sugestão viável, explicável e de baixo custo), mantendo no máximo 5 objetivos específicos. | alta | pendente | | Resolve também a pendência 2. |
| 5 | `cap-correlatos` `fonte` | Correlatos ainda comparam ferramentas, não algoritmos | `capitulos/03-trabalhos-correlatos.typ:21-47` | "Planilhas eletrônicas... Aplicativos móveis... Anki" | COR-03 e COR-07: os correlatos analisam produtos comerciais sem referência e não tratam repetição espaçada nem agendamento/recomendação, que passam a ser o núcleo do trabalho. | Substituir por trabalhos verificáveis sobre SM-2/FSRS, agendamento adaptativo e recomendação de planos de estudo, mantendo objetivo, solução e lacuna por trabalho. | alta | pendente | | |
| 6 | `cap-metodologia` `estrutura` | Metodologia ainda descreve estudo de campo de seis semanas | `capitulos/04-metodologia.typ:7-126` | "estudo de grupo único com avaliações antes e após um período de intervenção de seis semanas" | MET-04 e MET-07: o desenho atual não corresponde ao novo trabalho. A proposta é design science, com experimento computacional sobre ciclos históricos e piloto reduzido como validação secundária. | Reescrever 4.1 a 4.5: natureza aplicada e design science; unidade de análise = par ciclo→ciclo; instrumentos = base de eventos e planos; avaliação = cobertura de tópicos fracos, viabilidade da carga, equilíbrio, aderência e custo computacional. | alta | pendente | | |
| 7 | `estrutura` `formato` | Repositório precisa passar ao layout 1 (código + TCC em `docs/`) | `main.typ:1` (raiz do repositório) | — | Formato: o repositório está em layout 2 (só TCC). Com desenvolvimento de módulo, o contrato exige código em `src/` e TCC em `docs/`, com `tcc_dir: docs` no registro. | Mover o template para `docs/`, criar `src/` com o código do módulo e ajustar `TCC_DIR` no workflow; avisar o orientador para atualizar o registro. | alta | pendente | | |
| 8 | `cap-metodologia` `fato` | Dicionário de dados e amostra dos ciclos históricos | — | — | Fato: a avaliação depende dos ciclos reais já registrados no ModoQAP. Sem dicionário e amostra não é possível dimensionar o experimento nem fechar as métricas. | Entregar dicionário (entidades, campos, granularidade por tópico, período) e amostra anonimizada de pares ciclo→ciclo, informando quantos usuários e ciclos existem. | alta | pendente | | |
| 9 | `cap-metodologia` `seguranca` | Base legal e ética para usar dados reais de usuários | `capitulos/04-metodologia.typ:128-134` | "submeter e adequar o protocolo às exigências institucionais de ética" | Segurança/LGPD: o texto prevê consentimento para os participantes do estudo de campo, mas não para o uso secundário de registros históricos. | Definir base legal e processo de anonimização, consultar o comitê de ética do campus e registrar o procedimento no cap. 4 e no termo de consentimento. | alta | pendente | | |
| 10 | `cap-desenvolvimento` `fato` | Especificar a distribuição automática que já existe | — | "DISTRIBUICAO AUTOMATICA — o sistema equilibra disciplinas, revisões e carga semanal" | Fato: a plataforma já oferece distribuição automática (tela de escolha do modo de planejamento), o que contradiz a premissa de que o ajuste é só manual. Sem a especificação do algoritmo atual não há como definir a lacuna nem a linha de base do novo módulo. | O aluno deve documentar entradas, restrições, algoritmo, tratamento de atraso e dados disponíveis (pseudocódigo e modelo de dados), e dizer o que a distribuição atual **não** considera. | alta | pendente | | Print da tela enviado pelo orientador em 2026-11-05. Roteiro de 20 perguntas na **seção 5** (pauta do próximo encontro). |

## 4. Leituras sugeridas

> Preenchido pela `tcc-20-orientar` (passo 20.3). Só referências verificadas: a coluna
> Verificação traz o DOI, ISBN ou link conferido.

| Data | Tópico / seção | Referência (ABNT) | Verificação | Situação |
|---|---|---|---|---|
| 2026-11-05 | 2.1 Autorregulação — comportamento e metas em ambientes online | KIZILCEC, R. F.; PÉREZ-SANAGUSTÍN, M.; MALDONADO, J. J. Self-regulated learning strategies predict learner behavior and goal attainment in Massive Open Online Courses. **Computers & Education**, v. 104, p. 18-33, 2017. | DOI 10.1016/j.compedu.2016.10.001 | sugerida |
| 2026-11-05 | 2.2 Painéis analíticos — do gráfico à decisão do estudante | JIVET, I.; SCHEFFEL, M.; SPECHT, M.; DRACHSLER, H. License to evaluate: preparing learning analytics dashboards for educational practice. In: **Proceedings of the 8th International Conference on Learning Analytics and Knowledge**, 2018. p. 31-40. | DOI 10.1145/3170358.3170421 | sugerida |
| 2026-11-05 | 2.1 e 4.5 — apoio tecnológico à autorregulação | WONG, J.; BAARS, M.; DAVIS, D.; VAN DER ZEE, T.; HOUBEN, G.-J.; PAAS, F. Supporting self-regulated learning in online learning environments and MOOCs: a systematic review. **International Journal of Human–Computer Interaction**, v. 35, n. 4-5, p. 356-373, 2019. | DOI 10.1080/10447318.2018.1543084 | sugerida |
| 2026-11-05 | 4.5 — instrumentos de medição da autorregulação | ARAKA, E.; MAINA, E.; GITONGA, R.; OBOKO, R. Research trends in measurement and intervention tools for self-regulated learning for e-learning environments: systematic review (2008-2018). **Research and Practice in Technology Enhanced Learning**, v. 15, n. 1, 2020. | DOI 10.1186/s41039-020-00129-5 | sugerida |

## 5. Pauta do próximo encontro — distribuição automática do ModoQAP

> Registrado em 2026-11-05 para o próximo encontro de orientação. Origem: print da tela
> "Vamos montar seu novo cronograma?" (DISTRIBUICAO AUTOMATICA — "o sistema equilibra
> disciplinas, revisões e carga semanal"), que contradiz a premissa de que o ajuste é manual.
> Resolve a pendência 10 (seção 3). As respostas definem se o TCC é **novo módulo de
> recomendação** ou **diagnóstico e reformulação do algoritmo existente**.

### Bloco A — Quando e onde roda
1. A distribuição automática aparece só na criação do cronograma/ciclo, ou também roda de novo no início de cada ciclo?
2. Quem dispara: o usuário clica, ou o sistema recalcula sozinho ao encerrar um ciclo?
3. Se o usuário escolhe "montar manualmente", o automático continua disponível depois?

### Bloco B — Entradas
4. Quais dados ela usa hoje: peso do edital, disponibilidade semanal, tempo por disciplina, revisões pendentes, desempenho (acertos), histórico de atraso, dificuldade declarada? Listar **todos**.
5. Como a disponibilidade é informada (horas por dia? dias da semana? faixa de horário?) e o que acontece se ela mudar no meio do ciclo?
6. Ela considera o **desempenho do ciclo anterior**? Se sim, como (limiar? proporção? prioridade?) e desde quando isso existe no sistema?

### Bloco C — Regras e restrições
7. Qual é a lógica: regras fixas, round-robin ponderado, cálculo de prioridade, outra coisa? Descrever em pseudocódigo.
8. Quais restrições ela respeita: carga máxima por dia, bloco mínimo por tópico, máximo de disciplinas por dia, intervalo entre revisões, dias de descanso?
9. Como as revisões espaçadas são agendadas: intervalos fixos, SM-2, FSRS, outro?
10. O que acontece quando a carga não cabe (ex.: 40 h de conteúdo para 12 h de semana)? Corta o quê, avisa o usuário, relaxa alguma restrição?

### Bloco D — Atraso e replanejamento
11. Se o aluno atrasa dois dias, o sistema redistribui o restante, empurra tudo ou deixa acumular?
12. Quando o desempenho cai em uma disciplina, o que muda no plano: mais tempo, mais revisões, prioridade, nada?
13. O replanejamento preserva o que já estava planejado ou refaz o plano inteiro (quanto "vira a rotina" do aluno)?

### Bloco E — Saída e controle do usuário
14. O plano gerado pode ser editado? Existe forma de "congelar" um item para o automático não mexer?
15. O sistema mostra **por que** alocou cada tópico daquele jeito, ou só entrega a grade pronta?

### Bloco F — Dados e reprodutibilidade
16. Qual o modelo de dados: tabelas de plano, eventos de sessão, revisões, resultados por tópico? Qual a granularidade (tópico? subtópico? questão)?
17. Quanto histórico existe (nº de usuários, ciclos completos, período) e ele pode ser exportado anonimizado?
18. Existe versionamento do plano (planejado vs. executado), ou só o estado atual?

### Bloco G — Lacuna percebida
19. Na visão dele, o que a distribuição automática **não** faz bem hoje? Citar 2 ou 3 casos concretos de usuários.
20. Ele consegue enviar 2 ou 3 exemplos reais de planos gerados (anonimizados) + o resultado do ciclo correspondente?

### Artefatos a pedir (além das respostas)
- pseudocódigo ou trecho do código da distribuição automática;
- diagrama do modelo de dados (plano, eventos, revisões, resultados);
- 2 a 3 planos de exemplo gerados pelo automático, com o resultado do ciclo.

### Decisão que depende das respostas
| Se a distribuição automática… | Então o TCC passa a ser |
|---|---|
| roda só na criação do plano e o replanejamento entre ciclos é manual | **novo módulo** de recomendação guiada por desempenho (Nível 3 — alocação sob restrição) |
| já roda a cada ciclo e já usa desempenho | **diagnóstico e reformulação** do algoritmo existente: explicabilidade, estabilidade, otimalidade (gap vs. solução ótima) |
| roda a cada ciclo, mas sem sinal de desempenho | **reformulação com sinal de desempenho**, tendo o algoritmo atual como linha de base legítima |

Em qualquer cenário, o Nível 3 (alocação sob restrição, heurística comparada ao ótimo) permanece
como núcleo técnico; muda apenas o que é "novo" e o que é "existente".

Atualizado em: 2026-11-05
