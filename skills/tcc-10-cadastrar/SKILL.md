---
name: tcc-10-cadastrar
description: Cadastro de orientandos em registro/orientandos.yaml — aceitar um novo aluno (submódulo do repositório, entrada no registro, acompanhamento criado a partir do modelo) e encerrar uma orientação (aprovado, reprovado, desistência). Também responde consultas como "quem eu estou orientando" ou "em que etapa está o fulano". Mudar de etapa não é com esta skill — é o passo 20.7 da tcc-20-orientar.
---

# tcc-10-cadastrar

Leia `contrato/contrato-de-acesso.md` antes de agir. Esta skill cria e encerra entradas em
`registro/orientandos.yaml`. O único campo que outra skill altera é `etapa_atual` (e
`ultima_atualizacao`), pela `tcc-20-orientar`, depois da confirmação do orientador.

## Quando usar

**Aceitar um orientando**
1. Rode `scripts/adicionar-orientando.sh <slug> <owner/repo> "<Nome>" [branch] [tcc_dir]`.
   O repositório do aluno deve seguir `contrato/estrutura-repo-aluno.md` (código + `docs/TCC/`);
   `tcc_dir` só é informado se o texto ainda não estiver em `docs/TCC`.
2. Confirme que a entrada nasceu com `etapa_atual: 00-concepcao` e que
   `registro/acompanhamento/<slug>.md` foi criado a partir do modelo.
3. Ofereça gerar a Carta de Aceite com a `tcc-80-formularios`.
4. Indique o próximo passo: a primeira sessão da `tcc-20-orientar`, na etapa 00.

**Consultar** ("quem estou orientando", "em que etapa está o João") — leia o YAML e responda
direto, sem pedir confirmação.

**Encerrar** (aprovado, reprovado, desistência) — mude `status` e `ultima_atualizacao`. Nunca
apague a entrada: o histórico importa para relatórios. Em caso de desistência, ofereça o Termo
de Desistência com a `tcc-80-formularios`.

## Regras
- `slug` é a chave estável usada por todas as skills (pasta do submódulo e nome do
  acompanhamento). Não reutilize um slug já usado, mesmo de aluno encerrado.
- Nunca edite `alunos/<slug>/` — atualização é sempre via `scripts/atualizar-orientandos.sh`.
- Não altere `etapa_atual` de aluno em andamento; isso é o passo 20.7 da `tcc-20-orientar`.
