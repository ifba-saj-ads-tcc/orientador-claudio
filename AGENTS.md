# AGENTS.md — tcc-orientacao-skills

- Antes de qualquer ação, leia `contrato/contrato-de-acesso.md` e
  `contrato/estrutura-repo-aluno.md`. As skills ficam em `skills/<nome>/SKILL.md`.
- `alunos/<slug>/` são submódulos com o repositório de cada aluno (TCC em `docs/` junto do código
  do projeto, ou na raiz quando o repositório é só do TCC). São
  **somente leitura**.

## Pasta `.temp/` — arquivos temporários

- Todo arquivo temporário criado pelo agente (scripts de apoio, dumps, logs, saídas
  intermediárias, rascunhos) DEVE ir para `.temp/` na raiz do projeto, nunca em `registro/`,
  `alunos/` ou `skills/`.
- `.temp/` é ignorada pelo git (apenas `.gitkeep` é versionado). Não commite o conteúdo dela.
- Remova os arquivos de `.temp/` quando não forem mais necessários.
