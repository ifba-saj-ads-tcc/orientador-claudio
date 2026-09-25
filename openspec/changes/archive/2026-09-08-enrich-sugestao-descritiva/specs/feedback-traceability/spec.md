## MODIFIED Requirements

### Requirement: Registro no Anexo de Acompanhamento
A skill de orientação SHALL refletir cada pendência no Anexo de Acompanhamento por meio da tabela rica (Localização, Citação, Diagnóstico, Sugestão, Prioridade, Labels, Body replay, Estado, Comentários), sem editar o texto do TCC. O campo `Sugestão` SHALL ser descritivo e auto-contido para o comentário da issue no GitHub: toda Sugestão SHALL conter (a) ação específica com localização, (b) explicação inline de siglas/normas/conceitos na primeira ocorrência (ex.: `IMRaD (Introdução-Métodos-Resultados-Discussão)`, `NBR 6028:2021 — 150–500 palavras`), (c) passos numerados acionáveis, e (d) critério de verificação (como o orientador/aluno confirma que está ok). A tabela do Anexo pode ficar larga; explicações SHALL ser inline (sem glossário externo). A criação da issue no GitHub replica `Sugestão: <sug>` via `tcc-00-sync-issues` sem truncamento.

#### Scenario: Sugestão descritiva para resumo IMRaD
- **WHEN** skill registra pendência de resumo incompleto (`NBR 6028`, `IMRaD`)
- **THEN** Sugestão contém `IMRaD (Introdução-Métodos-Resultados-Discussão)` explicado inline, faixa `150–500 palavras`, passos (contar palavras, checar cada letra do IMRaD, espelhar PT/EN) e critério (`orientador aprova + NBR 6028 ok`)

#### Scenario: Sugestão descritiva genérica
- **WHEN** qualquer pendência é registrada em qualquer `tcc-*`
- **THEN** Sugestão inclui ação + conceito explicado inline + 2–4 passos + critério de verificação em 3–5 linhas, adequada para leitura isolada na issue

#### Scenario: Espelho atualizado com a issue
- **WHEN** pendência é registrada ou issue tem estado/comentário alterado no GitHub
- **THEN** `tcc-00` atualiza a linha no Anexo e mantém o TCC como somente leitura

