## ADDED Requirements

### Requirement: Verificação da estrutura ABNT
A skill `tcc-06-revisao-final` SHALL verificar se o documento do TCC possui todas as seções e elementos exigidos pela norma ABNT/IFBA (elementos pré-textuais, textuais e pós-textuais).

#### Scenario: Verificação da estrutura completa
- **WHEN** o orientador apresenta o documento final do aluno
- **THEN** a skill verifica a presença de todas as seções exigidas pelas normas ABNT/IFBA
- **AND** aponta seções ausentes ou mal ordenadas

### Requirement: Verificação de citações e referências
A skill `tcc-06-revisao-final` SHALL verificar a correspondência entre citações no texto e a lista de referências (toda citação deve ter referência e vice-versa).

#### Scenario: Verificação de correspondência
- **WHEN** o documento final é apresentado
- **THEN** a skill cruza citações e referências
- **AND** aponta citações sem referência e referências não citadas

### Requirement: Verificação de consistência entre capítulos
A skill `tcc-06-revisao-final` SHALL verificar a consistência entre os capítulos do trabalho, incluindo uso uniforme de termos e coerência entre objetivos, metodologia e resultados.

#### Scenario: Verificação de consistência
- **WHEN** o documento final é apresentado
- **THEN** a skill verifica termos usados de forma consistente
- **AND** verifica se os resultados respondem aos objetivos propostos

### Requirement: Verificação de formatação geral
A skill `tcc-06-revisao-final` SHALL verificar a formatação geral do documento conforme as normas ABNT/IFBA (margens, fontes, espaçamento, numeração, etc.).

#### Scenario: Verificação de formatação
- **WHEN** o documento final é apresentado
- **THEN** a skill verifica a formatação geral conforme as normas
- **AND** aponta desvios de formatação

### Requirement: Verificação de remoção do Anexo de Acompanhamento
A skill `tcc-06-revisao-final` SHALL verificar se o Anexo de Acompanhamento ainda está presente no documento e apontar que ele deve ser removido na versão final, sem executar a remoção.

#### Scenario: Anexo ainda presente
- **WHEN** o Anexo de Acompanhamento está presente no documento final
- **THEN** a skill aponta que o anexo é material de trabalho não normativo
- **AND** registra a remoção como pendência de alta prioridade para o aluno executar

#### Scenario: Anexo já removido
- **WHEN** o Anexo de Acompanhamento já foi removido do documento final
- **THEN** a skill confirma que o documento está livre do material de trabalho

### Requirement: Checklist de entrega
A skill `tcc-06-revisao-final` SHALL consolidar as verificações em um checklist de entrega com status por item, servindo como prévia para a banca de defesa.

#### Scenario: Consolidação do checklist
- **WHEN** todas as verificações são concluídas
- **THEN** a skill apresenta um checklist consolidado com status por item
- **AND** prioriza pendências a resolver antes da entrega final

### Requirement: Auto-contenção (invocação parcial)
A skill `tcc-06-revisao-final` SHALL funcionar de forma isolada, sem assumir que fases anteriores rodaram ou que o Anexo de Acompanhamento existe, produzindo o checklist sempre e criando o anexo apenas se houver pendências a registrar.

#### Scenario: Revisão final como única skill invocada
- **WHEN** o orientador invoca `tcc-06-revisao-final` como única skill, sem anexo existente
- **THEN** a skill produz o checklist de entrega completo
- **AND** não cria o anexo se não houver pendências a persistir

### Requirement: Descoberta do texto por glob
A skill `tcc-06-revisao-final` SHALL localizar os arquivos `.md`/`.typ` do TCC por glob no diretório do repo, excluindo o Anexo de Acompanhamento e o diretório `.opencode/`, e consultar o orientador quando nenhum arquivo for encontrado.

#### Scenario: Documento final localizado por glob
- **WHEN** há arquivos `.md`/`.typ` do TCC no repo
- **THEN** a skill os localiza por glob e os usa como entrada da revisão
- **AND** verifica se o anexo ainda está presente entre eles

#### Scenario: Nenhum arquivo encontrado
- **WHEN** o glob não encontra arquivos do TCC
- **THEN** a skill pergunta ao orientador onde está o documento ou aceita o texto colado como fallback