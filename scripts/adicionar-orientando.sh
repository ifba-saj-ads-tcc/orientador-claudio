#!/usr/bin/env bash
# Adiciona um novo orientando: cria o submódulo, a entrada em orientandos.yaml
# e o acompanhamento a partir do modelo.
set -euo pipefail

SLUG="$1"          # ex.: joao-silva
REPO="$2"          # ex.: seuusuario/tcc-joao-silva
ALUNO="$3"         # ex.: "João Silva"
BRANCH="${4:-main}"
TCC_DIR="${5:-docs/TCC}"   # caminho do texto Typst dentro do repo do aluno

git submodule add -b "$BRANCH" "https://github.com/${REPO}.git" "alunos/${SLUG}"

if [ ! -f "alunos/${SLUG}/${TCC_DIR}/main.typ" ]; then
  echo "Aviso: alunos/${SLUG}/${TCC_DIR}/main.typ não encontrado." >&2
  echo "       O texto do TCC deve ficar em docs/TCC/ (ver contrato/estrutura-repo-aluno.md)." >&2
fi

cat >> registro/orientandos.yaml << EOY

- slug: ${SLUG}
  aluno: ${ALUNO}
  repo: ${REPO}
  branch: ${BRANCH}
  tcc_dir: ${TCC_DIR}
  etapa_atual: 00-pre-projeto-concepcao
  status: em andamento
  ultima_atualizacao: $(date +%F)
EOY

sed "s/<NOME DO ALUNO>/${ALUNO}/" registro/acompanhamento/_modelo.md > "registro/acompanhamento/${SLUG}.md"

echo "Orientando ${ALUNO} (${SLUG}) adicionado."
