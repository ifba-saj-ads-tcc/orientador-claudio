---
name: tcc-10-cadastrar
description: Cadastro de orientandos em registro/orientandos.yaml — aceitar um novo aluno (submódulo do repositório, entrada no registro com matrícula, acompanhamento criado a partir do modelo), corrigir dados cadastrais como a matrícula e encerrar uma orientação (aprovado, reprovado, desistência). Também responde consultas como "quem eu estou orientando" ou "em que etapa está o fulano". Mudar de etapa não é com esta skill — é o passo 20.7 da tcc-20-orientar.
---

# tcc-10-cadastrar

Leia `contrato/contrato-de-acesso.md` antes de agir. Esta skill cria e encerra entradas em
`registro/orientandos.yaml`. Os campos que outra skill altera são `etapa_atual` e
`ultima_atualizacao`, pela `tcc-20-orientar`, depois da confirmação do orientador. A `matricula`
é dado cadastral do aluno: quem registra e corrige é esta skill.

## Quando usar

**Aceitar um orientando**
1. Peça os dados do aluno: `slug`, repositório `owner/repo`, nome completo e **matrícula**. A
   matrícula é **obrigatória** e é string (preserva zeros à esquerda): sem ela, não cadastre —
   pergunte ao aluno. **Nunca invente nem deduza a matrícula**, e não a substitua por matrícula
   de outro aluno, número de protocolo ou valor do repositório.
2. Rode
   `scripts/adicionar-orientando.sh <slug> <owner/repo> "<Nome>" [branch] [tcc_dir] <matricula>`.
   O script **recusa o cadastro** (sai com erro, sem criar submódulo) quando a matrícula está
   ausente. O repositório do aluno deve seguir `contrato/estrutura-repo-aluno.md`: com código do
   projeto, o TCC fica em `docs/`; só com o TCC, fica na raiz. O script detecta o `tcc_dir`
   (`docs` ou `.`); informe o 5º argumento só para forçar o valor. Para informar a matrícula sem
   forçar o `tcc_dir`, passe `""` no 5º argumento.
3. Confirme que a entrada nasceu com `etapa_atual: 00-concepcao`, `matricula` preenchida e que
   `registro/acompanhamento/<slug>.md` foi criado a partir do modelo.
4. Ofereça gerar a Carta de Aceite com a `tcc-80-formularios`.
5. Indique o próximo passo: a primeira sessão da `tcc-20-orientar`, na etapa 00.

**Corrigir dados cadastrais** ("a matrícula do João é 2026123456", "o repo mudou para X") — grave
o valor no campo correspondente e atualize `ultima_atualizacao`. Nunca altere `etapa_atual` por
aqui.

**Consultar** ("quem estou orientando", "em que etapa está o João", "qual a matrícula do Pedro")
— leia o YAML e responda direto, sem pedir confirmação.

**Encerrar** (aprovado, reprovado, desistência) — mude `status` e `ultima_atualizacao`. Nunca
apague a entrada: o histórico importa para relatórios. Em caso de desistência, ofereça o Termo
de Desistência com a `tcc-80-formularios`.

## Formato da entrada

```yaml
- slug: joao-silva
  aluno: João Silva
  matricula: "2026123456"        # string: preserva zeros à esquerda
  repo: usuario/tcc-joao-silva
  branch: main
  tcc_dir: docs                  # docs (código + TCC) ou . (só o TCC, na raiz)
  etapa_atual: 00-concepcao
  status: em andamento
  ultima_atualizacao: 2026-11-05
```

## Regras
- `slug` é a chave estável usada por todas as skills (pasta do submódulo e nome do
  acompanhamento). Não reutilize um slug já usado, mesmo de aluno encerrado.
- A matrícula é obrigatória no cadastro e fica sempre entre aspas no YAML, porque é
  identificador e pode começar com zero. Sem matrícula informada, **não cadastre**.
- Nunca invente matrícula, SIAPE, datas de colegiado ou prazos: pergunte ao orientador.
- Nunca edite `alunos/<slug>/` — atualização é sempre via `scripts/atualizar-orientandos.sh`.
- Não altere `etapa_atual` de aluno em andamento; isso é o passo 20.7 da `tcc-20-orientar`.
