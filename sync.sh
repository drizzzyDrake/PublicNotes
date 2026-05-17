#!/bin/bash

# === Dynamic Paths ===
BASE_PATH="$HOME/Desktop/Obsidian"
VAULT="$BASE_PATH/UniNotes"
PUBLIC_NOTES="$BASE_PATH/PublicNotes"
QUARTZ_CONTENT="$PUBLIC_NOTES/content"

# === Git Config ===
GIT_EMAIL="giuliodionisi@icloud.com"
GIT_USER="drizzzyDrake"

# === Folders to sync ===
FOLDERS=("ADE" "BD1" "MDP" "SO1" "RE")

echo "--- Starting sync for $GIT_USER ---"

# === Git setup ===
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_USER"

# === Sync notes ===
for folder in "${FOLDERS[@]}"; do
    SRC="$VAULT/$folder/"
    DEST="$QUARTZ_CONTENT/$folder/"

    if [ ! -d "$SRC" ]; then
        echo "Source not found: $SRC. Skipping..."
        continue
    fi

    echo "Syncing $folder..."

    rsync -av --delete \
        --exclude=".obsidian" \
        --exclude="_Images" \
        "$SRC" "$DEST"
done

# === Sync images ===
IMAGES_SRC="$VAULT/_Images/"
IMAGES_DEST="$QUARTZ_CONTENT/_Images/"

echo "Syncing images..."

mkdir -p "$IMAGES_DEST"

rsync -av --delete \
    "$IMAGES_SRC" "$IMAGES_DEST"

# === Build Quartz ===
echo "Building Quartz..."

cd "$PUBLIC_NOTES" || exit

if [ ! -d "node_modules" ]; then
    echo "Installing missing modules..."
    npm install
fi

npx quartz build

# === Git Commit & Push ===
echo "Pushing changes to GitHub..."

if [ -d ".git" ]; then
    git add .

    COMMIT_MSG="Sync + build - $(date '+%Y-%m-%d %H:%M')"

    git commit -m "$COMMIT_MSG" || true

    git push origin main
else
    echo "ERROR: $PUBLIC_NOTES is not a Git repository!"
fi

echo "--- Sync completed successfully! ---"

