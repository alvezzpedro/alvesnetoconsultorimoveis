# Pedro Paulo — MazyOS

> Operação freelancer de presença digital. Aqui ficam todos os clientes,
> briefings, entregas e contexto de trabalho.

## O que é esse workspace

Pasta de operação do Pedro Paulo como freelancer. Cada cliente tem sua
subpasta. O sistema lê o contexto antes de cada resposta e aprende com
as correções.

**Estrutura de pastas:**
- `_memoria/` — quem sou, como falo, foco atual
- `identidade/` — marca pessoal (em construção — ref: "Alvez Pedro")
- `clientes/` — uma subpasta por cliente, autossuficiente
- `propostas/` — propostas em rascunho ou enviadas
- `marketing/` — conteúdo próprio (Insta, LinkedIn, portfólio)
- `saidas/` — e-mails, documentos pontuais
- `dados/` — arquivos a analisar
- `scripts/` — automações e scripts de apoio
- `templates/` — modelos reutilizáveis

## Quem sou

Sou Pedro Paulo, freelancer de presença digital completa.
Trabalho com pequenos negócios e autônomos entregando marca,
identidade visual, site e tráfego pago.

## Meu serviço

- Criação de marca e identidade visual
- Landing pages e sites
- Gestão de tráfego pago (Google Ads / Meta Ads)

## Clientes ativos

- **Almerindo** — corretor de imóveis, projeto completo em andamento
  (ver `_memoria/empresa.md` para detalhes e contexto da entrega)

## Como trabalho

Solo. Projeto atual cobre da marca até a geração de leads.
Ferramentas a definir conforme a operação evoluir.

## Tom de voz

Direto, prático, sem enrolação. Escrita correta — com acentos e
vírgulas — mas informal. Sem abreviações, sem jargão de guru.

Evitar: "vc", "tb", "alavancar", "sinergia", emojis desnecessários,
tom excessivamente formal.

## Regras do sistema

- Cliente novo → criar pasta `clientes/<Nome>/` com `briefing.md`
- Proposta enviada → `clientes/<Nome>/proposta.html` (ou `propostas/` se não fechou)
- Antes de subir tráfego pago num cliente → revisar landing page contra
  checklist em `_memoria/estrategia.md`

## Ferramentas conectadas

- [ ] Notion
- [ ] Gmail
- [ ] Google Calendar
- [ ] Stripe / cobrança

*(Marcar conforme for instalando os MCPs)*

---

## Contexto do negócio

No início de toda conversa, ler os seguintes arquivos (quando existirem
e estiverem preenchidos):

1. `_memoria/empresa.md` — quem é o usuário, o que faz, como funciona o negócio
2. `_memoria/preferencias.md` — tom de voz, estilo de escrita, o que evitar
3. `_memoria/estrategia.md` — foco atual, prioridades, prazos

Usar essas informações como base pra qualquer resposta ou decisão. Ao
sugerir prioridades, formatos ou abordagens, considerar o foco atual
descrito em `estrategia.md`.

Pra qualquer tarefa visual (carrossel, post, landing page), consultar
`identidade/design-guide.md` como referência de estilo.

Não é necessário listar o que foi lido nem confirmar a leitura. Apenas
usar o contexto naturalmente.

---

## Fluxo de trabalho

Antes de executar qualquer tarefa, verificar se existe skill relevante
em `.claude/skills/`. Se encontrar, seguir as instruções da skill. Se
não encontrar, executar a tarefa normalmente.

Ao concluir uma tarefa que não tinha skill mas parece repetível, perguntar:

> "Isso pode virar uma skill pra próxima vez. Quer que eu crie?"

---

## Aprender com correções

Quando o usuário corrigir algo ou dar instrução permanente, perguntar:

> "Quer que eu salve isso pra não precisar repetir?"

Se sim, salvar em:
- **Sobre o negócio** → `_memoria/empresa.md`
- **Sobre preferências e estilo** → `_memoria/preferencias.md`
- **Sobre prioridades e foco** → `_memoria/estrategia.md`
- **Regra de comportamento nessa pasta** → `CLAUDE.md`

---

## Manter contexto atualizado

Ao terminar uma tarefa que mudou algo relevante, perguntar:

> "Isso mudou algo no teu contexto. Quer que eu atualize a memória?"

**Quando NÃO perguntar:**
- Tarefas pontuais sem impacto no contexto
- Perguntas simples ou conversas sem ação

---

## Criação de skills

Quando o usuário pedir skill nova:

1. Verificar se existe template relevante em `templates/skills/`
2. Perguntar se é específica desse projeto ou útil em qualquer contexto
3. Ler `_memoria/empresa.md` e `_memoria/preferencias.md` pra calibrar
4. Seguir o fluxo da skill-creator nativa do Claude Code
