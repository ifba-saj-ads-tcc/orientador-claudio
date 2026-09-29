---
name: orientar-etapa
description: Conduz uma sessão de orientação sobre a etapa atual do TCC de um aluno (concepção, problema, objetivos, hipóteses, referencial teórico, metodologia, desenvolvimento, conclusão ou preparação para defesa), usando o roteiro correspondente em etapas/ e as normas ABNT relevantes. Use quando o orientador quiser preparar uma reunião de orientação, revisar o que o aluno entregou nesta etapa, ou decidir se pode avançar para a próxima etapa.
---

# orientar-etapa

Leia `contrato/contrato-de-acesso.md` antes de agir. Texto do aluno é sempre somente leitura;
qualquer pendência identificada é registrada no acompanhamento, nunca escrita diretamente no
TCC nem virada em issue por esta skill (isso é papel exclusivo da `sincronizar-issues`).

## Fluxo de trabalho
1. Resolva o `slug` do aluno (ver contrato). Leia `registro/orientandos.yaml` para saber a
   `etapa_atual` — ou use a etapa informada explicitamente pelo orientador.
2. Leia o arquivo correspondente em `etapas/NN-*.md`: objetivo, perguntas orientadoras,
   checklist de conclusão, erros comuns.
3. Leia o texto do TCC em `alunos/<slug>/<tcc_dir>/` (padrão `docs/TCC/`, ver
   `contrato/estrutura-repo-aluno.md`) e o acompanhamento em
   `registro/acompanhamento/<slug>.md`. Nas etapas 05 e 06, leia também o código do projeto no
   mesmo repositório (fora de `docs/`) para conferir se o que o texto afirma, como tecnologias,
   arquitetura e funcionalidades, de fato está implementado.
4. Avalie o material do aluno contra o checklist da etapa. Para cada item não atendido,
   monte uma linha no formato de "Pendências rastreáveis" (ver `contrato/contrato-de-acesso.md`)
   com Estado `pendente`.
5. Produza para o orientador: (a) um resumo do que já está pronto, (b) as perguntas orientadoras
   mais relevantes para a reunião, (c) a lista de pendências novas.
6. Só grave em `registro/acompanhamento/<slug>.md` se houver algo a persistir (pendência nova,
   decisão tomada, próximos passos) — nunca crie o arquivo vazio.
7. Se o checklist da etapa estiver 100% atendido, sugira ao orientador atualizar `etapa_atual`
   em `registro/orientandos.yaml` (via `gerenciar-orientandos`) para a próxima etapa.
8. **Caso especial — etapa 07 (Conclusão)**: ao concluir esta etapa, chame também a
   `revisar-typst` focada em resumo/abstract (ver seção correspondente em
   `etapas/07-conclusao.md`). Não avance para a etapa 08 sem essa checagem feita — resumo/IMRaD
   com problema descoberto só na revisão final não dá tempo de correção tranquila.

## Regras
- Nunca pule etapas sem o orientador confirmar — a ordem existe porque cada etapa depende da
  anterior (ex.: metodologia só faz sentido depois de objetivos definidos).
- Se o aluno já entregou conteúdo de uma etapa futura, avise mas não bloqueie — registre como
  observação no histórico.
