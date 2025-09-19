import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/club_scaffold.dart';
import '../data/sponsors_data.dart';

class SponsorsScreen extends StatelessWidget {
  const SponsorsScreen({super.key});

  Future<void> _openWebsite(BuildContext context, String url) async {
    final messenger = ScaffoldMessenger.of(context); // 👈 capture avant await
    final uri = Uri.parse(url);

    final can = await canLaunchUrl(uri);
    if (can) {
      final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!ok) {
        messenger.showSnackBar(
          SnackBar(content: Text("Impossible d’ouvrir $url")),
        );
      }
    } else {
      messenger.showSnackBar(
        SnackBar(content: Text("Impossible d’ouvrir $url")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClubScaffold(
      selectedIndex: 4,
      title: "Sponsors & Partenaires",
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: dummySponsors.length,
        itemBuilder: (context, index) {
          final sponsor = dummySponsors[index];
          return GestureDetector(
            onTap: () => _openWebsite(context, sponsor.website),
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        sponsor.logo,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.broken_image, size: 50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    sponsor.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
