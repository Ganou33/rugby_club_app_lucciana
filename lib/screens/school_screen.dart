import 'package:flutter/material.dart';
import '../widgets/club_scaffold.dart';

class SchoolScreen extends StatelessWidget {
  const SchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClubScaffold(
      selectedIndex: 3, // index de l’école dans le menu
      title: "École de Rugby",
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            "Bienvenue à l’école de rugby du RC Lucciana 🏉",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            "Notre école accueille les jeunes joueurs dès 5 ans. "
            "Elle leur permet de découvrir les valeurs du rugby : "
            "respect, solidarité et plaisir de jouer ensemble.\n\n"
            "⚫️ Catégories : U6, U8, U10, U12, U14\n"
            "🔴 Encadrants diplômés\n"
            "📍 Entraînements au stade Charles Galletti",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
