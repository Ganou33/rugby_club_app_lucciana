#!/bin/bash
set -e

VERSION=$(cat VERSION)
DATE=$(date +%Y-%m-%d)

LAST_COMMIT=$(git log -1 --pretty=%B)

# Vérifie si la version existe déjà
if ! grep -q "## [$VERSION]" CHANGELOG.md; then
  # Crée un bloc si la version n'existe pas encore
  tmpfile=$(mktemp)
  {
    echo "## [$VERSION] - $DATE"
    echo "### Ajouté"
    echo "- $LAST_COMMIT"
    echo
    echo "---"
    echo
    cat CHANGELOG.md
  } > "$tmpfile"
  mv "$tmpfile" CHANGELOG.md
else
  # Ajoute le commit sous la section Ajouté
  sed -i "/## \[$VERSION\]/,/---/ { /### Ajouté/a - $LAST_COMMIT }" CHANGELOG.md
fi

echo "✅ CHANGELOG mis à jour avec le commit : $LAST_COMMIT"
