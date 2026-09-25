---
name: gerenciar-orientandos
description: Cadastra, consulta e atualiza orientandos em registro/orientandos.yaml — a fonte única de verdade sobre quem está sendo orientado. Use quando o orientador quiser adicionar um novo TCC ao acompanhamento, mudar a etapa atual de um aluno, encerrar uma orientação, ou simplesmente perguntar "quem eu estou orientando" / "em que etapa está o fulano".
---

# gerenciar-orientandos

Leia `contrato/contrato-de-acesso.md` antes de agir — só esta skill escreve em
`registro/orientandos.yaml`.

## Quando usar
- Novo orientando: rode `scripts/adicionar-orientando.sh <slug> <owner/repo> "<Nome>" [branch]`.
- Consulta ("quem estou orientando", "que etapa está o João"): leia o YAML e responda direto,
  sem pedir confirmação.
- Mudança de etapa: atualize o campo `etapa_atual` (use os nomes de arquivo em `etapas/`) e
  `ultima_atualizacao`.
- Encerramento (aprovado/reprovado/desistência): mude `status`, nunca apague a entrada — histórico
  importa para relatórios futuros.

## Regras
- `slug` é a chave estável usada por todas as outras skills (nome da pasta do submódulo, nome do
  arquivo de acompanhamento). Não reutilize um slug já usado por outro aluno, mesmo encerrado.
- Nunca edite `alunos/<slug>/` — isso é sempre feito via `scripts/atualizar-orientandos.sh`
  (submódulo git), nunca manualmente.
- Ao adicionar um orientando, confirme que o acompanhamento foi criado a partir do modelo antes
  de encerrar a tarefa.
