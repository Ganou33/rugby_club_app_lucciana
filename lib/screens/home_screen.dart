import 'package:flutter/material.dart';
import '../widgets/club_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ClubScaffold(
      // 👈 ajouté 'const'
      selectedIndex: 0, // Accueil
      title: "RC Lucciana",
      body: Center(
        child: Text(
          "Bienvenue sur l'application du RC Lucciana 🏉",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
