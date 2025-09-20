import 'package:flutter/material.dart';
import '../../../widgets/club_scaffold.dart';

class U6EventsScreen extends StatelessWidget {
  const U6EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClubScaffold(
      selectedIndex: 3,
      title: "Événements U6",
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              title: Text("Tournoi U6 à Bastia"),
              subtitle: Text("📅 Samedi 18 octobre 2025\n⏰ 10h00"),
            ),
          ),
        ],
      ),
    );
  }
}
