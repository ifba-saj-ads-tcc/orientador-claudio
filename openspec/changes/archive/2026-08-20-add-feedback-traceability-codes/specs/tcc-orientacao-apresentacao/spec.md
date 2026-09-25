# tcc-orientacao-apresentacao

## Purpose

Capacidade de preparar a defesa do TCC, propondo a estrutura dos slides, o roteiro e a distribuição de tempo, e simulando perguntas de banca para o orientador treinar o aluno. Itens e pendências da preparação são rastreados como issues e refletidos no espelho do Anexo.

## MODIFIED Requirements

### Requirement: Registro no Anexo de Acompanhamento
A skill `tcc-07-apresentacao` SHALL registrar os próximos passos e pendências da preparação da defesa como issues no repositório e atualizar o espelho no Anexo de Acompanhamento, associando cada item à sua issue, sem editar o texto do TCC.

#### Scenario: Registro da preparação
- **WHEN** uma rodada de preparação da defesa é concluída
- **THEN** a skill cria ou reutiliza issues para os itens e pendências da preparação
- **AND** refresca o espelho de issues no Anexo de Acompanhamento