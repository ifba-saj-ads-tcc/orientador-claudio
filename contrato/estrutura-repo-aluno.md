# Estrutura do repositório do aluno

Cada orientando tem **um repositório GitHub** com o texto do TCC. Esse repositório entra aqui como
submódulo git, somente leitura, em `alunos/<slug>/`. Onde o texto fica dentro dele depende do que
o repositório contém:

| Repositório do aluno | Onde fica o TCC | `tcc_dir` em `registro/orientandos.yaml` |
|---|---|---|
| Código do projeto **e** TCC | pasta `docs/` | `docs` |
| **Só** o TCC | raiz do repositório | `.` |

Como decidir: se o repositório tem código do projeto (ou vai ter), o TCC vai para `docs/`; se o
repositório existe só para o texto, o TCC fica na raiz.

## Layout 1 — código do projeto + TCC

```
<repo-do-aluno>/
  README.md                 # visão geral do projeto: o que é, como rodar
  src/                      # código do projeto (nome livre: src/, app/, backend/, frontend/...)
  tests/                    # testes automatizados, quando houver
  docs/                     # texto do TCC em Typst (conteúdo do template do curso)
    main.typ                # documento principal
    capitulos/              # um arquivo por capítulo
    referencias.bib         # referências bibliográficas
    assets/                 # figuras, diagramas, códigos citados no texto
    ...                     # demais arquivos do template (ex.: ifbasaj-tcc/)
  .github/workflows/pdf.yml # do template, com TCC_DIR: docs
```

- O código do projeto fica **fora** de `docs/`. A organização interna é livre, mas deve estar
  descrita no `README.md` do aluno.
- Outra documentação do projeto (arquitetura, manual) pode ficar em `docs/`, em subpastas
  próprias que não se misturem com os arquivos do template.

## Layout 2 — só o TCC

```
<repo-do-aluno>/
  main.typ                  # documento principal, na raiz
  capitulos/
  referencias.bib
  assets/
  ...                       # demais arquivos do template
  .github/workflows/pdf.yml # do template, sem mudança (TCC_DIR: .)
```

É o próprio template do curso usado como repositório.

## Regras
- Skills que leem o texto (`tcc-50-revisar`, `tcc-20-orientar`) procuram o `main.typ` em
  `alunos/<slug>/<tcc_dir>/`.
- O valor de `tcc_dir` é `docs` (layout 1) ou `.` (layout 2). O `scripts/adicionar-orientando.sh`
  detecta o valor ao cadastrar o aluno.
- Se o aluno passar de um layout para o outro (por exemplo, começa só com o TCC e depois junta o
  código do projeto no mesmo repositório), o texto muda para `docs/` e o `tcc_dir` é atualizado.

## Como as skills usam cada parte

| Parte do repo do aluno | Uso pelas skills |
|---|---|
| Texto do TCC (`docs/` ou raiz) | Revisão ABNT e de conteúdo por etapa (`tcc-50-revisar`, `tcc-20-orientar`) |
| Código (`src/` etc., só no layout 1) | Evidência na etapa 06: conferir se o que o texto afirma está implementado (`tcc-20-orientar`, `tcc-50-revisar`, regra DES-07) |
| `README.md` e demais documentos | Contexto do projeto: como rodar, arquitetura |

Tudo é **somente leitura** (ver `contrato/contrato-de-acesso.md`). Um problema encontrado no
código ou no texto vira pendência no acompanhamento. Na coluna Localização, use o caminho
relativo à raiz do repo do aluno, por exemplo `docs/main.typ:120` (layout 1), `main.typ:120`
(layout 2) ou `src/api/auth.py:42`.

## Repositório fora do padrão

Se `alunos/<slug>/<tcc_dir>/main.typ` não existir, a skill não bloqueia o trabalho:
1. Procura um `main.typ` em outro lugar do repositório e usa esse caminho nesta rodada.
2. Registra uma pendência `formato` / `prio-media` pedindo ao aluno que mova o texto para
   `docs/` (se o repositório tem código do projeto) ou para a raiz (se é só o TCC).
3. Sugere ao orientador ajustar `tcc_dir` em `registro/orientandos.yaml` até a mudança acontecer.
