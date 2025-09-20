#!/bin/bash
set -e

VERSION=$(cat VERSION)
DATE=$(date +%Y-%m-%d)
LAST_COMMIT=$(git log -1 --pretty=%B)

# Vérifie si la version existe déjà
if ! grep -q "## [$VERSION]" CHANGELOG.md; then
  # Crée un bloc complet
  tmpfile=$(mktemp)
  {
    echo "## [$VERSION] - $DATE"
    echo "### Ajouté"
    echo "- $LAST_COMMIT"
    echo
    cat CHANGELOG.md
  } > "$tmpfile"
  mv "$tmpfile" CHANGELOG.md
  echo "✅ Création nouvelle section [$VERSION] avec commit : $LAST_COMMIT"
else
  # Vérifie si ### Ajouté existe
  if ! awk "/## \[$VERSION\]/,/^##/" CHANGELOG.md | grep -q "### Ajouté"; then
    # Ajoute le sous-titre Ajouté après le header de version
    sed -i "/## \[$VERSION\]/a ### Ajouté\n- $LAST_COMMIT" CHANGELOG.md
    echo "✅ Ajout de la section Ajouté avec premier commit"
  else
    # Ajoute le commit sous ### Ajouté
    sed -i "/## \[$VERSION\]/,/^##/ { /### Ajouté/a - $LAST_COMMIT }" CHANGELOG.md
    echo "✅ Ajout du commit : $LAST_COMMIT"
  fi
fi
