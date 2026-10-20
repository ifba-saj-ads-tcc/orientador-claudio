---
name: tcc-60-sincronizar
description: Única skill autorizada a criar, comentar, fechar ou reabrir issues no repositório GitHub de um aluno, a partir das Pendências rastreáveis do acompanhamento — e a trazer de volta comentários e fechamentos feitos pelo aluno. Use quando o orientador disser "sincroniza as issues", "publica as pendências", depois do passo 20.6 da tcc-20-orientar, ou para saber o status atual das issues de um ou de todos os alunos.
---

# tcc-60-sincronizar

Leia `contrato/contrato-de-acesso.md` — esta é a única skill que executa `gh issue`
create/edit/close/reopen/comment e `gh label create`. As outras skills só escrevem no
acompanhamento; esta skill é o portão entre o acompanhamento e o GitHub.

## Fluxo de trabalho

### 1. Acompanhamento → GitHub (publicar pendências)
- Leia `registro/acompanhamento/<slug>.md`, seção 3. Filtre as linhas com Estado `pendente`.
- Garanta que as labels da taxonomia existem no repo do aluno (`gh label list --repo <repo>`;
  crie as que faltarem com `gh label create`, sem duplicar).
- Antes de criar, cheque duplicidade (`gh issue list --repo <repo> --search "in:title <título>"`)
  — nunca crie duas issues para a mesma pendência.
- Para cada linha `pendente`: `gh issue create --repo <repo> --title "<título>" --label
  "<labels>" --body "<corpo>"`. O corpo traz, nesta ordem:
  1. **O que esta parte do TCC precisa ter** — quando a pendência vem de uma regra de
     `normas/conteudo-por-secao.md`, explique a regra com suas palavras, em linguagem para o
     aluno: o que a seção deve conter (ou não deve), onde fica no trabalho e por que isso
     importa para o TCC. Dois a quatro períodos, autocontidos: o aluno precisa entender sem
     consultar nenhum outro documento.
  2. **Onde** — a Localização.
  3. **Trecho** — a Citação, quando houver.
  4. **O que encontramos** — o Diagnóstico, **sem o código da regra**.
  5. **O que fazer** — a Sugestão, com passos numerados quando fizer sentido.
  6. **Prioridade**.
- **Códigos de regra nunca vão para o GitHub.** Os códigos (`EST-`, `INT-`, `REF-`, `COR-`,
  `MET-`, `DES-`, `RES-`, `CON-`, `RSM-`, `PRE-`, `POS-`) são de uso interno do orientador e
  ficam só no acompanhamento. Não os coloque no título, no corpo, nos comentários nem como
  label, e não escreva "conforme a regra X": no lugar da citação, vai a descrição detalhada do
  item 1. Se o Diagnóstico do acompanhamento começa pelo código, retire-o ao montar a issue.
- Em sucesso, atualize a linha para `criada #N` com o link; em falha, registre
  `falha: <erro>` sem perder o conteúdo, para tentar de novo.
- Linhas `rejeitada`: se existir issue aberta correspondente, feche-a. Nunca crie issue para
  linha `rejeitada` ou `n/a`.

### 2. GitHub → Acompanhamento (trazer o retorno do aluno)
- Para cada issue referenciada (`criada #N` ou posterior), colete estado e comentários
  (`gh issue view <N> --repo <repo> --json state,comments,closedAt`).
- Anexe comentários novos na coluna Comentários — sempre acrescentando, nunca sobrescrevendo.
- Linha em `corrigida aguardando validação` que o orientador não pediu para reabrir: promova para
  `fechada confirmada` e feche a issue — manter esse estado equivale a aprovar a correção.
- Issue fechada pelo aluno com a linha ainda em `criada #N`: não confirme sozinha. Registre no
  Histórico; a próxima revisão (passo 20.2 da `tcc-20-orientar`) confere a correção.

### 3. Relatar
- Informe quantas pendências foram criadas, quantas falharam, quantos comentários novos vieram e
  quantas aguardam validação do orientador.
- Atualize o carimbo "Atualizado em" no acompanhamento.

## Regras
- Nunca apague uma linha da tabela de pendências, mesmo fechada — é histórico.
- Se o repositório do aluno estiver com issues desabilitadas, habilite antes
  (`gh repo edit <repo> --enable-issues`).
- Em caso de dúvida sobre reabrir ou confirmar um fechamento, pergunte ao orientador.
