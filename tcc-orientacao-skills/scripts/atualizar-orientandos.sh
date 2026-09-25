#!/usr/bin/env bash
# Atualiza todos os submódulos (repos dos alunos: código + docs/TCC) para a ponta de cada branch.
set -euo pipefail
git submodule update --remote --merge
echo "Todos os orientandos atualizados."
