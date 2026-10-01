#!/usr/bin/env fish

# === Dynamic Paths ===
set BASE_PATH "$HOME/Progetti/Obsidian"
set VAULT "$BASE_PATH/UniNotes"
set PUBLIC_NOTES "$BASE_PATH/PublicNotes"
set QUARTZ_CONTENT "$PUBLIC_NOTES/content"

# === Git Config ===
set GIT_EMAIL "giuliodionisi@icloud.com"
set GIT_USER "drizzzyDrake"

# === Folders to sync ===
set FOLDERS ADE BD1 MDP SO1 RE

echo "--- Starting sync for $GIT_USER ---"

# === Git setup ===
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_USER"

# === Sync notes ===
for folder in $FOLDERS
    set SRC "$VAULT/$folder/"
    set DEST "$QUARTZ_CONTENT/$folder/"

    if not test -d "$SRC"
        echo "Source not found: $SRC. Skipping..."
        continue
    end

    echo "Syncing $folder..."

    mkdir -p "$DEST"
    rsync -av --delete \
        --exclude=".obsidian" \
        --exclude="_Images" \
        "$SRC" "$DEST"
end

# === Sync images ===
set IMAGES_SRC "$VAULT/_Images/"
set IMAGES_DEST "$QUARTZ_CONTENT/_Images/"

if test -d "$IMAGES_SRC"
    echo "Syncing images..."
    mkdir -p "$IMAGES_DEST"
    rsync -av --delete "$IMAGES_SRC" "$IMAGES_DEST"
else
    echo "No images folder found at $IMAGES_SRC"
end

# === Build Quartz ===
echo "Building Quartz..."

# In Fish si usa ';' seguito da 'or' al posto di '||'
cd "$PUBLIC_NOTES"; or exit 1

if not test -d "node_modules"
    echo "Installing missing modules..."
    npm install
end

npx quartz build

# === Git Commit & Push ===
echo "Pushing changes to GitHub..."

if test -d ".git"
    git add .

    set COMMIT_MSG "Sync + build - "(date '+%Y-%m-%d %H:%M')

    # Commit e push gestiti correttamente in Fish
    if git commit -m "$COMMIT_MSG"
        echo "Commit eseguito con successo."
    else
        echo "Nessuna modifica da committare o commit non necessario."
    end

    echo "Invio delle modifiche a GitHub..."
    git push origin main
else
    echo "ERROR: $PUBLIC_NOTES non è un repository Git!"
end

echo "--- Sync completed successfully! ---"

