## 1. Artefatos compartilhados (_shared)

- [x] 1.1 Criar `.opencode/skills/_shared/anexo-acompanhamento.md` com o modelo do Anexo de Acompanhamento (Marcos, Histórico de orientações, Pendências e feedbacks) conforme design D3
- [x] 1.2 Criar `.opencode/skills/_shared/normas-abnt-ifba.md` com estrutura do documento ABNT (pré-textual, textual, pós-textual), formatação, citações e referências
- [x] 1.3 Criar `.opencode/skills/_shared/rubrica-fundamentacao.md` derivada do `analise.md` (estrutura/abrangência, aderência ao escopo, inconsistências/contradições, base para metodologia)
- [x] 1.4 Documentar o contrato de acesso (TCC somente leitura; Anexo única área gravável) em um arquivo de referência acessível às skills
- [x] 1.5 Documentar as decisões transversais D8 (skills auto-contidas em invocação parcial) e D9 (descoberta por glob) na referência compartilhada

## 2. tcc-01-concepcao

- [x] 2.1 Criar `.opencode/skills/tcc-01-concepcao/SKILL.md` com frontmatter (name, description) e instruções de lapidação da ideia
- [x] 2.2 Implementar perguntas orientadoras para delimitar tema, problema e escopo
- [x] 2.3 Implementar sugestão de eixos de pesquisa e referencial inicial
- [x] 2.4 Implementar registro da concepção no Anexo de Acompanhamento (histórico), sem editar o TCC
- [x] 2.5 Implementar auto-contenção (D8): funcionar isolada e criar o anexo apenas se houver decisões a persistir
- [x] 2.6 Implementar descoberta por glob (D9) dos arquivos `.md`/`.typ`, com fallback de pergunta/trecho colado

## 3. tcc-02-estrutura

- [x] 3.1 Criar `.opencode/skills/tcc-02-estrutura/SKILL.md` com frontmatter e instruções de geração do esqueleto ABNT
- [x] 3.2 Implementar geração do esqueleto de capítulos/seções a partir do tema e referência às normas `_shared/normas-abnt-ifba.md`
- [x] 3.3 Implementar revisão de estrutura existente (sumário/esboço do aluno)
- [x] 3.4 Implementar registro da estrutura acordada no Anexo de Acompanhamento
- [x] 3.5 Implementar auto-contenção (D8): coletar tema quando a concepção não rodou; criar anexo se houver decisões a persistir
- [x] 3.6 Implementar descoberta por glob (D9) do sumário/esboço, com fallback de pergunta/trecho colado

## 4. tcc-03-cronograma

- [x] 4.1 Criar `.opencode/skills/tcc-03-cronograma/SKILL.md` com frontmatter e instruções de cronograma
- [x] 4.2 Implementar retroplanning a partir da data de defesa (ou data provisória/duração estimada quando não houver data)
- [x] 4.3 Implementar preenchimento da seção de Marcos do Anexo de Acompanhamento
- [x] 4.4 Implementar revisão de datas com registro no histórico de orientações
- [x] 4.5 Implementar verificação de marcos em rodadas subsequentes (vencidos, próximos, em risco)
- [x] 4.6 Implementar auto-contenção (D8): criar o anexo a partir do modelo quando for a primeira skill
- [x] 4.7 Implementar descoberta por glob (D9) para dimensionar as etapas do cronograma

## 5. tcc-04-fundamentacao

