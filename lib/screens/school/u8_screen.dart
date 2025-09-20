import 'package:flutter/material.dart';
import '../../widgets/club_scaffold.dart';
import 'events/u8_events_screen.dart';

class U8Screen extends StatelessWidget {
  const U8Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClubScaffold(
      selectedIndex: 3,
      title: "Catégorie U8",
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("📅 Entraînements :",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Mercredi 15h30 - 17h00"),
            const Text("Samedi 11h00 - 12h00"),
            const SizedBox(height: 20),
            const Text("👨‍🏫 Éducateur :",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Lucie Bernard"),
            const Text("📞 06 22 33 44 55"),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const U8EventsScreen()),
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
