import 'package:flutter/material.dart';
import '../../../widgets/club_scaffold.dart';

class U8EventsScreen extends StatelessWidget {
  const U8EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClubScaffold(
      selectedIndex: 3,
      title: "Événements U8",
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              title: Text("Plateau U8 à Ajaccio"),
              subtitle: Text("📅 Dimanche 2 novembre 2025\n⏰ 09h30"),
            ),
          ),
        ],
      ),
    );
  }
}
