# Changelog - RC Lucciana App

Toutes les modifications notables de ce projet seront documentées ici.  
Format inspiré de [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/)  
et respecte [Semantic Versioning](https://semver.org/lang/fr/).

---

## [0.3.0] - En cours de développement
### Ajouté
- fix : test insertion changelog

### Ajouté
- Nouvel onglet **Contact** (📞), équilibrage de la barre de navigation (3 icônes de chaque côté du logo central).
- Page ContactScreen avec informations fictives (version alpha).
- Ajustement du `childAspectRatio` dans Boutique pour éviter l’overflow visuel.
- Amélioration de l’onglet École de Rugby
- Ajout des catégories dans l'école de rugby
  
### Modifié
- Refonte du `BottomNav` : centrage parfait autour du FAB central.
  
---

## [0.2.0] - 2025-09-20
### Ajouté
- Intégration de **ClubScaffold** avec navigation centralisée.
- `BottomNav` avec logo central (FAB).
- **Page Boutique alpha** avec 4 articles fictifs :
  - Polo, Short, Maillot, Casquette (images locales).
  - Message *“Boutique en ligne à venir”* au clic.
- Mise en place d’une grille de produits avec `GridView`.

### Modifié
- Navigation cohérente via `routes.dart`.
- Ajout de `/boutique` comme route dédiée.

---

## [0.1.0] - 2025-09-13
### Ajouté
- Structure initiale de l’application Flutter.
- Pages principales :
  - Home (🏠)
  - News (📰)
  - Calendar (📅)
  - School (🎓)
  - Sponsors (🤝)
- Intégration du logo RC Lucciana et premier affichage du prochain match.

---
