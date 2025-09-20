#!/bin/bash
set -e

VERSION=$(cat VERSION)
DATE=$(date +%Y-%m-%d)

# Vérifie si la version existe déjà dans le changelog
if grep -q "## [$VERSION]" CHANGELOG.md; then
  echo "⚠️ La version $VERSION est déjà dans le CHANGELOG."
  exit 0
fi

# Insère un nouveau bloc en haut du CHANGELOG
tmpfile=$(mktemp)
{
  echo "## [$VERSION] - $DATE"
  echo "### Ajouté"
  echo "- ..."
  echo
  echo "### Modifié"
  echo "- ..."
  echo
  echo "### Corrigé"
  echo "- ..."
  echo
  echo "---"
  echo
  cat CHANGELOG.md
} > "$tmpfile"

mv "$tmpfile" CHANGELOG.md

echo "✅ CHANGELOG mis à jour pour la version $VERSION"
