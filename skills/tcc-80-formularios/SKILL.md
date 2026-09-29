---
name: tcc-80-formularios
description: Ajuda o orientador a preencher os formulários oficiais do Regimento de TCC do ADS/IFBA-SAJ (Carta de Aceite, Termo de Desistência, Termo de Mudança de Orientador, Carta Convite de Banca, Ficha de Avaliação, Ata de Defesa, Frequência do Anexo VII) a partir dos dados de orientandos.yaml e do acompanhamento. Use na entrada do aluno (Carta de Aceite), na defesa (Ata e Ficha) ou sempre que precisar de um desses documentos.
---

# tcc-80-formularios

Leia `contrato/contrato-de-acesso.md`. Esta skill lê `registro/orientandos.yaml` e
`registro/acompanhamento/<slug>.md` para pré-preencher o que já se sabe (nome, repositório,
etapas, horas de orientação) e pergunta ao orientador só o que falta (SIAPE, matrícula, banca).

## Fluxo de trabalho
1. Identifique o formulário necessário (modelos em `anexos/`, quando existirem).
2. Pré-preencha com os dados do registro. Para a frequência do Anexo VII, use o total calculado
   pela `tcc-30-frequencia`.
3. Liste os campos que faltam e pergunte ao orientador.
4. Entregue o documento preenchido em Markdown; ofereça gerar arquivo para impressão/assinatura.

## Regras
- Nunca invente dados institucionais (SIAPE, datas de colegiado, matrícula) — sempre pergunte.
- Skill administrativa: não avalia o TCC, só monta documentos.
