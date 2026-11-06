# Acompanhamento da Orientação — Luis Guilherme Passos Ramos

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
| 2026-11-05 | Revisão 20.2 — etapa 00 (pré-reunião) | O repositório é **o template do curso sem nenhuma edição do aluno**: últimos commits são da organização do template (2026-10-23), `main.typ` ainda com título/autor/banca de exemplo, todos os capítulos com caixas `#orientacao` e `#lorem`, resumo e abstract de exemplo. Não há proposta inicial para analisar. Estrutura de títulos, porém, está conforme EST-01. | Aluno precisa colocar a proposta inicial no repositório; reunião depende do tema. |
| 2026-11-05 | Correção de registro — codificação | A observação de que "a cópia do template está em dupla codificação" era **falso positivo**: a checagem contava qualquer `Ã` como corrupção, e `Ã` é legítimo em "NÃO DEVE" nas caixas de orientação. Verificação byte a byte: **0 ocorrências** de dupla codificação no repositório inteiro. Pendência 2 marcada como `rejeitada`. | Nenhuma ação do aluno. |

## 3. Pendências rastreáveis

> Preenchido pela `tcc-20-orientar`, `tcc-40-solicitar` e `tcc-50-revisar`; sincronizado com o
> GitHub apenas pela `tcc-60-sincronizar`. O Diagnóstico começa pelo código da regra de
> `normas/conteudo-por-secao.md`, quando houver. O código é interno: nas issues do aluno ele é
> trocado por uma descrição detalhada da regra. Estados em `contrato/contrato-de-acesso.md`.

| # | Labels | Título | Localização | Citação | Diagnóstico | Sugestão | Prioridade | Estado | Issue | Comentários |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | `cap-proposta` `estrutura` `entregavel` | Proposta inicial não está no repositório | `main.typ:21` (também `capitulos/01-introducao.typ:43`) | "titulo: \"Título do Trabalho de Conclusão de Curso\"" | EST-04: todas as seções estão com placeholder do template (`#lorem`, caixas `#orientacao`, banca e ficha catalográfica de exemplo). Não existe texto do aluno em nenhum arquivo, então a etapa 00 não tem proposta para analisar. | Escrever a proposta inicial no capítulo 1 (tema, problema como pergunta, escopo e justificativa) ou colar o pré-projeto da disciplina de Projeto de Inovação; preencher `titulo`, `autor` e `orientador` no `main.typ`. | alta | pendente | | Último commit do repositório é do template (2026-10-23), não do aluno. |
| 2 | `formato` | Acentos corrompidos em todo o template (mojibake) | `main.typ:21` (também `capitulos/*.typ`, `pre-textuais/resumo.typ`, `ifbasaj-tcc/layout.typ`) | "= Introdução <cap-introducao>" | **Falso positivo** (corrigido em 2026-11-05). A checagem contava qualquer `Ã` como corrupção, e `Ã` aparece legitimamente em "NÃO DEVE" nas caixas de orientação do template. Verificação byte a byte com o padrão de dupla codificação deu **0 ocorrências** no repositório inteiro. | Nada a corrigir. | alta | rejeitada | | Erro de detecção do orientador, não do aluno. Os arquivos estão em UTF-8 correto. |

## 4. Leituras sugeridas

> Preenchido pela `tcc-20-orientar` (passo 20.3). Só referências verificadas: a coluna
> Verificação traz o DOI, ISBN ou link conferido.

| Data | Tópico / seção | Referência (ABNT) | Verificação | Situação |
|---|---|---|---|---|
| | | | | sugerida |

Atualizado em: 2026-11-05