- [x] 5.1 Criar `.opencode/skills/tcc-04-fundamentacao/SKILL.md` com frontmatter e instruções de análise da fundamentação
- [x] 5.2 Implementar uso da `_shared/rubrica-fundamentacao.md` como critério de diagnóstico
- [x] 5.3 Implementar verificação de abrangência, atualidade, clareza de definições e estrutura da revisão
- [x] 5.4 Implementar detecção de conceitos fora do escopo e sugestão de questionamento
- [x] 5.5 Implementar detecção de inconsistências, contradições e ambiguidades
- [x] 5.6 Implementar avaliação da base para metodologia e resultados
- [x] 5.7 Implementar saída em tabela (localização / citação / diagnóstico / sugestão / prioridade)
- [x] 5.8 Implementar registro de pendências no Anexo de Acompanhamento
- [x] 5.9 Implementar auto-contenção (D8): produzir a análise sempre; criar anexo apenas se houver pendências a persistir
- [x] 5.10 Implementar descoberta por glob (D9) do capítulo de fundamentação, com fallback de pergunta/trecho colado

## 6. tcc-05-acompanhamento

- [x] 6.1 Criar `.opencode/skills/tcc-05-acompanhamento/SKILL.md` com frontmatter e instruções de acompanhamento
- [x] 6.2 Implementar análise do texto do aluno em formato de tabela de feedback
- [x] 6.3 Implementar encaminhamento para `tcc-04-fundamentacao` quando o capítulo entregue for de fundamentação
- [x] 6.4 Implementar reavaliação de novas versões e verificação de resolução de pendências anteriores
- [x] 6.5 Implementar atualização do histórico e pendências no Anexo de Acompanhamento
- [x] 6.6 Implementar auto-contenção (D8): ler anexo se existir; produzir feedback sempre; criar anexo apenas se houver algo a persistir
- [x] 6.7 Implementar descoberta por glob (D9) do texto do aluno, com fallback de pergunta/trecho colado

## 7. tcc-06-revisao-final

- [x] 7.1 Criar `.opencode/skills/tcc-06-revisao-final/SKILL.md` com frontmatter e instruções de revisão final
- [x] 7.2 Implementar verificação de estrutura ABNT completa
- [x] 7.3 Implementar verificação de correspondência citações × referências
- [x] 7.4 Implementar verificação de consistência entre capítulos (termos, objetivos ↔ resultados)
- [x] 7.5 Implementar verificação de formatação geral ABNT/IFBA
- [x] 7.6 Implementar verificação de presença/remoção do Anexo de Acompanhamento (aponta, não remove)
- [x] 7.7 Implementar consolidação do checklist de entrega com status por item e priorização
- [x] 7.8 Implementar auto-contenção (D8): produzir checklist sempre; criar anexo apenas se houver pendências a persistir
- [x] 7.9 Implementar descoberta por glob (D9) do documento final, com fallback de pergunta/trecho colado

## 8. tcc-07-apresentacao

- [x] 8.1 Criar `.opencode/skills/tcc-07-apresentacao/SKILL.md` com frontmatter e instruções de preparação da defesa
- [x] 8.2 Implementar proposta de estrutura da apresentação e roteiro com distribuição de tempo
- [x] 8.3 Implementar simulação de banca com perguntas prováveis e sugestões de resposta
- [x] 8.4 Implementar registro dos próximos passos da preparação no Anexo de Acompanhamento
- [x] 8.5 Implementar auto-contenção (D8): produzir preparação sempre; criar anexo apenas se houver próximos passos a persistir
- [x] 8.6 Implementar descoberta por glob (D9) do trabalho como base da apresentação

## 9. Integração e validação

- [x] 9.1 Garantir que todas as skills leiam apenas os arquivos `.md`/`.typ` do TCC e escrevam somente no Anexo de Acompanhamento
- [x] 9.2 Validar o frontmatter (name/description) de todas as 7 skills para invocação correta
- [x] 9.3 Testar o fluxo fim-a-fim: concepção → estrutura → cronograma → acompanhamento (com fundamentação) → revisão final → apresentação
- [x] 9.4 Testar invocação parcial (D8): cada skill isolada, incluindo `06-revisao-final` como única skill sem anexo
- [x] 9.5 Testar descoberta por glob (D9): arquivos presentes no repo e fallback quando ausentes
- [x] 9.6 Atualizar `openspec/specs/` sincronizando os delta specs das 7 capabilities após a implementação