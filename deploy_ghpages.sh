#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REMOTE_URL="${GITHUB_PAGES_REMOTE:-https://github.com/aTrotier/EDUC_2026_Master2_IRM.git}"
REPO_SLUG="aTrotier/EDUC_2026_Master2_IRM"
DOCS_DIR="$SCRIPT_DIR/docs"
BUILD_DIR="$DOCS_DIR/build"
SITE_ROOT="$BUILD_DIR/1"

# 1. Générer la doc (Documenter supprime et recrée docs/build)
CI=true GITHUB_REPOSITORY="$REPO_SLUG" julia --project="$DOCS_DIR" "$DOCS_DIR/make.jl"

# 2. Préparer un dossier temporaire qui contiendra le site à la racine de GitHub Pages
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT
cp -R "$SITE_ROOT/." "$TMP_DIR/"

# Ajouter explicitement les assets publics générés par VitePress (par ex. les fichiers HTML embarqués)
if [ -d "$DOCS_DIR/src/public" ]; then
  cp -R "$DOCS_DIR/src/public/." "$TMP_DIR/"
fi

# 3. Initialiser un dépôt Git temporaire juste pour le push
cd "$TMP_DIR"
git init
git checkout -b gh-pages
git add .
git commit -m "Déploiement automatique de la doc"

# 4. Forcer le push vers le dépôt distant
# L'option -f (force) est nécessaire car on réécrit l'historique de gh-pages à chaque fois.
git push -f "$REMOTE_URL" gh-pages

# 5. Revenir à la racine du projet
cd "$SCRIPT_DIR"