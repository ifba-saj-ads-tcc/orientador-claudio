# AGENTS.md — orientações do projeto orientador-llm

## Pasta `.temp/` — arquivos temporários

- Todo arquivo temporário criado pelo agente (scripts de apoio, dumps,
  logs, saídas intermediárias, CSVs, verificações, rascunhos) DEVE ir para
  `.temp/` na raiz do projeto.
- Nunca crie arquivos temporários na raiz, em `acompanhamento/`,
  `alunos/`, `openspec/` ou `.opencode/`.
- A pasta `.temp/` já existe e é ignorada pelo git (apenas `.gitkeep`
  é versionado). Não commite o conteúdo dela.
- Use caminhos relativos (ex.: `.temp/check_pedro.py`) e crie
  subpastas dentro de `.temp/` se precisar organizar por aluno/tarefa.
- Remova os arquivos de `.temp/` quando não forem mais necessários.
