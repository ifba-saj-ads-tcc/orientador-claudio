## Why

Issues do aluno LEANDRO-DA-SILVA-SANTOS ficaram simplificadas (body de 1 frase, labels vazias) porque `tcc-04` falhou ao criar via `gh` sem auth e o anexo `acompanhamento/<id>.md` não continha dados suficientes para reconstruir a issue rica depois. O anexo antigo de Pedro Victor (2026-08-20, 18 issues com Localização/Citação/Diagnóstico/Sugestão/Labels) mostra o padrão desejado: o anexo deve ser tão detalhado que permite replay idempotente. Além disso, hoje só `tcc-04/05` criam issues; concepção/estrutura/cronograma também geram pendências acionáveis que precisam ser rastreadas.

## What Changes

- **Anexo-first**: todas as skills `tcc-01`–`tcc-07` gravam tabela rica completa (`Localização | Citação | Diagnóstico | Sugestão | Prioridade | Labels | Body replay`) no anexo (`acompanhamento/<id>.md` ou `anexo-acompanhamento.md`) com `Estado: pendente`; nenhuma skill chama `gh` diretamente.
- **Gate tcc-00**: só `tcc-00-sync-issues` cria/atualiza issues no GitHub, filtrando apenas pendências que o aluno deve resolver; faz `ensure-labels` antes do create e atualiza o anexo com `# real` ou `falha: <erro>`.
- **Via dupla**: `tcc-00` sincroniza GitHub → Anexo: issues fechadas/comentadas pelo aluno são refletidas no anexo (coluna `Comentários` mantém thread completa) e no Histórico §2; fechamento detectado exige validação assistida do orientador (reabrir vs confirmar).
- **Tabela rica transversal**: formato de tabela de feedback deixa de ser exclusivo de `tcc-04/05` e vira padrão do contrato `_shared/contrato-e-decisoes.md`, aplicável a qualquer skill.
- Anexo §3 redefinido de "espelho" para "pendências rastreáveis" com estados `pendente | criada #N | falha | fechada confirmada | reaberta`.

## Capabilities

### New Capabilities
- (nenhuma nova isolada; mudança é transversal sobre existentes)

### Modified Capabilities
- `feedback-traceability`: anexo contém dados completos para replay; criação só via tcc-00; filtro de pendências acionáveis
- `issue-mirror-offline`: §3 vira pendências rastreáveis com coluna Comentários (thread) e estados pendente/falha; sync via dupla
- `tcc-orientacao-acompanhamento`: tabela rica transversal; skills 01-07 registram no anexo, não criam issues
- `tcc-orientacao-fundamentacao`: idem — fundamentação registra no anexo, tcc-00 cria issue

## Impact

- Skills `tcc-01`, `tcc-02`, `tcc-03`, `tcc-06`, `tcc-07`, `tcc-00` e `_shared/contrato-e-decisoes.md`, `_shared/anexo-acompanhamento.md` (templates).
- `acompanhamento/<id>.md` e `anexo-acompanhamento.md` ganham colunas/estados novos; migração dos anexos existentes (Pedro/Leandro) preservada.
- Nenhuma quebra de API externa; mudança é de fluxo interno orientador-aluno.
