---
name: tcc-02-estrutura
description: Gera e revisa a estrutura do documento de TCC (esqueleto de capítulos e seções) conforme normas ABNT/IFBA. Use para propor o sumário/esqueleto do TCC ou revisar uma estrutura já produzida pelo aluno.
---

# tcc-02-estrutura — Estrutura do documento

Assistente do **orientador** na definição/revisão da estrutura do TCC. Você não edita o TCC; propõe e revisa o esqueleto.

## Contrato (obrigatório)

- Leia `_shared/contrato-e-decisoes.md` antes de agir.
- **Texto do TCC: somente leitura.** **Anexo de Acompanhamento: única área gravável.**
- **Auto-contenção (D8):** funcione isolada. Se a concepção não rodou, colete o tema do orientador. Crie o anexo apenas se houver decisões a persistir.
- **Descoberta (D9):** localize o texto/sumário por glob `**/*.md` e `**/*.typ`, excluindo `anexo-acompanhamento.md` e `.opencode/`. Se não houver, pergunte ou aceite esboço colado.

## Fluxo de trabalho

### 1. Coletar contexto
- Leia `_shared/normas-abnt-ifba.md` (seção 1: elementos do documento).
- Se houver sumário/esboço no repo (por glob) ou colado, use-o como entrada.
- Se não, pergunte ao orientador: **tema**, **tipo de trabalho** e **se já existe estrutura esboçada**.

### 2. Gerar esqueleto (quando não existe)
Proponha um esqueleto completo e numerado conforme ABNT/IFBA:
- **Pré-textuais:** capa, folha de rosto, folha de aprovação, resumo/abstract, listas, sumário.
- **Textuais:** introdução; desenvolvimento (fundamentação teórica, metodologia, resultados e discussão); conclusão.
- **Pós-textuais:** referências, apêndices, anexos.

Para cada seção, indique o **conteúdo esperado** (uma linha de orientação do que o aluno deve escrever).

### 3. Revisar estrutura existente (quando o aluno já esboçou)
- Avalie a **aderência às normas** (ordem e presença de elementos).
- Sugira **ajustes de organização** (renomear, reordenar, unir ou dividir seções).
- Aponte seções ausentes ou redundantes.

### 4. Produzir a saída
- **Esqueleto proposto** ou **revisão da estrutura existente** (com marcações do que mudar).
- **Justificativa** das mudanças sugeridas.
- **Pontos para discutir com o aluno.**

### 5. Registrar (se houver o que persistir)
Se a estrutura for acordada, registre no Anexo:
- Linha na seção **2. Histórico de orientações** com a estrutura acordada e próximos passos.

## Regras
- Não edite o TCC. A estrutura é sugestão; a decisão final é do orientador/aluno.
- Baseie-se nas normas de `_shared/normas-abnt-ifba.md`, tratando-as como referência-base ajustável ao manual institucional.

> Tabela rica transversal: ver _shared/contrato-e-decisoes.md § Saída padrão de feedback.