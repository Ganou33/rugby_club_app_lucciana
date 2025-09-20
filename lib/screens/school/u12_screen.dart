import 'package:flutter/material.dart';
import '../../widgets/club_scaffold.dart';
import 'events/u12_events_screen.dart';

class U12Screen extends StatelessWidget {
  const U12Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClubScaffold(
      selectedIndex: 3,
      title: "Catégorie U12",
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("📅 Entraînements :",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Mercredi 16h30 - 18h00"),
            const Text("Samedi 13h00 - 14h30"),
            const SizedBox(height: 20),
            const Text("👨‍🏫 Éducateur :",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Sophie Moretti"),
            const Text("📞 06 55 44 33 22"),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const U12EventsScreen()),
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
