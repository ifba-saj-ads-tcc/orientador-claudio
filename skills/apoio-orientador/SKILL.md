---
name: apoio-orientador
description: Ajuda o orientador a preencher os formulários oficiais do Regimento de TCC do ADS/IFBA-SAJ (Carta de Aceite, Termo de Desistência, Termo de Mudança de Orientador, Carta Convite de Banca, Ficha de Avaliação, Ata de Defesa) a partir dos dados já registrados em orientandos.yaml e no acompanhamento. Use quando o orientador precisar gerar qualquer um desses documentos administrativos.
---

# apoio-orientador

Leia `contrato/contrato-de-acesso.md`. Esta skill lê `registro/orientandos.yaml` e
`registro/acompanhamento/<slug>.md` para pré-preencher o que já se sabe (nome do aluno, datas de
marcos, etc.) e pergunta ao orientador só o que falta (SIAPE, matrícula, nomes da banca).

## Fluxo de trabalho
1. Identifique qual formulário é necessário (ver `anexos/` para os modelos, quando existirem).
2. Pré-preencha com os dados disponíveis no registro central.
3. Liste claramente os campos que faltam e pergunte ao orientador.
4. Entregue o documento preenchido em Markdown; ofereça gerar como arquivo para impressão/
   assinatura quando o orientador quiser.

## Regras
- Nunca invente dados institucionais (SIAPE, datas de colegiado, matrícula) — sempre pergunte.
- Esta skill é administrativa, não pedagógica: não avalia o TCC, só monta documentos.
