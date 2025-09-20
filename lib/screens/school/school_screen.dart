import 'package:flutter/material.dart';
import '../../widgets/club_scaffold.dart';
import 'baby_screen.dart';
import 'u6_screen.dart';
import 'u8_screen.dart';
import 'u10_screen.dart';
import 'u12_screen.dart';
import 'u14_screen.dart';

class SchoolScreen extends StatelessWidget {
  const SchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClubScaffold(
      selectedIndex: 3, // index de l’école dans le menu
      title: "École de Rugby",
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Bienvenue à l’école de rugby du RC Lucciana 🏉",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            "Notre école accueille les jeunes joueurs dès 5 ans. "
            "Elle leur permet de découvrir les valeurs du rugby : "
            "respect, solidarité et plaisir de jouer ensemble.\n\n"
            "⚫️ Catégories : Baby, U6, U8, U10, U12, U14\n"
            "🔴 Encadrants diplômés\n"
            "📍 Entraînements au stade Charles Galletti",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          _buildCategoryButton(context, "Baby Rugby", const BabyScreen()),
          _buildCategoryButton(context, "U6", const U6Screen()),
          _buildCategoryButton(context, "U8", const U8Screen()),
          _buildCategoryButton(context, "U10", const U10Screen()),
          _buildCategoryButton(context, "U12", const U12Screen()),
          _buildCategoryButton(context, "U14", const U14Screen()),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String title, Widget page) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}
