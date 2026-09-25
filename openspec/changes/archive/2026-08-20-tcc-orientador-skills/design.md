## Context

O repo `orientador-llm` contém apenas o `analise.md` (rubrica de análise de fundamentação teórica) e as skills OpenSpec de fábrica em `.opencode/skills/`. Não há mudanças ativas nem specs existentes. O objetivo é criar uma família de skills que assiste o **orientador** no acompanhamento de TCCs, lendo o texto do aluno em markdown/typst e produzindo análises e sugestões, sem jamais editar o texto do TCC.

Estado atual relevante:
- Formato de skill usado no repo: diretório com `SKILL.md` com frontmatter `name`/`description` + corpo com instruções.
- Entrada: arquivos `.md`/`.typ` do TCC do aluno, organizados no repo.
- A única área gravável é o **Anexo de Acompanhamento** (capítulo temporário não normativo).
- Normas-alvo: ABNT; instituição de referência é o IFBA (nome do diretório pai).
- **Um repo por TCC**: o anexo tem caminho único na raiz do repo, sem colisão entre TCCs; as skills vivem neste repo (ou são copiadas por TCC).
- A família atende TCCs em fases diferentes — qualquer skill pode ser a primeira a ser invocada (ver D8).

## Goals / Non-Goals

**Goals:**
- Entregar uma família de 7 skills numeradas por ordem de ciclo de vida: `tcc-01-concepcao`, `tcc-02-estrutura`, `tcc-03-cronograma`, `tcc-04-fundamentacao`, `tcc-05-acompanhamento`, `tcc-06-revisao-final`, `tcc-07-apresentacao`.
- Garantir contrato de acesso claro: somente leitura do TCC; somente escrita no Anexo de Acompanhamento.
- Padronizar saída de feedback em tabela: localização / citação do aluno / diagnóstico / sugestão ao orientador / prioridade.
- Reutilizar `analise.md` como critério de diagnóstico da skill de fundamentação.
- Derivar cronograma por retroplanning a partir da data de defesa, com datas revisáveis.
- Verificar (sem executar) a remoção do anexo na revisão final.

**Non-Goals:**
- Não editar, reformatar ou corrigir o TCC do aluno diretamente.
- Não substituir o julgamento do orientador — as skills geram insumos e sugestões, não decisões finais.
- Não implementar integrações externas (sistemas acadêmicos, LMS, etc.) nesta iteração.
- Não cobrir normas de outras instituições além de ABNT/IFBA nesta iteração.

## Decisions

### D1. Estrutura da família de skills
Diretórios individuais em `.opencode/skills/` seguindo o padrão já existente (`openspec-*`):

```
.opencode/skills/
├── tcc-01-concepcao/SKILL.md
├── tcc-02-estrutura/SKILL.md
├── tcc-03-cronograma/SKILL.md
├── tcc-04-fundamentacao/SKILL.md
├── tcc-05-acompanhamento/SKILL.md
├── tcc-06-revisao-final/SKILL.md
├── tcc-07-apresentacao/SKILL.md
└── _shared/
    ├── anexo-acompanhamento.md        (modelo do capítulo temporário)
    ├── normas-abnt-ifba.md            (estrutura do documento, formatação, citações)
    └── rubrica-fundamentacao.md       (critérios do analise.md)
```

**Alternativa considerada:** uma única skill com modos internos. Rejeitada: dificulta invocação seletiva e mistura responsabilidades de fases distintas.

### D2. Contrato de acesso (somente leitura / somente escrita)
- TCC do aluno (`.md`/`.typ`): **somente leitura**. Diagnósticos viram sugestões na saída; nunca edições no arquivo.
- Anexo de Acompanhamento: **única área gravável**. Marcas, histórico, pendências e feedbacks acumulados vivem aqui.
- **Alternativa considerada:** arquivo de estado separado (`tcc-state.json`). Rejeitada: o anexo como capítulo do próprio documento mantém o histórico visível ao aluno e evita arquivos paralelos que podem dessincronizar.

### D3. Formato do Anexo de Acompanhamento
Modelo compartilhado em `_shared/anexo-acompanhamento.md` com 3 seções:

```
# Anexo de Acompanhamento da Orientação
> Material de trabalho (não normativo). Remover na versão final.

## 1. Marcos do cronograma
| # | Marco | Data alvo | Data revisada | Status | Entrega associada |

## 2. Histórico de orientações
| Data | Tópico | Decisões | Próximos passos |

## 3. Pendências e feedbacks acumulados
| Data | Pendência | Status | Nota |
```

Cada skill que produz feedback anexa linhas nas seções apropriadas. A numeração da ordem de chamada das skills reflete o ciclo de vida, mas `03`, `04` e `05` formam um loop: o acompanhamento chama a fundamentação quando o capítulo entregue é o de fundamentação teórica, e ambos atualizam o anexo. O anexo vive na raiz do repo (`anexo-acompanhamento.md`), caminho único por TCC. A criação é condicional (ver D8): a primeira skill que tem algo a persistir o cria, copiando o modelo de `_shared/anexo-acompanhamento.md`.

