## 1. Contrato e template do anexo

- [x] 1.1 Atualizar `_shared/contrato-e-decisoes.md` (§ Saída padrão + regra "só tcc-00 cria issues; skills 01-07 gravam pendente") e verificar que `openspec validate` passa
- [x] 1.2 Atualizar `_shared/anexo-acompanhamento.md` (template §3 para "Pendências rastreáveis" com colunas Localização/Citação/Diagnóstico/Sugestão/Prioridade/Labels/Estado/Comentários/Body replay) e verificar que anexo novo gerado contém o formato

## 2. Skill tcc-00 via dupla

- [x] 2.1 Reescrever `.opencode/skills/tcc-00-sync-issues/SKILL.md` (fluxo Anexo→GitHub com ensure-labels + filtro pendências acionáveis + GitHub→Anexo com thread Comentários + validação de fechamento) e verificar que `gh label create` é chamado antes de `gh issue create`
- [x] 2.2 Adicionar estados `pendente | criada #N | falha: <erro> | reincidente | fechada confirmada | reaberta` e coluna Comentários (append, nunca overwrite) e verificar via simulação de sync com issue fechada fictícia

## 3. Skills 01-07 anexo-first

- [x] 3.1 Atualizar `tcc-01-concepcao`, `tcc-02-estrutura`, `tcc-03-cronograma` para gravar tabela rica no Anexo (sem `gh`) e verificar que rodada gera linha `pendente` com replay
- [x] 3.2 Atualizar `tcc-04-fundamentacao` e `tcc-05-acompanhamento` para remover `gh issue create` direto e gravar no Anexo (tcc-00 cria) e verificar que `rubrica-rigor-textual` ainda classifica labels
- [x] 3.3 Atualizar `tcc-06-revisao-final` e `tcc-07-apresentacao` idem e verificar consistência com contrato

## 4. Migração e replay

- [x] 4.1 Migrar `acompanhamento/LEANDRO-DA-SILVA-SANTOS.md` e `D:\IFBA\20261_TCC\tcc-Pedro-Victor-Hipolito-Cabral\anexo-acompanhamento.md` para novo formato §3 preservando histórico e verificar que `openspec validate` passa
- [x] 4.2 Replay via `tcc-00` para recriar/atualizar issues LEANDRO #1-6 com body rico (ou marcar `falha: body incompleto`) e verificar que `gh issue view` retorna body com Localização/Citação/Diagnóstico

## 5. Validação

- [x] 5.1 Rodar `openspec validate --strict` e `openspec status --change fix-anexo-resiliente-00-via-dupla` e verificar que todos os deltas e artifacts estão `done`
