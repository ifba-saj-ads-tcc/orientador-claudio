# Rubrica de Rigor Textual — Avaliação de capítulos do TCC

Critério obrigatório de **exigência** para toda avaliação de texto do TCC, aplicável pelas skills de avaliação (`tcc-04-fundamentacao`, `tcc-05-acompanhamento`, `tcc-06-revisao-final`) e por qualquer skill que emita diagnóstico sobre o texto do aluno.

Aplicar este nível de rigor **sempre**, inclusive em reavaliações e em capítulos já vistos. O objetivo é avaliar como um trabalho de conclusão de curso de nível superior: **veracidade, clareza, fluidez, ausência de redundância e correta disposição do conteúdo**.

## Princípio geral

Nenhum diagnóstico se limita a "a leitura está ruim". Todo apontamento deve:
1. basear-se em **citação literal** do texto do aluno;
2. indicar **onde** está (capítulo/seção/linha);
3. ser classificado na **taxonomia de labels** do `contrato-e-decisoes.md` (`fato`, `fonte`, `formato`, `coerencia`, `abnt`, `seguranca`);
4. ter **prioridade** (alta / média / baixa) conforme o impacto na qualidade e na nota.

## Dimensões de exigência

### 1. Coerência (fatos, lógica e números)
Verificar se o texto é **internamente consistente**:
- **Fatual:** números, datas, siglas, versões e nomes corretos e uniformes em todo o documento (ex.: mesmo número não muda de significado entre capítulos). Checar contradições factuais entre afirmações do mesmo trabalho.
- **Lógica:** conclusões e fechos de parágrafo coerentes com o que foi apresentado (ex.: não afirmar "plena consciência" após descrever confusão).
- **Objetivo × escopo:** o objetivo declarado na introdução deve ser coerente com o que foi efetivamente entregue/avaliado (ex.: prometer app Android e entregar PWA + protótipo).
- **Números/metodologia:** valores reportados (tempo, custo, tokens) sem contradição entre si e com a base de dados citada.

### 2. Fluidez
Verificar se o texto **flui bem** para leitura acadêmica:
- Encadeamento lógico entre parágrafos e seções (transições).
- Tempo verbal **consistente** (ex.: não misturar futuro com passado ao descrever o que já foi implementado).
- Clareza e concisão: frases diretas; evitar períodos longos e empilhados.
- Progressão argumentativa (problema → justificativa → objetivo → método → resultado → conclusão) sem "pulos".

### 3. Ausência de redundância
Verificar se **não há repetição desnecessária**:
- Conteúdo repetido entre capítulos (ex.: conclusão reexpondo metodologia/resultados em vez de sintetizar).
- Blocos de código, figuras, tabelas ou argumentos **duplicados literalmente** no mesmo capítulo.
- Justificativas/definições repetidas em seções diferentes.
- Marcar redundância mesmo que "inofensiva", pois infla o texto e reduz a densidade.

### 4. Colocação de conteúdo (cada coisa no lugar certo)
Verificar se **cada conteúdo está no capítulo/seção correto** para a estrutura ABNT do TCC:
- **Metodologia** descreve *como* se fez (método, critérios, execução de experimento).
- **Resultados** apresentam e discutem *o que* se obteve (achados, comparações), sem reexplicar o método.
- **Conclusão** é **síntese** (texto corrido, sem subseções e sem nova discussão), que retoma os objetivos e responde a cada um; achados/discussões derivados dos resultados devem estar nos Resultados.
- **Revisão bibliográfica** reúne fundamentos teóricos; **correlatos** e estado da arte podem estar na introdução/correlatos, não na fundamentação (e vice-versa).
- Elementos pré-textuais (resumo, sumário, listas) no lugar e ordem corretos.

## Saída
Emitir cada achado como linha da tabela padrão das skills, com `Citação do aluno` literal. Todo achado nas dimensões acima **gera ou reutiliza uma issue** (não é só comentário). Prioridade sugerida por impacto:
- **alta:** fato incorreto, contradição lógica/objetivo×escopo, dado numérico inconsistente, conteúdo essencial no lugar errado.
- **média:** redundância relevante, fluidez comprometida, tempo verbal inconsistente, estrutura de conclusão inadequada.
- **baixa:** microformatação, elemento solto sem título, repetição pontual.