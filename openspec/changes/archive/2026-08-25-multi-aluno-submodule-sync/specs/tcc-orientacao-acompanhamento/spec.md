## MODIFIED Requirements

### Requirement: Descoberta do texto por glob
A skill tcc-05-acompanhamento SHALL localizar os arquivos .md/.typ do TCC por glob escopado em alunos/<id>/ (quando em modo multi-aluno) ou no repo atual (modo legado single-repo), excluindo o Anexo de Acompanhamento e o diretorio .opencode/, e consultar o orientador quando nenhum arquivo for encontrado. A skill SHALL resolver o aluno por parametro aluno=<id>, variavel ALUNO ou prompt interativo.

#### Scenario: Arquivos localizados por glob
- **WHEN** ha arquivos .md/.typ do TCC no repo do aluno <id> (alunos/<id>/)
- **THEN** a skill os localiza por glob escopado e os usa como entrada do feedback

#### Scenario: Nenhum arquivo encontrado
- **WHEN** o glob escopado nao encontra arquivos do TCC
- **THEN** a skill pergunta ao orientador onde estao ou aceita trecho colado como fallback

### Requirement: Atualização do Anexo de Acompanhamento
A skill tcc-05-acompanhamento SHALL atualizar o histórico de orientações e o espelho de issues no Anexo de Acompanhamento do aluno em acompanhamento/<id>.md (multi-aluno) ou ./anexo-acompanhamento.md (legado), a cada rodada de feedback, sem editar o texto do TCC em alunos/<id>/.

#### Scenario: Atualização do histórico após feedback
- **WHEN** uma rodada de feedback e concluída para o aluno <id>
- **THEN** a skill adiciona registro no histórico de orientações em acompanhamento/<id>.md
- **AND** refresca o espelho de issues desse anexo
