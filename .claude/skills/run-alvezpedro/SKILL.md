---
name: run-alvezpedro
description: >
  Verifica a saude do workspace alvezpedro (MazyOS). Use quando quiser checar
  se o workspace esta integro, se os arquivos de memoria estao preenchidos,
  se as skills estao disponiveis e se a estrutura de pastas esta correta.
  Dispara com "verificar workspace", "checar setup", "run alvezpedro", "/run-alvezpedro".
---

# /run-alvezpedro — Health check do workspace

Este workspace e uma instalacao MazyOS para Pedro Paulo (freelancer de presenca digital).
Nao ha servidor, GUI ou CLI a subir. O "run" e um smoke test que verifica integridade.

O driver e `.claude/skills/run-alvezpedro/smoke.ps1`.

## Prerequisitos

- Windows com PowerShell 5.1 (ja disponivel por padrao)
- Estar com a pasta `alvezpedro` aberta no VS Code

## Run (caminho do agente)

```powershell
cd C:\Users\house\alvezpedro
powershell -File ".claude\skills\run-alvezpedro\smoke.ps1"
```

Saida esperada: todas as linhas `[OK]` e mensagem final `Workspace OK.`

Exit code 0 = tudo certo. Exit code > 0 = ha erros criticos (ver linhas `[ERR]`).

## O que o smoke verifica

1. **Diretorios obrigatorios** — `_memoria`, `identidade`, `clientes`, `marketing`, `saidas`, `scripts`, `templates`, `.claude/skills`
2. **Arquivos de memoria** — se empresa.md, preferencias.md e estrategia.md estao preenchidos (nao placeholders)
3. **CLAUDE.md** — se foi adaptado pro negocio (menciona "Pedro Paulo")
4. **Skills** — lista todas as skills disponiveis
5. **Identidade visual** — se design-guide.md foi preenchido

## Avisos vs Erros

- `[OK]` — tudo certo
- `[AVR]` — aviso: algo incompleto mas nao critico (ex: design-guide em branco)
- `[ERR]` — erro critico: pasta ou arquivo essencial ausente

## Gotchas

- A pasta `clientes/` precisa existir mesmo sem clientes ativos. Foi criada no setup com `clientes/almerindo/briefing.md`.
- O `design-guide.md` pode reportar `[OK]` mesmo em branco se o campo "Fundo principal:" existir no arquivo — preenchido de verdade so apos definir identidade visual.
- O script usa `$PSScriptRoot` pra resolver o caminho raiz — funciona de qualquer diretorio, desde que o caminho completo seja passado no `-File`.

## Troubleshooting

**Token inesperado / erro de parsing**
Script corrompido com BOM ou caracteres Unicode. Reescrever com `Set-Content -Encoding utf8`.

**Exit code 1 com `[ERR] Faltando: clientes`**
Criar a pasta: `New-Item -ItemType Directory "clientes" -Force`
