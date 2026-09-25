---
name: tcc-06-revisao-final
description: Verifica o TCC final conforme normas ABNT/IFBA (estrutura, citações x referências, consistência entre capítulos, formatação) e checa a exclusão do Anexo de Acompanhamento do material entregue, consolidando um checklist de entrega. Referencia as issues de rastreabilidade. Não remove o anexo — apenas aponta. Use como revisão prévia antes da entrega/defesa.
---

# tcc-06-revisao-final — Revisão final e checklist de entrega

Assistente do **orientador** na verificação final do TCC antes da entrega/defesa. Verifica, não edita e **não remove** o anexo.

## Contrato (obrigatório)

- Leia `_shared/contrato-e-decisoes.md` antes de agir.
- **Texto do TCC: somente leitura** (\lunos/<id>/ em multi-aluno). **Anexo: única área gravável** (\companhamento/<id>.md em multi-aluno; \nexo-acompanhamento.md em legado).
- **Anexo é fonte do conteúdo; GitHub é projeção do estado (tcc-00 é gate)** das pendências** (número da issue = código de rastreabilidade). O Anexo mantém **Pendências rastreáveis** com tabela rica.
- Consulte `_shared/normas-abnt-ifba.md` (seção 5) como referência de verificação.
- **Nível de exigência:** aplique `_shared/rubrica-rigor-textual.md` (coerência, fluidez, redundância, colocação de conteúdo) ao verificar a consistência entre capítulos.
- **Auto-contenção (D8):** produza o checklist sempre; crie o anexo apenas se houver pendências a persistir.
- **Descoberta (D9):** localize o documento por glob `**/*.md` e `**/*.typ` (excluindo anexo e `.opencode/`). Se não houver, pergunte ou aceite texto colado.

## Fluxo de trabalho

### 1. Coletar o documento
- Localize o documento final por glob (ou texto colado).
- Verifique se o arquivo `anexo-acompanhamento.md` ainda está presente no material a ser entregue.

### 2. Aplicar as verificações
- **(a) Estrutura ABNT:** presença e ordenação de elementos pré-textuais, textuais e pós-textuais.
- **(b) Citações × referências:** toda citação tem referência e vice-versa.
- **(c) Consistência entre capítulos:** termos uniformes; objetivos ↔ metodologia ↔ resultados coerentes; sem redundância e com cada conteúdo no capítulo correto (ver `_shared/rubrica-rigor-textual.md`).
- **(d) Formatação NBR 14724:2024 / 6024:2012 / 6027:2012:** A4, margens 3 (sup) /3 (esq) /2 (inf)/2 (dir) cm, fonte Arial/Times 12 (10 em citações ≥4 linhas, notas, legendas), espaçamento 1,5 no corpo / simples em citações longas/notas/referências/legendas, recuo 1,25 cm, seções primárias `1 INTRODUÇÃO` caixa alta negrito em página nova (ímpar se frente-verso), secundária `1.1` negrito, terciária `1.1.1` normal, quaternária itálico; paginação contada da folha de rosto, numerada da Introdução no canto sup. direito.
- **(e) Citações NBR 10520:2023:** direta curta <4 linhas entre aspas, longa ≥4 linhas recuo 4 cm/fonte 10/simples/sem aspas; indireta sem aspas; `apud`; 1-3 autores por extenso, >3 `et al.`; ano+página quando direto.
- **(f) Referências NBR 6023:2025:** ordem alfabética sobrenome CAIXA ALTA, alinhamento esq., simples dentro/branco entre, `SOBRENOME, Nome. **Título**. Local: Editora, Ano.` + `Disponível em:`/`Acesso em:` para web; vídeos/podcasts/redes com formato próprio; destacar negrito mantido.
- **(g) Ilustrações/Tabelas/Quadros:** tabela = numérico bordas abertas (IBGE), quadro = textual grade fechada; título/legenda acima para tabela/quadro, abaixo para figura/código; fonte obrigatória `Fonte: Elaborado pelo autor (2026)` mesmo autoral; numeração contínua e chamada no texto.
- **(h) Resumo/Abstract NBR 6028:2021 + Sumário NBR 6027:2012:** resumo 150-500 palavras parágrafo único, sem citação/fórmula/abrev não definida, 3-6 palavras-chave `Palavras-chave: a; b; c.` voz ativa 3ª pessoa; abstract espelho; sumário último pré-textual, tipografia igual ao texto, sem pré-textuais, com linha pontilhada até página.
- **(i) Unicidade de legendas:** toda `figura`/`tabela`/`codigo`/`algoritmo` `caption` única; grep duplicatas (ex.: `Inicialização do servidor` 2× `main.typ:602,609`; `Criação do content` 4× `682,719,727,733`) → `formato` `prio-media`.
- **(j) Completude Resumo IMRaD:** `resumo-conteudo`/`abstract-conteudo` `main.typ:7,9` deve cobrir problema→objetivo→método→resultados→conclusão; <100 palavras ou omissão de termos do documento (fragmentação 190/192/193, OpenRouter, Gemini) → `resumo` `prio-alta`. Ao registrar, escreva `Sugestão` descritiva (ação+localização + sigla/norma explicada inline ex.: `IMRaD (Introdução-Métodos-Resultados-Discussão)`, `NBR 6028:2021 150–500 palavras` + passos 1) 2) 3) + critério), 3–5 linhas, legível isolada na issue.

### 3. Verificar a exclusão do Anexo
- Se o anexo **ainda estiver no material**: aponte que é material de trabalho não normativo, **mantenha/crie a issue `entregavel` de remoção aberta** e registre como pendência de alta prioridade — você **não remove** o arquivo.
- Se o anexo **já foi excluído**: confirme e **feche a issue `entregavel`** de remoção.

### 4. Consolidar o checklist
Entregue um checklist com **status por item** (ok / pendente / n/a) e priorize pendências, **referenciando a issue** de cada pendência acumulada. Liste pendências com `Estado: rejeitada` em seção separada **"Rejeitadas (não bloqueiam)"** — não bloqueiam entrega/defesa, apenas histórico/rastreabilidade:
| Verificação | Status | Issue | Observação | Prioridade |
|-------------|--------|-------|------------|------------|

Complemente com resumo executivo e **pontos a resolver antes da entrega**.

### 5. Registrar (se houver pendências)
Se houver pendências (ex.: remoção do anexo), atualize as issues correspondentes, **atualize Pendências rastreáveis** na seção **3** do Anexo e registre no **2. Histórico**. Em reavaliação, se o texto agora atende ao critério (ex.: resumo 214w IMRaD), atualize a linha para `corrigida aguardando validacao` (visível antes do `tcc-00`); manter esse estado no `tcc-00` = concordância.

## Regras
- **Nunca remova** o Anexo de Acompanhamento; apenas aponte a necessidade.
- Não edite o TCC.
- Produza o checklist mesmo sem anexo (D8) — caso típico de invocação parcial.
- Reutilize o número da issue; não crie issue duplicada.
- Mantenha o nível de exigência da `_shared/rubrica-rigor-textual.md` na verificação de consistência entre capítulos.


> Tabela rica transversal: ver _shared/contrato-e-decisoes.md § Saída padrão de feedback.