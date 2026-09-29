---
name: tcc-30-frequencia
description: Registra uma sessão de orientação (data, horário, duração, assunto tratado) no acompanhamento do aluno, cumprindo a exigência do Regimento de TCC de contato semanal documentado (Anexo VII — Frequência Discente às Orientações). É chamada pela tcc-20-orientar no passo 20.6 e também quando o orientador relatar diretamente que teve uma reunião com um aluno.
---

# tcc-30-frequencia

Leia `contrato/contrato-de-acesso.md`. Frequência não é pedido ao aluno, é registro de encontro —
fica no Histórico, não na tabela de pendências.

## Fluxo de trabalho
1. Resolva o `slug` do aluno.
2. Colete: data, horário de início, duração (ou horário de término) e assunto tratado.
3. Registre em `registro/acompanhamento/<slug>.md`, seção 2 (Histórico), no formato
   `Data | Etapa/Tópico | Decisões | Próximos passos`, com a duração no Tópico
   (ex.: `03 Objetivos · 45 min`).
4. Se o orientador pedir o total de horas (para o Anexo VII), some as durações registradas e
   informe o total.

## Regras
- Não invente duração: se o orientador não informou, pergunte ou deixe em branco.
- Mantenha os dados fiéis ao que o orientador relatou, sem arredondar horas para cima.
