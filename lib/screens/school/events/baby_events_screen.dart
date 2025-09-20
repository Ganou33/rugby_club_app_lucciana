import 'package:flutter/material.dart';
import '../../../widgets/club_scaffold.dart';

class BabyEventsScreen extends StatelessWidget {
  const BabyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClubScaffold(
      selectedIndex: 3,
      title: "Événements Baby Rugby",
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              title: Text("Séance découverte"),
              subtitle: Text("📅 Samedi 11 octobre 2025\n⏰ 10h00"),
            ),
          ),
        ],
      ),
    );
  }
}