### D4. Saída de feedback em tabela
Formato padrão compartilhado pelas skills que analisam texto (`04` e `05`):

| Localização | Citação do aluno | Diagnóstico | Sugestão ao orientador | Prioridade |
|-------------|------------------|-------------|------------------------|------------|

- **Localização:** capítulo/seção/linha (ex.: `Cap. 2 §2.3`, `arquivo.md:120`).
- **Citação do aluno:** trecho literal do texto para o orientador localizar rápido.
- **Diagnóstico:** problema identificado (ex.: "conceito fora do escopo", "ambigüidade na definição").
- **Sugestão ao orientador:** pergunta ou encaminhamento a discutir com o aluno.
- **Prioridade:** alta / média / baixa.

A `04-fundamentacao` usa a `_shared/rubrica-fundamentacao.md` como critério de diagnóstico (abrangência da revisão, coerência, aderência ao escopo, contradições, base para metodologia e resultados).

### D5. Cronograma por retroplanning
A skill `tcc-03-cronograma`:
1. Pergunta a data de defesa ao orientador.
2. Se não houver data marcada, usa uma **data-alvo provisória** (marcada como tal na coluna `Data alvo`); como fallback, pede uma duração estimada e deriva a data provisória a partir dela.
3. Deriva datas-alvo inversamente (retroplanning): defesa → revisão final → resultados → metodologia → fundamentação → projeto/estrutura.
4. Grava os marcos na seção 1 do anexo.
5. Em rodadas seguintes, permite revisar datas: a revisão fica em `Data revisada` e o motivo/contexto é registrado no histórico de orientações (seção 2).

### D6. Revisão final verifica, não limpa
`tcc-06-revisao-final` produz checklist e verifica:
- (a) estrutura do documento conforme ABNT (todas as seções presentes);
- (b) correspondência citações × referências (toda citação referenciada e vice-versa);
- (c) consistência entre capítulos (termos, objetivos ↔ resultados);
- (d) formatação geral conforme normas ABNT/IFBA.
Aponta que o Anexo de Acompanhamento deve ser removido na versão final, mas **não** executa a remoção — é decisão do aluno.

### D7. Uso do `analise.md`
O arquivo `analise.md` na raiz é a fonte da rubrica. Ele é transformado em `_shared/rubrica-fundamentacao.md`, preservando as 3 dimensões originais (estrutura/abrangência, aderência ao escopo, inconsistências/contradições) e o estilo do exemplo multimodal como guia de tom para o diagnóstico.

### D8. Skills auto-contidas (invocação parcial)
Cada skill funciona isoladamente — a família pode ser usada para TCCs em fases diferentes, e uma skill pode ser a primeira (ou única) a ser chamada. Nenhuma skill assume que fases anteriores rodaram ou que o anexo existe.

Regras:
1. A skill descobre ou coleta seu próprio contexto: lê o texto do aluno (se houver), lê o anexo (se existir) e, na ausência de ambos, pergunta ao orientador o mínimo necessário.
2. A saída ao orientador (análise, checklist, simulação) é sempre produzida, independentemente da existência do anexo.
3. O anexo é criado apenas quando a skill tem algo a persistir para uma rodada futura — em invocação única (ex.: só `06-revisao-final`), a entrega é o checklist e a criação do anexo é opcional.

## Risks / Trade-offs

- [Aluno esquece de remover o anexo] → Mitigação: `06-revisao-final` verifica explicitamente e lista a remoção como pendência de alta prioridade.
- [Datas do cronograma ficam desatualizadas] → Mitigação: `03-cronograma` mantém coluna `Data revisada` e registra revisões no histórico; cada rodada de acompanhamento lembra o orientador de revalidar marcos.
- [Saída em tabela pode engessar análises qualitativas] → Mitigação: a tabela é o esqueleto; as skills podem acrescentar seções em prosa (resumo executivo, pontos para a reunião) além dela.
- [Skills podem divergir do modelo do anexo] → Mitigação: modelo centralizado em `_shared/`; todas as skills referenciam o mesmo arquivo.
- [Repo sem TCC do aluno presente no diretório] → Mitigação: as skills descobrem os arquivos por glob (D9); se não houver, perguntam onde estão ou aceitam trecho colado como fallback.
- [Invocação parcial sem contexto acumulado] → Mitigação: skills auto-contidas (D8) descobrem/coletam o contexto e perguntam o mínimo necessário ao orientador quando não houver texto ou anexo.

## Open Questions

<!-- Nenhuma pergunta em aberto. -->

### D9. Descoberta dos arquivos do aluno
As skills que leem o texto do TCC localizam os arquivos por **glob no diretório** (`**/*.md`, `**/*.typ`), respeitando a convenção de organização do orientador (P1). A descoberta segue a auto-contenção do D8:
1. A skill varre o repo por arquivos `.md`/`.typ` do TCC (excluindo o anexo e o próprio diretório `.opencode/`).
2. Se encontrar, usa esses arquivos como entrada.
3. Se não encontrar, pergunta ao orientador onde estão (ou aceita trecho colado como fallback).