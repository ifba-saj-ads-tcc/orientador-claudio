# tcc-orientacao-skills

Conjunto de skills para apoiar a orientação de TCCs do curso de ADS (IFBA-SAJ), acompanhando
vários orientandos simultaneamente. Segue o Regimento de TCC do curso e as normas ABNT
(NBR 14724, 6028, 10520, 6023, 6024, 6027).

## Como funciona, em uma frase
O repositório de cada aluno (código do projeto + documentação, com o texto Typst do TCC em
`docs/TCC/`) entra como **submódulo git somente leitura** em `alunos/<slug>/`;
tudo que o orientador registra fica em `registro/acompanhamento/<slug>.md`; e só a skill
`sincronizar-issues` conversa com o GitHub do aluno para abrir/fechar issues — evitando
duplicidade e permitindo trabalhar offline.

## Estrutura

```
contrato/contrato-de-acesso.md     # regras de escrita, máquina de estados, labels — leitura obrigatória
contrato/estrutura-repo-aluno.md   # layout do repo do aluno: código + docs/TCC
normas/                            # NBR detalhadas + (quando disponível) o Regimento oficial
etapas/                            # roteiro de cada fase do TCC (concepção → defesa)
registro/
  orientandos.yaml                 # fonte única de verdade: quem, repo, etapa atual
  acompanhamento/<slug>.md         # histórico + pendências rastreáveis, por aluno
anexos/                            # formulários oficiais do Regimento (a preencher)
alunos/<slug>/                     # submódulo: repo do aluno (somente leitura)
  docs/TCC/                        # texto do TCC (Typst)
  src/ ...                         # código do projeto
skills/
  gerenciar-orientandos/           # cadastro e consulta de orientandos
  orientar-etapa/                  # conduz a sessão de orientação da etapa atual
  registrar-solicitacao/           # registra pedido do orientador ao aluno
  registrar-frequencia/            # log de horas de orientação (Anexo VII do Regimento)
  revisar-typst/                   # checagem ABNT + conteúdo da etapa
  sincronizar-issues/              # única skill que fala com o GitHub (gate)
  relatorio-acompanhamento/        # visão consolidada de todos os orientandos
  apoio-orientador/                # gera os formulários oficiais
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

## Créditos de design
A ideia de submódulos por aluno, o padrão "acompanhamento é fonte do conteúdo / GitHub é
projeção do estado" com uma única skill-gate, a máquina de estados de pendência e a taxonomia de
labels foram inspiradas no projeto `orientador-claudio`, reconstruídas aqui com nomes e
organização próprios.
