#!/usr/bin/env bash
# Adiciona um novo orientando: cria o submódulo, a entrada em orientandos.yaml
# e o acompanhamento a partir do modelo.
#
# Uso: adicionar-orientando.sh <slug> <owner/repo> "<Nome>" [branch] [tcc_dir] <matricula>
#   A matrícula é obrigatória (string). Para não forçar o tcc_dir, passe "" no 5º argumento.
set -euo pipefail

SLUG="$1"          # ex.: joao-silva
REPO="$2"          # ex.: seuusuario/tcc-joao-silva
ALUNO="$3"         # ex.: "João Silva"
BRANCH="${4:-main}"
TCC_DIR="${5:-}"   # opcional: docs (código + TCC) ou . (só o TCC); detectado se omitido
MATRICULA="${6:-}" # obrigatória: matrícula do aluno (string, preserva zeros à esquerda); nunca invente

if [ -z "$MATRICULA" ]; then
  echo "Erro: a matrícula do aluno é obrigatória no cadastro." >&2
  echo "Uso: $0 <slug> <owner/repo> \"<Nome>\" [branch] [tcc_dir] <matricula>" >&2
  echo "     Para não forçar o tcc_dir, passe \"\" no 5º argumento." >&2
  echo "     Pergunte a matrícula ao aluno: nunca invente nem deduza." >&2
  exit 1
fi

git submodule add -b "$BRANCH" "https://github.com/${REPO}.git" "alunos/${SLUG}"

# Onde está o TCC (ver contrato/estrutura-repo-aluno.md):
#   repositório com código do projeto + TCC -> docs/   (tcc_dir: docs)
#   repositório só com o TCC                -> raiz    (tcc_dir: .)
if [ -z "$TCC_DIR" ]; then
  if [ -f "alunos/${SLUG}/docs/main.typ" ]; then
    TCC_DIR="docs"
  elif [ -f "alunos/${SLUG}/main.typ" ]; then
    TCC_DIR="."
  else
    TCC_DIR="docs"
    echo "Aviso: main.typ não encontrado nem em docs/ nem na raiz de alunos/${SLUG}." >&2
    echo "       Registrado tcc_dir: docs; ajuste em registro/orientandos.yaml se o repositório for só do TCC (tcc_dir: .)." >&2
  fi
elif [ ! -f "alunos/${SLUG}/${TCC_DIR}/main.typ" ]; then
  echo "Aviso: alunos/${SLUG}/${TCC_DIR}/main.typ não encontrado." >&2
fi

MATRICULA_LINHA="  matricula: \"${MATRICULA}\""

cat >> registro/orientandos.yaml << EOY

- slug: ${SLUG}
  aluno: ${ALUNO}
${MATRICULA_LINHA}
  repo: ${REPO}
  branch: ${BRANCH}
  tcc_dir: ${TCC_DIR}
  etapa_atual: 00-concepcao
  status: em andamento
  ultima_atualizacao: $(date +%F)
EOY

sed "s/<NOME DO ALUNO>/${ALUNO}/" registro/acompanhamento/_modelo.md > "registro/acompanhamento/${SLUG}.md"

echo "Orientando ${ALUNO} (${SLUG}) adicionado."
