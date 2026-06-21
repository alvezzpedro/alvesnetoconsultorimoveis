param([string]$Root = $PSScriptRoot)

$projectRoot = (Resolve-Path (Join-Path $Root "../../..")).Path
Set-Location $projectRoot

$erros = 0
$avisos = 0

function Pass($msg)   { Write-Host "[OK]  $msg" -ForegroundColor Green }
function Aviso($msg)  { Write-Host "[AVR] $msg" -ForegroundColor Yellow; $script:avisos++ }
function Falha($msg)  { Write-Host "[ERR] $msg" -ForegroundColor Red; $script:erros++ }

Write-Host "`n--- Diretorios ---" -ForegroundColor Cyan
$dirs = @("_memoria","identidade","clientes","marketing","saidas","scripts","templates",".claude/skills")
foreach ($d in $dirs) {
    if (Test-Path $d) { Pass $d } else { Falha "Faltando: $d" }
}

Write-Host "`n--- Memoria ---" -ForegroundColor Cyan
$mems = @("_memoria/empresa.md","_memoria/preferencias.md","_memoria/estrategia.md")
foreach ($f in $mems) {
    if (Test-Path $f) {
        $c = Get-Content $f -Raw
        if ($c -match "Pedro Paulo|freelancer|Almerindo|direto|gargalo") {
            Pass $f
        } else {
            Aviso "$f parece placeholder"
        }
    } else {
        Falha "Ausente: $f"
    }
}

Write-Host "`n--- CLAUDE.md ---" -ForegroundColor Cyan
if (Test-Path "CLAUDE.md") {
    $c = Get-Content "CLAUDE.md" -Raw
    if ($c -match "Pedro Paulo") { Pass "CLAUDE.md adaptado" } else { Aviso "CLAUDE.md pode nao estar adaptado" }
} else {
    Falha "CLAUDE.md ausente"
}

Write-Host "`n--- Skills ---" -ForegroundColor Cyan
$skills = Get-ChildItem ".claude/skills" -Directory | Select-Object -ExpandProperty Name
foreach ($s in $skills) { Pass "/$s" }

Write-Host "`n--- Identidade visual ---" -ForegroundColor Cyan
if (Test-Path "identidade/design-guide.md") {
    $dg = Get-Content "identidade/design-guide.md" -Raw
    if ($dg -match "Fundo principal:\s*\S") { Pass "design-guide.md preenchido" } else { Aviso "design-guide.md em branco" }
} else {
    Aviso "identidade/design-guide.md ausente"
}

Write-Host ""
Write-Host "========================================" -ForegroundColor White
if ($erros -eq 0 -and $avisos -eq 0) {
    Write-Host "Workspace OK." -ForegroundColor Green
} elseif ($erros -eq 0) {
    Write-Host "Workspace funcional. $avisos aviso(s). Nenhum erro critico." -ForegroundColor Yellow
} else {
    Write-Host "$erros erro(s) critico(s), $avisos aviso(s)." -ForegroundColor Red
}
Write-Host "========================================" -ForegroundColor White

exit $erros
