import 'package:flutter/material.dart';
import '../widgets/club_scaffold.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ClubScaffold(
      selectedIndex: 6,
      title: "Contact",
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "📞 Contact RC Lucciana",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text("Téléphone : 04 95 xx xx xx"),
            Text("Email : contact@rclucciana.fr"),
            Text("Adresse : Stade Charles Galletti, Lucciana"),
            SizedBox(height: 20),
            Text(
              "Version alpha — infos fictives pour test",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
