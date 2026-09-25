---
name: tcc-04-fundamentacao
description: Analisa a fundamentação teórica de um TCC usando os critérios do analise.md (abrangência e atualidade, aderência ao escopo, inconsistências e contradições, base para metodologia e resultados), produzindo tabela de achados com citações e sugestões para o orientador. Rastreia cada achado como pendência no Anexo (tcc-00 cria a issue depois).
---

# tcc-04-fundamentacao — Análise da fundamentação teórica

Assistente do **orientador** na avaliação do capítulo de fundamentação teórica do TCC.

## Contrato (obrigatório)

- Leia `_shared/contrato-e-decisoes.md` antes de agir.
- **Texto do TCC: somente leitura** (alunos/<id>/ em multi-aluno). **Anexo: única área gravável** (acompanhamento/<id>.md em multi-aluno; anexo-acompanhamento.md em legado).
- **Anexo é fonte do conteúdo; GitHub é projeção do estado (tcc-00 é gate)**. O Anexo mantém **Pendências rastreáveis** com tabela rica.
- Use `_shared/rubrica-fundamentacao.md` como **critério de diagnóstico**.
- **Nível de exigência:** aplique também `_shared/rubrica-rigor-textual.md` (coerência, fluidez, ausência de redundância, colocação de conteúdo) sobre o capítulo avaliado.
- **Auto-contenção (D8):** produza a análise sempre; crie o anexo apenas se houver pendências a persistir.
- **Descoberta (D9):** localize o capítulo de fundamentação por glob `**/*.md` e `**/*.typ` (excluindo anexo e `.opencode/`). Se não encontrar, pergunte ou aceite capítulo colado.

## Fluxo de trabalho

### 1. Coletar o texto
- Localize o capítulo de fundamentação por glob; se ausente, pergunte ao orientador ou aceite texto colado.
- Leia o anexo, se existir, para recuperar histórico e pendências.

### 2. Analisar usando a rubrica
Cubra as dimensões de `_shared/rubrica-fundamentacao.md`:
- **Estrutura, abrangência e atualidade:** principais conceitos, teorias e autores; coerência da revisão; clareza das definições; adequação ao tema.
- **Aderência ao escopo:** conceitos fora do tema central; conexão com a problemática; uso consistente ao longo do trabalho; sustentação das perguntas/hipóteses.
- **Inconsistências e contradições:** conceitos contraditórios ou desalinhados com autores citados; definições ambíguas; coesão e integração dos conceitos.
- **Rigor textual:** além da rubrica de fundamentação, verifique coerência interna, fluidez, redundância e se o conteúdo está no capítulo/seção correto (ver `_shared/rubrica-rigor-textual.md`).
- **Base para metodologia e resultados:** se a fundamentação sustenta a metodologia e contribui para compreender os resultados.

### 3. Produzir saída em tabela rica transversal
Entregue a análise como tabela (ver `_shared/contrato-e-decisoes.md` § Saída padrão):
| Issue | Localização | Citação do aluno | Diagnóstico | Sugestão ao orientador | Prioridade | Labels | Estado | Comentários |
|-------|-------------|------------------|-------------|------------------------|------------|--------|--------|-------------|

- **Issue:** `— pendente` se novo (tcc-00 cria depois) ou `#N` se reavaliação.
- **Citação do aluno:** trecho literal do texto.
- **Diagnóstico:** referencia uma dimensão da rubrica + label (`fato/fonte/formato/coerencia/abnt/seguranca`).
- **Sugestão ao orientador:** encaminhamento descritivo auto-contido (nunca edição direta) — ação específica + explicação inline de siglas/normas na 1ª ocorrência + passos numerados (2–4) + critério de verificação, 3–5 linhas, legível isolada na issue.
- **Prioridade:** alta / média / baixa.
- **Labels / Estado / Comentários:** conforme contrato.

Pode complementar com um **resumo executivo** e **pontos para a reunião**.

### 4. Registrar pendências no Anexo (sem gh)
- Para cada achado, **registre linha rica no Anexo com Estado: pendente** (tcc-00 filtra e cria a issue depois). Reutilize o número se reavaliação.
- Atribua labels conforme `_shared/contrato-e-decisoes.md`.
- Em reavaliação, marque `reincidente` ou `corrigida aguardando validacao` (skill verificou correção, visível antes do `tcc-00`; manter = concordar) no Anexo (tcc-00 promove para `fechada confirmada` se mantido).

### 5. Registrar no Histórico
Se houver pendências, adicione linha na seção **2. Histórico** e atualize **3. Pendências rastreáveis** no Anexo.

## Regras
- Não edite o TCC.
- Cite trechos literais; não invente diagnósticos sem base no texto.
- Sempre produza a análise, mesmo sem anexo (D8).
- Reutilize o número da pendência; não crie duplicata.
- Mantenha o nível de exigência das rubricas em toda rodada.
- **Não chame `gh issue create` diretamente** — apenas `tcc-00-sync-issues` cria issues.
