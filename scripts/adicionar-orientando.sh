#!/usr/bin/env bash
# Adiciona um novo orientando: cria o submódulo, a entrada em orientandos.yaml
# e o acompanhamento a partir do modelo.
set -euo pipefail

SLUG="$1"          # ex.: joao-silva
REPO="$2"          # ex.: seuusuario/tcc-joao-silva
ALUNO="$3"         # ex.: "João Silva"
BRANCH="${4:-main}"
TCC_DIR="${5:-}"   # opcional: docs (código + TCC) ou . (só o TCC); detectado se omitido

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

cat >> registro/orientandos.yaml << EOY

- slug: ${SLUG}
  aluno: ${ALUNO}
  repo: ${REPO}
  branch: ${BRANCH}
  tcc_dir: ${TCC_DIR}
  etapa_atual: 00-concepcao
  status: em andamento
  ultima_atualizacao: $(date +%F)
EOY

sed "s/<NOME DO ALUNO>/${ALUNO}/" registro/acompanhamento/_modelo.md > "registro/acompanhamento/${SLUG}.md"

echo "Orientando ${ALUNO} (${SLUG}) adicionado."
