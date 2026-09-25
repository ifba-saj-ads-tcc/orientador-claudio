## 1. Contrato — padrão descritivo da Sugestão

- [x] 1.1 Atualizar `_shared/contrato-e-decisoes.md` § Saída padrão de feedback — redefinir `Sugestão` para exigir ação+conceito inline+passos+critério (3–5 linhas) com 1 exemplo canônico (IMRaD/NBR 6028) e verificar `Read` do arquivo
- [x] 1.2 Atualizar `_shared/rubrica-rigor-textual.md` se referenciar Sugestão — alinhar ao novo padrão e verificar

## 2. Skills — replicar instrução guia

- [x] 2.1 Editar `.opencode/skills/tcc-06-revisao-final/SKILL.md` (j) Completude Resumo IMRaD e § Registrar — incluir template inline e verificar
- [x] 2.2 Editar `.opencode/skills/tcc-05-acompanhamento/SKILL.md` — incluir instrução de Sugestão descritiva e verificar
- [x] 2.3 Editar `.opencode/skills/tcc-04-fundamentacao/SKILL.md` — incluir instrução e verificar
- [x] 2.4 Editar `.opencode/skills/tcc-01-concepcao/SKILL.md`, `tcc-02-estrutura/SKILL.md`, `tcc-03-cronograma/SKILL.md`, `tcc-07-apresentacao/SKILL.md` e `tcc-00-sync-issues/SKILL.md` (nota de que Body replica Sugestão rica) e verificar

## 3. Validação

- [x] 3.1 Rodar `openspec validate --change enrich-sugestao-descritiva --strict` e corrigir até passar
- [x] 3.2 Simular 1 pendência (ex.: resumo IMRaD #17) com nova instrução — conferir que Sugestão gerada contém sigla explicada inline + passos + critério e que cabe no Body da issue
