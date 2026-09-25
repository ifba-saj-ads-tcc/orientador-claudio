## MODIFIED Requirements

### Requirement: Espelho de issues no Anexo
O Anexo de Acompanhamento por aluno em `acompanhamento/<id>.md` SHALL conter seção **3. Pendências rastreáveis** (evolução do antigo "Espelho de issues") que lista cada pendência com número (ou `— pendente`), labels, título resumido, Localização, Citação, Diagnóstico, Sugestão, estado (`pendente | criada #N | falha: <erro> | fechada confirmada | reaberta | rejeitada | n/a`), prioridade, coluna `Comentários` (thread completa de comentários do GitHub) e link quando houver issue criada. Linhas com `rejeitada` ou `n/a` SHALL NOT gerar issue. Mesmo sem issue criada, a linha SHALL conter dados suficientes para replay. O campo `Sugestão` exibido no espelho SHALL seguir o padrão descritivo: ação específica + explicação inline de siglas/normas na primeira ocorrência + passos numerados + critério de verificação, em 3–5 linhas, sem depender de glossário externo.

#### Scenario: Leitura offline do estado
- **WHEN** o orientador consulta `acompanhamento/<id>.md` sem acesso à internet
- **THEN** a seção de pendências apresenta número, labels, título, localização, citação, diagnóstico, sugestão descritiva (com siglas explicadas inline), estado, prioridade e thread de comentários de cada pendência

#### Scenario: Vínculo com a issue no GitHub
- **WHEN** há conectividade e issue foi criada
- **THEN** cada linha oferece o link para a issue correspondente no GitHub do aluno <id>

#### Scenario: Linha rejeitada ou n/a não gera issue
- **WHEN** linha tem `Estado: rejeitada` ou `n/a`
- **THEN** `tcc-00` não cria issue para essa linha e, se houver issue preexistente aberta, fecha-a

