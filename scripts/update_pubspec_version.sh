#!/bin/bash
set -e

VERSION=$(cat VERSION)

# On fixe build à +1 par défaut (tu peux automatiser si besoin)
NEW_VERSION="$VERSION+1"

# Remplace la ligne version: dans pubspec.yaml
sed -i "s/^version: .*/version: $NEW_VERSION/" pubspec.yaml

echo "✅ pubspec.yaml mis à jour avec version $NEW_VERSION"
