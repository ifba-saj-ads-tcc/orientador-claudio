---
name: tcc-20-orientar
description: Conduz uma sessão de orientação de TCC em qualquer etapa (00 Concepção a 09 Defesa), sempre com os mesmos 7 passos — preparar, revisar com a tcc-50-revisar, trabalhar a etapa, montar a pauta, reunião, registrar e decidir se muda de etapa. Na etapa 00 analisa a proposta inicial, direciona para TCC, estrutura os tópicos e sugere referências. Use sempre que o orientador for preparar ou conduzir uma reunião de orientação, avaliar o que o aluno entregou, ou decidir se o aluno pode avançar de etapa.
---

# tcc-20-orientar

Leia antes de agir: `contrato/contrato-de-acesso.md`, `contrato/estrutura-repo-aluno.md` e
`normas/conteudo-por-secao.md`. O repositório do aluno é **somente leitura**. Pendências vão para
o acompanhamento; quem as leva ao GitHub é a `tcc-60-sincronizar`.

O fluxo completo, com diagramas, está em `docs/fluxo-de-uso.md`.

## Os 7 passos — sempre todos, sempre nesta ordem

### 20.1 Preparar
1. Resolva o `slug` do aluno (ver contrato).
2. Leia em `registro/orientandos.yaml` a `etapa_atual` e o `tcc_dir` (`docs` se o repositório tem
   código do projeto + TCC; `.` se é só o TCC).
3. Leia o roteiro da etapa em `etapas/NN-*.md`: seções do TCC, checklist, DEVE / NÃO DEVE.
4. Leia `registro/acompanhamento/<slug>.md`: pendências abertas, histórico recente, leituras
   sugeridas.
5. Leia o texto em `alunos/<slug>/<tcc_dir>/`. Nas etapas 05 a 07, leia também o código do
   projeto no mesmo repositório (fora de `docs/`).

### 20.2 Revisar — nunca é pulado
Chame a `tcc-50-revisar` com o escopo da etapa atual. Ela confere as regras da etapa, as regras
de posição de todas as seções que já existem (ex.: hipótese fora da 1.3, objetivos em lista
numerada) e a ABNT. Na etapa 00, a revisão é sobre a proposta inicial; na 09, sobre o documento
inteiro. Guarde o resultado para a pauta.

### 20.3 Trabalhar a etapa
O que se faz depende da etapa:

| Etapa | Atividades |
|---|---|
| 00 Concepção | **Analisar a proposta**, **direcionar para TCC**, **estruturar os tópicos**, **sugerir referências** (detalhes abaixo) |
| 01 a 08 | Acompanhar as seções da etapa. **Sugerir referências** quando um capítulo novo começa. **Ajustar a estrutura** se o trabalho mudar de rumo |
| 09 Defesa | Preparar a defesa: banca, prazos regimentais, apresentação (ver `etapas/09-defesa.md`) |

**Analisar a proposta** — a partir do que o aluno trouxe (texto, conversa, pré-projeto), avalie
tema, motivação, aderência ao curso, viabilidade e recursos disponíveis.

**Direcionar para TCC** — proponha como sair do tema para um problema delimitado: pergunta de
pesquisa candidata, o que fica dentro e fora do escopo, riscos.

**Estruturar os tópicos** — proponha o sumário do TCC a partir da estrutura recomendada em
`normas/conteudo-por-secao.md`, adaptando os títulos das seções ao tema do aluno sem mudar a
ordem nem o papel de cada seção. Para cada seção, uma linha do que ela deve conter para este
TCC. A estrutura vai ao aluno como **uma pendência** com labels `cap-proposta`, `estrutura`,
`prio-alta`, pedindo que ele crie os títulos no texto do TCC (em `docs/` ou na raiz, conforme
`contrato/estrutura-repo-aluno.md`). Nunca escreva no repositório do aluno.

**Sugerir referências** — para cada tópico da estrutura (ou para o capítulo que está começando),
sugira de 2 a 5 leituras:
- Só indique obras que você consegue **verificar** (DOI, ISBN, página do editor, anais do evento
  ou repositório institucional). **Nunca invente referência** nem complete dados que não conferiu.
- Prefira fontes acadêmicas e atuais; clássicos da área são bem-vindos quando fundantes.
- Registre na seção 4 do acompanhamento (Leituras sugeridas), em formato ABNT, com o link de
  verificação e o tópico a que se destina.
- Crie uma pendência com labels do capítulo, `fonte`, `prio-media`, pedindo a leitura e a
  incorporação no texto.

### 20.4 Montar a pauta
Entregue ao orientador, numa resposta só:
- **Pronto:** o que já atende ao checklist da etapa.
- **Perguntas para a reunião:** as perguntas orientadoras do roteiro mais relevantes agora.
- **Pendências novas:** o que a revisão (20.2) e o trabalho da etapa (20.3) encontraram, cada
  uma com o código da regra quando houver.
- **Resultado do 20.3:** análise, direcionamento, estrutura ou leituras, conforme a etapa.

### 20.5 Reunião
Orientador e aluno conversam. A skill não participa; espera o orientador relatar decisões e
próximos passos.

### 20.6 Registrar
1. Anexe em `registro/acompanhamento/<slug>.md`, seção 2 (Histórico), as decisões e os próximos
   passos da reunião.
2. Anexe na seção 3 as pendências novas, com Estado `pendente` (mesmo formato da
   `tcc-40-solicitar`). Pendências que o orientador descartou na reunião entram como `rejeitada`.
3. Chame a `tcc-30-frequencia` para registrar o encontro (data, duração, assunto).
4. Ofereça rodar a `tcc-60-sincronizar` para publicar as pendências.

Só grave se houver algo a persistir — nunca crie o arquivo de acompanhamento vazio.

### 20.7 Mudar de etapa? — decisão do orientador
1. Mostre o checklist da etapa com o status de cada item (ok / pendente).
2. Se estiver 100% atendido, **pergunte** ao orientador se o aluno passa para a próxima etapa.
3. Só com a confirmação explícita, atualize em `registro/orientandos.yaml` apenas `etapa_atual`
   (nome do arquivo em `etapas/`, sem `.md`) e `ultima_atualizacao`, e registre a mudança no
   Histórico. É a única escrita que esta skill faz no registro.
4. Se não estiver atendido, ou o orientador disser não, a etapa continua. Nos dois casos, a
   próxima sessão recomeça no 20.1.
5. Da etapa 08 a mudança leva à 09 Defesa; o encerramento depois da defesa é com a
   `tcc-10-cadastrar`.

## Regras
- Nunca pule o passo 20.2.
- Nunca mude de etapa sem confirmação do orientador, e nunca pule etapas.
- Se o aluno já escreveu conteúdo de uma etapa futura, a revisão confere as regras de posição
  dessa parte, mas não bloqueia a etapa atual — registre como observação no Histórico.
- Trechos do texto do aluno na resposta: só o necessário para localizar o problema.
