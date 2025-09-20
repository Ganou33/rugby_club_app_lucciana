import 'package:flutter/material.dart';
import '../../widgets/club_scaffold.dart';
import 'events/baby_events_screen.dart';

class BabyScreen extends StatelessWidget {
  const BabyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClubScaffold(
      selectedIndex: 3,
      title: "Baby Rugby",
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("📅 Entraînements :",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Mercredi 10h00 - 11h00"),
            const Text("Samedi 09h30 - 10h30"),
            const SizedBox(height: 20),
            const Text("👨‍🏫 Éducateur :",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Paul Martin"),
            const Text("📞 06 11 22 33 44"),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const BabyEventsScreen()),
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
