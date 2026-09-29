# Estrutura do repositório do aluno

Cada orientando tem **um único repositório GitHub** que reúne o **código do projeto** e a
**documentação**, incluindo o texto do TCC. Esse repositório entra aqui como submódulo git,
somente leitura, em `alunos/<slug>/`.

## Layout esperado

```
<repo-do-aluno>/
  README.md                 # visão geral do projeto: o que é, como rodar
  src/                      # código do projeto (nome livre: src/, app/, backend/, frontend/...)
  tests/                    # testes automatizados, quando houver
  docs/
    TCC/                    # texto do TCC em Typst (template do curso)
      main.typ              # documento principal
      referencias.bib       # referências bibliográficas
      assets/               # figuras, diagramas, códigos citados no texto
      ...                   # demais arquivos do template (ex.: ifbasaj-tcc/)
    ...                     # outra documentação do projeto (arquitetura, requisitos, manual)
```

Regras:
- O texto do TCC fica **sempre** em `docs/TCC/`. Skills que leem o texto (`revisar-typst`,
  `orientar-etapa`) procuram ali o `main.typ`.
- O código do projeto fica **fora** de `docs/`. A organização interna é livre, mas deve estar
  descrita no `README.md` do aluno.
- O caminho do texto é registrado em `registro/orientandos.yaml`, no campo `tcc_dir`
  (padrão: `docs/TCC`). Só mude esse valor quando houver um motivo documentado, por exemplo um
  repositório antigo que ainda não foi migrado.

## Como as skills usam cada parte

| Parte do repo do aluno | Uso pelas skills |
|---|---|
| `docs/TCC/` | Revisão ABNT e de conteúdo por etapa (`revisar-typst`, `orientar-etapa`) |
| Código (`src/` etc.) | Evidência na etapa 06: conferir se o que o texto afirma está implementado (`orientar-etapa`) |
| `README.md` e demais `docs/` | Contexto do projeto: como rodar, arquitetura |

Tudo é **somente leitura** (ver `contrato/contrato-de-acesso.md`). Um problema encontrado no
código ou no texto vira pendência no acompanhamento. Na coluna Localização, use o caminho
relativo à raiz do repo do aluno, por exemplo `docs/TCC/main.typ:120` ou `src/api/auth.py:42`.

## Repositório fora do padrão

Se `docs/TCC/main.typ` não existir, a skill não bloqueia o trabalho:
1. Procura um `main.typ` em outro lugar do repositório e usa esse caminho nesta rodada.
2. Registra uma pendência `formato` / `prio-media` pedindo ao aluno que mova o texto para
   `docs/TCC/`.
3. Sugere ao orientador ajustar `tcc_dir` em `registro/orientandos.yaml` até a migração
   acontecer.
