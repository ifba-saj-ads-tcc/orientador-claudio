---
name: tcc-05-acompanhamento
description: Produz feedback contínuo sobre o texto do TCC entregue pelo aluno, em tabela de localização/citação/diagnóstico/sugestão/prioridade, rastreando cada item como issue no repositório do TCC e mantendo o espelho de issues no anexo. Aciona a skill de fundamentação quando o capítulo entregue for o de fundamentação teórica. Use como skill de acompanhamento recorrente da escrita.
---

# tcc-05-acompanhamento — Acompanhamento da escrita

Assistente do **orientador** no feedback contínuo do texto do TCC, em loop a cada entrega do aluno.

## Contrato (obrigatório)

- Leia `_shared/contrato-e-decisoes.md` antes de agir.
- **Nível de exigência:** aplique sempre `_shared/rubrica-rigor-textual.md` (coerência, fluidez, ausência de redundância e correta colocação de conteúdo), com o rigor de um TCC de nível superior. Não suavize em reavaliações nem por ser a Nª rodada.
- **Texto do TCC: somente leitura** (\lunos/<id>/ em multi-aluno). **Anexo: única área gravável** (\companhamento/<id>.md em multi-aluno; \nexo-acompanhamento.md em legado).
- **Anexo é fonte do conteúdo; GitHub é projeção do estado (tcc-00 é gate)** das pendências** (número da issue = código de rastreabilidade; estado = ciclo de vida). O Anexo mantém **Pendências rastreáveis** com tabela rica para leitura offline.
- **Auto-contenção (D8):** funcione isolada. Leia o anexo se existir; produza feedback sempre; crie o anexo apenas se houver algo a persistir.
- **Descoberta (D9):** localize o texto por glob `**/*.md` e `**/*.typ` (excluindo anexo e `.opencode/`). Se não houver, pergunte ou aceite trecho colado.

## Fluxo de trabalho

### 1. Coletar o texto e o histórico
- Localize o texto entregue por glob (ou aceite trecho colado).
- Leia o anexo, se existir, para recuperar histórico e o espelho de issues.

### 2. Analisar e produzir feedback em tabela
Aplique as quatro dimensões de `_shared/rubrica-rigor-textual.md` — **coerência** (fatos/lógica/números/objetivo×escopo), **fluidez** (encadeamento, tempo verbal, concisão), **ausência de redundância** (repetição de conteúdo/código/argumentos) e **colocação de conteúdo** (metodologia/resultados/conclusão no lugar certo) — em **todo o texto entregue, capítulo por capítulo**, sempre com base em citação literal.

Entregue a tabela padrão:
| Issue | Localização | Citação do aluno | Diagnóstico | Sugestão ao orientador | Prioridade |
|-------|-------------|------------------|-------------|------------------------|------------|

- **Issue:** número da issue que rastreia o item (ou `—` se novo e ainda não criado).
- **Localização:** capítulo/seção/linha.
- **Citação do aluno:** trecho literal.
- **Diagnóstico:** problema identificado, vinculado a uma dimensão da rubrica e a um label (`fato`, `fonte`, `formato`, `coerencia`, `abnt`, `seguranca`).
- **Sugestão ao orientador:** encaminhamento descritivo auto-contido (nunca edição direta) — ação específica + explicação inline de siglas/normas na 1ª ocorrência + passos numerados (2–4) + critério de verificação, 3–5 linhas, legível isolada na issue.
- **Prioridade:** alta / média / baixa.

Pode incluir resumo executivo e pontos para a reunião.

### 3. Rastrear cada item como issue
- Para cada item da tabela, **registre pendência no Anexo com Estado: pendente (tcc-00 cria a issue depois) <repo-do-aluno>** (novo apontamento) ou **reutilize a issue existente** pelo número (reavaliação).
- **Aplique labels** conforme `_shared/contrato-e-decisoes.md` (domínio, tipo, prioridade, procedural).
- Atualize o **ciclo de vida** (sempre gh --repo <repo-do-aluno> derivado de \lunos.json): feche a issue se a pendência foi resolvida; **reabra e comente a rodada** se reincidiu.

### 4. Encaminhar para a fundamentação
- Se o capítulo entregue for o de **fundamentação teórica**, acione a skill `tcc-04-fundamentacao` para análise especializada (usando a rubrica). Os achados da fundamentação são rastreados pela própria `tcc-04`.

### 5. Reavaliar versões
- Em nova versão de capítulo já avaliado, **reavalie** o texto e **verifique, pelo número da issue, se pendências anteriores foram resolvidas**, atualizando o estado das issues. Se corrigida, marque `corrigida aguardando validacao` (skill verificou, falta validar — visível antes do `tcc-00`); manter esse estado no `tcc-00` = concordância e promove para `fechada confirmada`.
- **Não reduza o rigor por reincidência:** se a pendência persiste, comente a rodada e mantenha a mesma prioridade; se reincidiu, reabra e registre. Todo achado novo nas dimensões da rubrica gera issue.

### 6. Atualizar o Anexo
- Adicione linha na seção **2. Histórico de orientações** (data, tópico, decisões, próximos passos).
- **Refresque o espelho de issues** na seção **3** (consulte as issues e reescreva o espelho, registrando a data da atualização).
- **Não** edite o texto do TCC.

## Regras
- Não edite o TCC.
- Sempre produza feedback, mesmo sem anexo (D8).
- Baseie diagnósticos em citações literais do texto.
- Reutilize o número da issue; não crie issue duplicada para pendência já rastreada.
- **Mantenha o nível de exigência da `_shared/rubrica-rigor-textual.md` em todas as rodadas e capítulos.**


> Tabela rica transversal: ver _shared/contrato-e-decisoes.md § Saída padrão de feedback.