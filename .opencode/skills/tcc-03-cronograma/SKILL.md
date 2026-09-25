---
name: tcc-03-cronograma
description: Cria e mantém o cronograma de um TCC por retroplanning a partir da data de defesa, distribuindo marcos com datas-alvo (revisáveis ao longo do processo) no Anexo de Acompanhamento. Use para montar o cronograma de marcos de entrega do TCC.
---

# tcc-03-cronograma — Cronograma de marcos

Assistente do **orientador** na criação e manutenção do cronograma do TCC por retroplanning.

## Contrato (obrigatório)

- Leia `_shared/contrato-e-decisoes.md` antes de agir.
- **Texto do TCC: somente leitura.** **Anexo de Acompanhamento: única área gravável** (seção 1 = marcos).
- **Auto-contenção (D8):** funcione isolada. Se o anexo não existir, **crie-o a partir do modelo** `_shared/anexo-acompanhamento.md` e preencha a seção de Marcos.
- **Descoberta (D9):** localize o texto por glob para dimensionar as etapas. Se não houver, distribua pelos marcos padrão com base no que o orientador informar.

## Fluxo de trabalho

### 1. Coletar a data de referência
Pergunte ao orientador a **data de defesa**.
- Se não houver data marcada, peça uma **data-alvo provisória** (marcada como `(provisória)`).
- Como fallback, peça uma **duração estimada** e derive a data provisória a partir dela.

### 2. Retroplanning
Derive os marcos em **ordem inversa**, da defesa para trás:

```
defesa → revisão final → resultados → metodologia → fundamentação
        → estrutura/projeto → tema e problema
```

Para cada marco, defina uma **data-alvo** com folga razoável entre etapas. Leve em conta a natureza do trabalho (teórico/empírico) ao dimensionar.

### 3. Preencher a seção de Marcos do Anexo
Preencha a tabela da seção **1. Marcos do cronograma** com o cronograma derivado:
| # | Marco | Data alvo | Data revisada | Status | Entrega associada |

### 4. Revisão de datas (rodadas subsequentes)
Quando o orientador informar que uma data mudou:
- Atualize a **Data alvo** ou preencha a coluna **Data revisada**.
- Registre o motivo/contexto da revisão na seção **2. Histórico de orientações**.

### 5. Verificação de marcos (rodadas subsequentes)
- Verifique o **status** de cada marco (feito, em andamento, pendente).
- Alerte sobre marcos **vencidos, próximos ou em risco**, usando a data atual.

### 6. Produzir a saída
- **Cronograma** com marcos e datas-alvo.
- **Alertas** de risco (vencidos/próximos).
- **Pontos para a reunião** de orientação.

## Regras
- Não edite o TCC.
- Datas provisórias devem ser marcadas como tais; o cronograma é revisto ao longo do processo.
- Registre revisões sem perder o histórico (coluna `Data revisada` + histórico de orientações).

> Tabela rica transversal: ver _shared/contrato-e-decisoes.md § Saída padrão de feedback.