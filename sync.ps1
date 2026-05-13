# === Percorsi Dinamici (Funziona per ogni utente) ===
$basePath = "C:\Users\$($env:USERNAME)\Desktop\Obsidian"
$vault = Join-Path $basePath "UniNotes"
$publicNotes = Join-Path $basePath "PublicNotes"
$quartzContent = Join-Path $publicNotes "content"

# Configurazione Automatica Git (Risolve l'errore dell'email)
$gitEmail = "giuliodionisi@icloud.com" #
$gitUser = "drizzzyDrake"

# Cartelle da sincronizzare
$folders = @("ADE", "BD1", "MDP", "SO1", "RE")

Write-Host "--- Inizio Sync per $gitUser ---" -ForegroundColor Cyan

# Verifichiamo e configuriamo Git
git config --global user.email $gitEmail
git config --global user.name $gitUser

foreach ($folder in $folders) {
    $src = Join-Path $vault $folder
    $dest = Join-Path $quartzContent $folder

    if (-not (Test-Path $src)) {
        Write-Warning "Origine non trovata: $src. Salto..."
        continue
    }

    Write-Host "Sincronizzo $folder..." -ForegroundColor Yellow

    # /NFL /NDL /NJH /NJS rendono l'output più pulito
    robocopy $src $dest /MIR /XD ".obsidian" "_Images" /R:2 /W:5 /NFL /NDL /NJH /NJS
}

# === Copia IMMAGINI ===
$imagesSrc = Join-Path $vault "_Images"
$imagesDest = Join-Path $quartzContent "_Images"

Write-Host "Sincronizzo Immagini..." -ForegroundColor Yellow

foreach ($folder in $folders) {
    $srcImg = Join-Path $imagesSrc ($folder + "-images")
    $destImg = Join-Path $imagesDest ($folder + "-images")

    if (Test-Path $srcImg) {
        robocopy $srcImg $destImg /MIR /R:2 /W:5 /NFL /NDL /NJH /NJS
    }
}

# === Build Quartz ===
Write-Host "Build Quartz in corso..." -ForegroundColor Cyan
Set-Location $publicNotes

if (-not (Test-Path "node_modules")) {
    Write-Host "Moduli mancanti, installazione in corso..."
    npm install
}

npx quartz build

# === Git Commit & Push ===
Write-Host "Invio modifiche a GitHub..." -ForegroundColor Cyan
if (Test-Path ".git") {
    git add .
    # Messaggio personalizzato con il tuo nome
    $commitMsg = "Sync + build - $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
    git commit -m $commitMsg --allow-empty
    git push origin main
} else {
    Write-Error "Errore: La cartella $publicNotes non è un repository Git!"
}

Write-Host "--- Sync completato con successo! ---" -ForegroundColor Green
