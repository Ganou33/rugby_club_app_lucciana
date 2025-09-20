import 'package:flutter/material.dart';
import '../../../widgets/club_scaffold.dart';

class U10EventsScreen extends StatelessWidget {
  const U10EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClubScaffold(
      selectedIndex: 3,
      title: "Événements U10",
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              title: Text("Plateau U10 à Corte"),
              subtitle: Text("📅 Samedi 25 octobre 2025\n⏰ 10h00"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Stage découverte"),
              subtitle: Text("📅 Lundi 3 novembre 2025\n⏰ 14h00"),
            ),
          ),
        ],
      ),
    );
  }
}
