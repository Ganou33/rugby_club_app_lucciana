import 'package:flutter/material.dart';
import '../../../widgets/club_scaffold.dart';

class U14EventsScreen extends StatelessWidget {
  const U14EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClubScaffold(
      selectedIndex: 3,
      title: "Événements U14",
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              title: Text("Tournoi régional U14"),
              subtitle: Text("📅 Samedi 15 novembre 2025\n⏰ 09h00"),
            ),
          ),
        ],
      ),
    );
  }
}
