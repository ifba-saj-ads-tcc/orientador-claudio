---
name: tcc-07-apresentacao
description: Prepara a defesa do TCC, propondo a estrutura dos slides, roteiro e distribuição de tempo, e simulando perguntas de banca para o orientador treinar o aluno. Rastreia itens e pendências da preparação como issues no repositório do TCC e mantém o espelho no anexo. Use para preparar a apresentação e a arguição de defesa.
---

# tcc-07-apresentacao — Preparação da defesa

Assistente do **orientador** na preparação da apresentação e da arguição de defesa do TCC.

## Contrato (obrigatório)

- Leia `_shared/contrato-e-decisoes.md` antes de agir.
- **Texto do TCC: somente leitura** (\lunos/<id>/ em multi-aluno). **Anexo: única área gravável** (\companhamento/<id>.md em multi-aluno; \nexo-acompanhamento.md em legado).
- **Anexo é fonte do conteúdo; GitHub é projeção do estado (tcc-00 é gate)** das pendências** (número da issue = código de rastreabilidade). O Anexo mantém **Pendências rastreáveis** com tabela rica.
- **Auto-contenção (D8):** funcione isolada. Produza a preparação sempre; crie o anexo apenas se houver próximos passos a persistir.
- **Descoberta (D9):** localize o trabalho por glob `**/*.md` e `**/*.typ` (excluindo anexo e `.opencode/`). Se não houver, prepare a partir do que o orientador informar.

## Fluxo de trabalho

### 1. Coletar o trabalho
- Localize o trabalho por glob (ou use o que o orientador informar).
- Pergunte o **tempo disponível** da apresentação, se não for conhecido.

### 2. Propor estrutura e roteiro
- Proponha a **estrutura dos slides** espelhando o trabalho (problema, objetivos, metodologia, resultados, considerações).
- Sugira **roteiro da fala** e **distribuição de tempo** conforme o tempo disponível.
- Sugira **recursos visuais** (tabelas, figuras, gráficos) a destacar.

### 3. Simular banca
- Gere **perguntas prováveis** da banca (pontos fracos, delimitações, contribuição, metodologia).
- Para cada pergunta, sugira **como orientar o aluno a responder**.

### 4. Produzir a saída
- **Estrutura da apresentação** (slides + roteiro + tempo).
- **Tabela de simulação de banca** (pergunta provável / sugestão de resposta / o que o aluno deve revisar).
- **Pontos para a reunião de preparação.**

### 5. Rastrear itens como issues
- Para cada item ou pendência da preparação, **registre pendência no Anexo com Estado: pendente (tcc-00 cria a issue depois) <repo-do-aluno>** ou **reutilize a existente** pelo número e **aplique labels** conforme `_shared/contrato-e-decisoes.md`.

### 6. Registrar (se houver próximos passos)
Se houver próximos passos ou pendências, atualize as issues correspondentes, **atualize Pendências rastreáveis** na seção **3** do Anexo e registre na seção **2. Histórico**.

## Regras
- Não edite o TCC.
- Baseie a simulação no conteúdo do trabalho; não invente perguntas sem relação com o texto.
- Produza a preparação mesmo sem anexo (D8).
- Reutilize o número da issue; não crie issue duplicada.

> Tabela rica transversal: ver _shared/contrato-e-decisoes.md § Saída padrão de feedback.