## MODIFIED Requirements

### Requirement: Ciclo de vida da pendência
A skill de orientação SHALL representar o ciclo de vida da pendência pelo estado no Anexo e, quando criada, pelo estado da issue no GitHub (open/closed/reopened). `tcc-00` SHALL sincronizar via dupla: ao detectar issue fechada no GitHub, SHALL appendar o comentário do aluno na coluna `Comentários` (thread completa) e registrar o evento no Histórico §2, e SHALL solicitar validação do orientador antes de reabrir ou confirmar fechamento. O domínio de `Estado` SHALL incluir `corrigida aguardando validacao` — estado intermediário gravado pela skill `tcc-*` quando reavaliação detecta correção no texto; a linha permanece visível como "skill verificou, falta validar" antes de qualquer `tcc-00`. No momento do `tcc-00`, manter o estado `corrigida aguardando validacao` equivale a concordância do orientador e SHALL promover para `fechada confirmada` e fechar a issue; alterar para outro estado SHALL reabrir/manter conforme regra existente.

#### Scenario: Pendência fechada pelo aluno requer validação
- **WHEN** `tcc-00` detecta issue `CLOSED` no GitHub mas Anexo ainda `aberta/criada`
- **THEN** `tcc-00` atualiza a coluna `Comentários` e o Histórico, e pergunta ao orientador se deve reabrir ou confirmar fechamento, sem alterar o estado automaticamente

#### Scenario: Pendência resolvida
- **WHEN** nova versão resolve apontamento anterior
- **THEN** a skill grava `corrigida aguardando validacao` no Anexo (em vez de `fechada confirmada` direta); `tcc-00` ao encontrar esse estado com concordância do orientador (estado mantido) fecha a issue e promove para `fechada confirmada`

#### Scenario: Pendência reincidente
- **WHEN** nova versão do texto mantém pendência já fechada como resolvida
- **THEN** a skill registra `reincidente` no Anexo e `tcc-00` reabre a issue com comentário da rodada apenas após confirmação do orientador

#### Scenario: Pendência nova
- **WHEN** nova versão do texto apresenta apontamento ainda não registrado
- **THEN** a skill cria linha `pendente` no Anexo representando a pendência nova

#### Scenario: Skill verifica correção antes do sync
- **WHEN** reavaliação da skill detecta que o texto agora atende ao critério da pendência (ex.: resumo 214 palavras IMRaD)
- **THEN** a skill atualiza a linha de `criada #N` para `corrigida aguardando validacao` mantendo `#N`, visível na tabela antes do orientador rodar `tcc-00`

#### Scenario: Orientador concorda mantendo estado no sync
- **WHEN** `tcc-00` executa e encontra `corrigida aguardando validacao` mantida pelo orientador
- **THEN** `tcc-00` fecha a issue no GitHub e atualiza o Anexo para `fechada confirmada` sem prompt adicional

### Requirement: Estado rejeitada
O domínio de `Estado` da coluna `Estado` em `##3. Pendências rastreáveis` SHALL incluir `rejeitada` e `corrigida aguardando validacao` além de `pendente | criada #N | falha: <erro> | reincidente | fechada confirmada | reaberta | n/a`. `rejeitada` indica decisão exclusiva do orientador de descartar a pendência sem gerar issue; a linha permanece no Anexo com número `#` preservado (não reutilizado) para rastreabilidade, sem justificativa obrigatória. `corrigida aguardando validacao` indica que a skill verificou correção no texto mas aguarda validação do orientador via `tcc-00`.

#### Scenario: Orientador rejeita pendência pendente
- **WHEN** orientador altera `Estado` de linha `pendente` para `rejeitada`
- **THEN** a linha permanece no Anexo com mesmo `#`, não gera issue via `tcc-00`, e passa a ser listada como "Rejeitadas (não bloqueiam)"

#### Scenario: Rejeitada para pendente recria issue
- **WHEN** orientador altera `rejeitada` de volta para `pendente`
- **THEN** `tcc-00` trata como pendente filtrável e cria issue idempotentemente com mesmo `#` preservado
