import 'package:flutter/material.dart';
import '../../../widgets/club_scaffold.dart';

class U12EventsScreen extends StatelessWidget {
  const U12EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClubScaffold(
      selectedIndex: 3,
      title: "Événements U12",
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              title: Text("Stage U12 à Bastia"),
              subtitle: Text("📅 Lundi 10 novembre 2025\n⏰ 14h00"),
            ),
          ),
        ],
      ),
    );
  }
}
