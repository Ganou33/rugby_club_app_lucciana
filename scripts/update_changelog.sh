#!/bin/bash
set -e

VERSION=$(cat VERSION)
DATE=$(date +%Y-%m-%d)
LAST_COMMIT=$(git log -1 --pretty=%B)

# Si la section n'existe pas, on la crée en haut
if ! grep -q "## \[$VERSION\]" CHANGELOG.md; then
  tmpfile=$(mktemp)
  {
    echo "## [$VERSION] - $DATE"
    echo "### Ajouté"
    echo "- $LAST_COMMIT"
    echo
    cat CHANGELOG.md
  } > "$tmpfile"
  mv "$tmpfile" CHANGELOG.md
  echo "✅ Créé section [$VERSION] et ajouté : $LAST_COMMIT"
  exit 0
fi

# Si la section Ajouté n'existe pas encore dans ce bloc, on l'ajoute
if ! awk "/## \[$VERSION\]/,/^##/" CHANGELOG.md | grep -q "### Ajouté"; then
  sed -i "/## \[$VERSION\]/a ### Ajouté\n- $LAST_COMMIT\n" CHANGELOG.md
  echo "✅ Ajouté la sous-section 'Ajouté' et le commit"
  exit 0
fi

# Sinon on insère le commit sous '### Ajouté' dans le bloc de la version
# (entre le header de version et le prochain '##')
sed -i "/## \[$VERSION\]/,/^##/ { /### Ajouté/a - $LAST_COMMIT }" CHANGELOG.md
echo "✅ Ajouté le commit sous 'Ajouté' : $LAST_COMMIT"
