# tcc-orientacao-revisao-final

## Purpose

Capacidade de verificar o TCC final conforme normas ABNT/IFBA (estrutura, citações x referências, consistência entre capítulos, formatação) e checar a remoção do Anexo de Acompanhamento do material entregue, consolidando um checklist de entrega. O checklist referencia as issues de rastreabilidade e o espelho do Anexo.

## Requirements

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
A skill `tcc-06-revisao-final` SHALL verificar a formatação geral conforme NBR 14724:2024 + NBR 6024:2012 + NBR 6027:2012: papel A4, margens 3/3/2/2 cm, fonte Arial/Times 12 (10 para citações ≥4 linhas, notas, legendas), espaçamento 1,5 (simples em citações longas, notas, referências, legendas), parágrafo 1,25 cm sem espaço entre parágrafos, seções primárias em caixa alta negrito iniciando em página nova (ímpar se frente-verso), paginação contada da folha de rosto mas numerada a partir da Introdução no canto superior direito.

#### Scenario: Verificação de formatação
- **WHEN** o documento final é apresentado
- **THEN** a skill verifica margens/fonte/espaçamento/parágrafo/numeração progressiva/paginação
- **AND** aponta desvios (ex.: fonte 11, espaçamento simples no corpo, sem recuo, sem quebra de seção primária)

### Requirement: Verificação de citações NBR 10520:2023
A skill SHALL validar citações no sistema autor-data: direta curta (<4 linhas) entre aspas, direta longa (≥4 linhas) recuo 4 cm, fonte 10, simples sem aspas; indireta sem aspas; citação de citação `apud`; até 3 autores listados, >3 usa `et al.`; correspondência com NBR 6023:2025.

### Requirement: Verificação de referências NBR 6023:2025
A skill SHALL validar lista de referências: ordem alfabética por sobrenome em CAIXA ALTA, alinhamento à esquerda, simples dentro / em branco entre, SOBRENOME, Nome. **Título** . Local: Editora, Ano. + `Disponível em:` + `Acesso em:` para fontes web; detalhar vídeos/podcasts/redes quando aplicável.

### Requirement: Verificação de ilustrações/tabelas/quadros
A skill SHALL diferenciar tabela (dados numéricos, bordas laterais abertas, IBGE) vs quadro (textual, grade fechada) vs figura; legenda/título acima para tabela/quadro e abaixo para figura/código, fonte obrigatória mesmo se autoral (`Fonte: Elaborado pelo autor (2026)`), numeração contínua, chamada no texto próxima ao elemento.

### Requirement: Verificação de Resumo NBR 6028:2021 e Sumário NBR 6027:2012
A skill SHALL validar sumário como último pré-textual, refletindo tipografia do texto, sem incluir pré-textuais, com pontos entre título e página; já coberto em Completude do Resumo para 150-500 palavras, parágrafo único, 3-6 palavras-chave separadas por ponto e vírgula, terceira pessoa, voz ativa.

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

### Requirement: Checklist de entrega
A skill `tcc-06-revisao-final` SHALL consolidar as verificações em um checklist de entrega com status por item, referenciando as issues que rastreiam as pendências acumuladas e servindo como prévia para a banca de defesa.

#### Scenario: Consolidação do checklist
- **WHEN** todas as verificações são concluídas
- **THEN** a skill apresenta um checklist consolidado com status por item
- **AND** referencia a issue que rastreia cada pendência acumulada
- **AND** prioriza pendências a resolver antes da entrega final

### Requirement: Checklist separa rejeitadas
A skill `tcc-06-revisao-final` SHALL listar pendências com `Estado: rejeitada` em seção separada "Rejeitadas (não bloqueiam)" do checklist de entrega, distinta de pendências bloqueantes. `rejeitada` SHALL NOT bloquear entrega/defesa.

#### Scenario: Checklist com rejeitadas
- **WHEN** Anexo contém linhas `rejeitada`
- **THEN** checklist exibe seção "Rejeitadas (não bloqueiam)" com essas linhas, sem tratá-las como pendência aberta

### Requirement: Unicidade de legendas (ABNT)
A skill `tcc-06-revisao-final` SHALL detectar legendas (`caption`) duplicadas entre figuras/tabelas/códigos/algoritmos (NBR 6024/14724) e reportar como pendência de formato.

#### Scenario: Legendas duplicadas
- **WHEN** duas ou mais ocorrências de `#codigo`/`#figura`/`#tabela` compartilham o mesmo `caption`
- **THEN** a skill lista as localizações (ex.: `main.typ:602,609`) e sugere renomear para títulos únicos e descritivos

### Requirement: Completude do Resumo/Abstract
A skill `tcc-06-revisao-final` SHALL verificar se `resumo-conteudo`/`abstract-conteudo` atendem à NBR 6028 (150-500 palavras, estrutura IMRaD).

#### Scenario: Resumo incompleto
- **WHEN** o resumo tem <100 palavras ou omite problema/método/resultados/conclusão presentes no texto
- **THEN** a skill reporta como pendência `resumo` de alta prioridade e sugere reescrita espelhada resumo/abstract

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