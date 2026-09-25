#!/usr/bin/env bash
# Adiciona um novo orientando: cria o submódulo, a entrada em orientandos.yaml
# e o acompanhamento a partir do modelo.
set -euo pipefail

SLUG="$1"          # ex.: joao-silva
REPO="$2"          # ex.: seuusuario/tcc-joao-silva
ALUNO="$3"         # ex.: "João Silva"
BRANCH="${4:-main}"

git submodule add -b "$BRANCH" "https://github.com/${REPO}.git" "alunos/${SLUG}"

cat >> registro/orientandos.yaml << EOY

- slug: ${SLUG}
  aluno: ${ALUNO}
  repo: ${REPO}
  branch: ${BRANCH}
  etapa_atual: 00-pre-projeto-concepcao
  status: em andamento
  ultima_atualizacao: $(date +%F)
EOY

sed "s/<NOME DO ALUNO>/${ALUNO}/" registro/acompanhamento/_modelo.md > "registro/acompanhamento/${SLUG}.md"

echo "Orientando ${ALUNO} (${SLUG}) adicionado."
