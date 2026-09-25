## 1. Contrato compartilhado

- [x] 1.1 Atualizar `_shared/contrato-e-decisoes.md`: issues como fonte de verdade, número da issue como código de rastreabilidade, ciclo de vida (open/closed/reopened)
- [x] 1.2 Definir no contrato a taxonomia de labels (domínio, tipo, prioridade, categoria procedural `entregavel`)
- [x] 1.3 Atualizar o modelo `_shared/anexo-acompanhamento.md`: a seção 3 (Pendências) vira **Espelho de issues** com colunas `#`, `Labels`, `Título`, `Estado`, `Prioridade`, link e carimbo de data

## 2. Skill de acompanhamento (tcc-05)

- [x] 2.1 Criar issue para cada novo apontamento e reutilizar issues existentes pelo número ao reavaliar
- [x] 2.2 Fechar/reabrir issues conforme nova/resolvida/reincidente e comentar a rodada
- [x] 2.3 Aplicar labels de domínio, tipo, prioridade e procedural às issues
- [x] 2.4 Refrescar o espelho de issues no anexo ao concluir cada rodada

## 3. Skill de fundamentação (tcc-04)

- [x] 3.1 Criar/reutilizar issues para os achados da análise e aplicar labels
- [x] 3.2 Atualizar o ciclo de vida das issues conforme reavaliação
- [x] 3.3 Refrescar o espelho de issues no anexo

## 4. Skill de revisão final (tcc-06)

- [x] 4.1 Referenciar as issues das pendências acumuladas no checklist de entrega
- [x] 4.2 Criar/manter a issue `entregavel` de remoção do anexo (aberta quando presente no material; fechada quando ausente)
- [x] 4.3 Atualizar o espelho de issues no anexo

## 5. Skill de apresentação (tcc-07)

- [x] 5.1 Criar/reutilizar issues para itens e pendências da preparação da defesa e aplicar labels
- [x] 5.2 Refrescar o espelho de issues no anexo

## 6. Sincronização por GitHub Action

- [x] 6.1 Criar workflow que regenera o espelho de issues no anexo em eventos `issues` e `issue_comment`
- [x] 6.2 Configurar permissões de escrita do workflow e commit automático do espelho atualizado

## 7. Migração e validação

- [x] 7.1 Migrar pendências existentes do anexo real para issues abertas com labels conforme o conteúdo
- [x] 7.2 Validar que o espelho é legível offline (número, labels, título, estado, prioridade) e tem carimbo de data
- [x] 7.3 Validar que nenhuma skill edita o texto do TCC e que o espelho substitui a tabela manual de pendências