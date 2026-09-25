# tcc-orientacao-revisao-final

## Purpose

Capacidade de verificar o TCC final conforme normas ABNT/IFBA (estrutura, citações x referências, consistência entre capítulos, formatação) e checar a remoção do Anexo de Acompanhamento do material entregue, consolidando um checklist de entrega. O checklist referencia as issues de rastreabilidade e o espelho do Anexo.

## MODIFIED Requirements

### Requirement: Checklist de entrega
A skill `tcc-06-revisao-final` SHALL consolidar as verificações em um checklist de entrega com status por item, referenciando as issues que rastreiam as pendências acumuladas e servindo como prévia para a banca de defesa.

#### Scenario: Consolidação do checklist
- **WHEN** todas as verificações são concluídas
- **THEN** a skill apresenta um checklist consolidado com status por item
- **AND** referencia a issue que rastreia cada pendência acumulada
- **AND** prioriza pendências a resolver antes da entrega final

### Requirement: Verificação de remoção do Anexo de Acompanhamento
A skill `tcc-06-revisao-final` SHALL verificar se o arquivo `anexo-acompanhamento.md` ainda está presente no material a ser entregue e apontar que ele deve ser excluído da versão final, rastreando essa pendência como uma issue de categoria procedural (`entregavel`), sem executar a remoção.

#### Scenario: Anexo ainda presente no material
- **WHEN** o arquivo `anexo-acompanhamento.md` está presente no material a ser entregue
- **THEN** a skill aponta que o anexo é material de trabalho não normativo
- **AND** mantém ou cria a issue `entregavel` de remoção do anexo em estado aberto
- **AND** registra a remoção como pendência de alta prioridade para o aluno executar

#### Scenario: Anexo já removido
- **WHEN** o arquivo `anexo-acompanhamento.md` não faz parte do material entregue
- **THEN** a skill confirma que o material está livre do material de trabalho
- **AND** fecha a issue `entregavel` de remoção do anexo