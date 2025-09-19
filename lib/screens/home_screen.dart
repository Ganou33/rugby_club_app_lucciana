import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/club_scaffold.dart';
import '../data/calendar_senior1.dart';
import '../data/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _openFacebook() async {
    // Si tu trouves l'ID plus tard, remplace "your_fb_page_id" par cet ID
    final fbUriApp = Uri.parse("fb://page/your_fb_page_id");
    final fbWeb = Uri.parse("https://www.facebook.com/RCLucciana");

    if (await canLaunchUrl(fbUriApp)) {
      await launchUrl(fbUriApp, mode: LaunchMode.externalApplication);
    } else {
      await launchUrl(fbWeb, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _openInstagram() async {
    final instaApp = Uri.parse("instagram://user?username=rugby.club.lucciana");
    final instaWeb =
        Uri.parse("https://www.instagram.com/rugby.club.lucciana/");

    if (await canLaunchUrl(instaApp)) {
      await launchUrl(instaApp, mode: LaunchMode.externalApplication);
    } else {
      await launchUrl(instaWeb, mode: LaunchMode.externalApplication);
    }
  }

  MatchItem? _getNextMatch() {
    final now = DateTime.now();
    // Prendre le premier match futur
    try {
      return seasonMatches.firstWhere((m) => m.date.isAfter(now));
    } catch (e) {
      // Si aucun match futur, retourner null
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final nextMatch = _getNextMatch();

    return ClubScaffold(
      selectedIndex: 0,
      title: "RC Lucciana",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo en haut
              Image.asset(
                "assets/images/logo.png",
                height: 120,
              ),
              const SizedBox(height: 20),

              // Bloc Prochain match si existant
              if (nextMatch != null)
                Card(
                  color: Colors.red.shade50,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          "📅 Prochain match",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${nextMatch.opponentHome} vs ${nextMatch.opponentAway}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${nextMatch.date.day}/${nextMatch.date.month}/${nextMatch.date.year} ‒ ${nextMatch.date.hour}h${nextMatch.date.minute.toString().padLeft(2, '0')}",
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black54),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          nextMatch.isHome ? "🏠 Domicile" : "🚗 Extérieur",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                )
              else
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Aucun match à venir",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),

              const SizedBox(height: 20),

              // Boutons réseaux sociaux
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.facebook,
                        color: Colors.blue, size: 40),
                    onPressed: _openFacebook,
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.camera_alt,
                        color: Colors.purple, size: 40),
                    onPressed: _openInstagram,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
