import 'package:flutter/material.dart';
import '../../widgets/club_scaffold.dart';
import 'events/u10_events_screen.dart';

class U10Screen extends StatelessWidget {
  const U10Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClubScaffold(
      selectedIndex: 3,
      title: "Catégorie U10",
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("📅 Entraînements :",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Mercredi 16h00 - 17h30"),
            const Text("Samedi 11h00 - 12h30"),
            const SizedBox(height: 20),
            const Text("👨‍🏫 Éducateur :",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Marie Rossi"),
            const Text("📞 06 87 65 43 21"),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const U10EventsScreen()),
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
