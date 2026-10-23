# tcc-orientacao-skills

Conjunto de skills para apoiar a orientação de TCCs do curso de ADS (IFBA-SAJ), acompanhando
vários orientandos simultaneamente. Segue o Regimento de TCC do curso e as normas ABNT
(NBR 14724, 6028, 10520, 6023, 6024, 6027).

## Como funciona, em uma frase
O repositório de cada aluno (texto Typst do TCC em `docs/`, quando o repositório também tem o
código do projeto, ou na raiz, quando é só o TCC) entra como **submódulo git somente leitura** em
`alunos/<slug>/`;
tudo que o orientador registra fica em `registro/acompanhamento/<slug>.md`; e só a skill
`tcc-60-sincronizar` conversa com o GitHub do aluno para abrir/fechar issues — evitando
duplicidade e permitindo trabalhar offline.

## Fluxo de uso

O aluno é aceito (`tcc-10-cadastrar`) e passa por um ciclo que se repete em cada etapa, de
00 Concepção a 08 Considerações finais, até a 09 Defesa. Toda sessão é conduzida pela
`tcc-20-orientar` em 7 passos, e a `tcc-50-revisar` revisa em todas elas. Mudar de etapa é
sempre decisão do orientador.

Diagramas e tabelas completas:
- [`docs/fluxo-de-uso.md`](docs/fluxo-de-uso.md) — versão Markdown, com diagramas Mermaid
- [`docs/fluxo-de-uso.html`](docs/fluxo-de-uso.html) — versão HTML, com os diagramas desenhados
  (abra o arquivo no navegador)
- [`docs/base-de-conhecimento.md`](docs/base-de-conhecimento.md) — tudo num arquivo só, para usar
  como conhecimento de um Projeto no claude.ai
- [`docs/instrucoes-projeto.md`](docs/instrucoes-projeto.md) — texto para o campo Instruções do
  projeto, usado junto com a base de conhecimento

| Skill | Papel |
|---|---|
| `tcc-10-cadastrar` | Aceitar o orientando e encerrar a orientação |
| `tcc-20-orientar` | Toda sessão de orientação: passos 20.1 a 20.7 |
| `tcc-30-frequencia` | Registrar cada encontro (Anexo VII) |
| `tcc-40-solicitar` | Pedido avulso do orientador ao aluno |
| `tcc-50-revisar` | Revisão de estrutura, conteúdo por seção e ABNT, em toda sessão |
| `tcc-60-sincronizar` | Única ponte com as issues do GitHub do aluno |
| `tcc-70-relatorio` | Situação de todos os orientandos |
| `tcc-80-formularios` | Formulários oficiais do Regimento |

## Estrutura

```
contrato/contrato-de-acesso.md     # regras de escrita, máquina de estados, labels — leitura obrigatória
contrato/estrutura-repo-aluno.md   # layout do repo do aluno: TCC em docs/ (com código) ou na raiz
normas/conteudo-por-secao.md       # estrutura recomendada e regras DEVE / NÃO DEVE de cada seção
normas/normas-abnt-detalhado.md    # checklist das NBR
etapas/                            # roteiros das etapas 00 Concepção a 09 Defesa
docs/fluxo-de-uso.md|.html         # fluxo de uso das skills, com diagramas
registro/
  orientandos.yaml                 # fonte única de verdade: quem, repo, etapa atual
  acompanhamento/<slug>.md         # histórico, pendências rastreáveis e leituras, por aluno
anexos/                            # formulários oficiais do Regimento (a preencher)
alunos/<slug>/                     # submódulo: repo do aluno (somente leitura)
  docs/                            # texto do TCC (Typst), se o repo também tem código
  src/ ...                         # código do projeto
  (ou main.typ na raiz)            # se o repo é só do TCC
skills/
  tcc-10-cadastrar/                # aceitar e encerrar orientandos
  tcc-20-orientar/                 # sessão de orientação em 7 passos, qualquer etapa
  tcc-30-frequencia/               # log de horas de orientação (Anexo VII do Regimento)
  tcc-40-solicitar/                # registra pedido avulso do orientador ao aluno
  tcc-50-revisar/                  # estrutura + conteúdo por seção + ABNT
  tcc-60-sincronizar/              # única skill que fala com o GitHub (gate)
  tcc-70-relatorio/                # visão consolidada de todos os orientandos
  tcc-80-formularios/              # formulários oficiais
scripts/
  adicionar-orientando.sh          # cria submódulo + entrada no registro + acompanhamento (aceita tcc_dir)
  atualizar-orientandos.sh         # git submodule update --remote em todos os alunos
```

## Pendente de validação
- `normas/normas-abnt-detalhado.md`: baseado em pesquisa das normas oficiais, mas ainda não
  comparado ao template Typst real do curso — confirmar antes de usar em produção.
- `anexos/`: ainda não preenchidos com os modelos oficiais do Regimento (Carta de Aceite, Ata de
  Defesa, Ficha de Avaliação, etc.).
- `normas/regimento-tcc-ads-ifba-saj.md`: extrair o texto do regimento oficial para este arquivo
  (hoje referenciado só na conversa de design, não persistido no repositório).

## Orientandos migrados do repositório antigo
`leandro-da-silva-santos` e `pedro-hipolito` vieram da estrutura anterior deste repositório
(`acompanhamento/` e `.opencode/`). O histórico foi preservado em `registro/acompanhamento/`.
Os dois repositórios têm o texto do TCC na raiz, por isso estão com `tcc_dir: .` em
`registro/orientandos.yaml`, o valor certo para repositório só do TCC. Se algum deles juntar o
código do projeto no mesmo repositório, o texto vai para `docs/` e o valor passa a `tcc_dir: docs`.

## Créditos de design
A ideia de submódulos por aluno, o padrão "acompanhamento é fonte do conteúdo / GitHub é
projeção do estado" com uma única skill-gate, a máquina de estados de pendência e a taxonomia de
labels foram inspiradas no projeto `orientador-claudio`, reconstruídas aqui com nomes e
organização próprios.
