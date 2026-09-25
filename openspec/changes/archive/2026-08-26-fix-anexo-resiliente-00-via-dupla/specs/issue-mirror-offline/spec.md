## MODIFIED Requirements

### Requirement: Espelho de issues no Anexo
O Anexo de Acompanhamento por aluno em `acompanhamento/<id>.md` SHALL conter seção **3. Pendências rastreáveis** (evolução do antigo "Espelho de issues") que lista cada pendência com número (ou `— pendente`), labels, título resumido, Localização, Citação, Diagnóstico, Sugestão, estado (`pendente | criada #N | falha: <erro> | fechada confirmada | reaberta`), prioridade, coluna `Comentários` (thread completa de comentários do GitHub) e link quando houver issue criada. Mesmo sem issue criada, a linha SHALL conter dados suficientes para replay.

#### Scenario: Leitura offline do estado
- **WHEN** o orientador consulta `acompanhamento/<id>.md` sem acesso à internet
- **THEN** a seção de pendências apresenta número, labels, título, localização, citação, diagnóstico, sugestão, estado, prioridade e thread de comentários de cada pendência

#### Scenario: Vínculo com a issue no GitHub
- **WHEN** há conectividade e issue foi criada
- **THEN** cada linha oferece o link para a issue correspondente no GitHub do aluno <id>

### Requirement: Sincronização por rodada
A skill `tcc-00-sync-issues` SHALL sincronizar em via dupla: (a) Anexo → GitHub: criar issues pendentes filtradas; (b) GitHub → Anexo: refletir estado e comentários (thread) no Anexo, registrando eventos no Histórico §2. Qualquer skill `tcc-*` SHALL gravar pendências no Anexo mas SHALL NOT criar issues diretamente.

#### Scenario: Refrescamento do espelho na rodada
- **WHEN** rodada de feedback do aluno <id> é concluída
- **THEN** a skill grava pendências no Anexo; 	cc-00 sincroniza GitHub e reescreve a seção de pendências registrando a data
#### Scenario: Criação Anexo → GitHub
- **WHEN** `tcc-00` encontra pendências `pendente` no Anexo
- **THEN** cria as issues via `gh --repo <repo-do-aluno>` e escreve `# real` ou `falha: <erro>` no Anexo, mantendo o Body replay

#### Scenario: Atualização GitHub → Anexo (comentários e fechamento)
- **WHEN** issue no GitHub recebe novo comentário ou é fechada pelo aluno
- **THEN** `tcc-00` appenda o comentário na coluna `Comentários` (sem sobrescrever), registra o evento no Histórico §2 e, se fechada, solicita validação do orientador antes de reabrir ou confirmar

### Requirement: Aviso de defasagem
A seção de pendências SHALL indicar que é projeção do Anexo (conteúdo) + GitHub (estado/comentários), registrando a data da última sincronização via `tcc-00`.

#### Scenario: Indicação de fonte de verdade
- **WHEN** o orientador lê a seção de pendências
- **THEN** ela informa que o conteúdo vem do Anexo e o estado/comentários do GitHub, e apresenta a data da última atualização
