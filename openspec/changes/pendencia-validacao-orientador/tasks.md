## 1. Contrato e specs — novo estado

- [x] 1.1 Atualizar `_shared/contrato-e-decisoes.md` domínio de `Estado` para incluir `corrigida aguardando validacao` e documentar semântica "manter = concordar" e verificar com `Read`
- [x] 1.2 Revisar deltas de spec já criados e verificar `openspec validate --changes --strict` passa (sem duplicar Requirement header)

## 2. Skills — gravar e promover novo estado

- [x] 2.1 Atualizar `.opencode/skills/tcc-06-revisao-final/SKILL.md`, `tcc-05-acompanhamento/SKILL.md`, `tcc-04-fundamentacao/SKILL.md` para gravar `corrigida aguardando validacao` em reavaliação positiva em vez de `fechada confirmada` direta e verificar
- [x] 2.2 Atualizar `.opencode/skills/tcc-00-sync-issues/SKILL.md` — ao encontrar `corrigida aguardando validacao` mantida, fechar issue e promover para `fechada confirmada` sem prompt; se alterada, reabrir/manter; atualizar carimbo e verificar

## 3. Validação

- [x] 3.1 Rodar `openspec validate --changes --strict` e simular: skill marca #17 como `corrigida aguardando validacao` (214w IMRaD) visível na tabela antes do sync; `tcc-00` com estado mantido promove para `fechada confirmada` e fecha issue
