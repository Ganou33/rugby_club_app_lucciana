import 'package:flutter/material.dart';
import '../../widgets/club_scaffold.dart';
import 'events/u6_events_screen.dart';

class U6Screen extends StatelessWidget {
  const U6Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClubScaffold(
      selectedIndex: 3,
      title: "Catégorie U6",
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("📅 Entraînements :",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Mercredi 14h00 - 15h30"),
            const Text("Samedi 10h00 - 11h30"),
            const SizedBox(height: 20),
            const Text("👨‍🏫 Éducateur :",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Jean Dupont"),
            const Text("📞 06 12 34 56 78"),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const U6EventsScreen()),
                  );
                },
                icon: const Icon(Icons.event),
                label: const Text("Événements à venir"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
