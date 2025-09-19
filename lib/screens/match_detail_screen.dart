import 'package:flutter/material.dart';
import '../data/models.dart';

class MatchDetailScreen extends StatelessWidget {
  final MatchItem match;

  const MatchDetailScreen({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(match.competition)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${match.opponentHome} vs ${match.opponentAway}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              "Date : ${match.date.day}/${match.date.month}/${match.date.year} à ${match.date.hour}h${match.date.minute.toString().padLeft(2, '0')}",
            ),
            const SizedBox(height: 8),
            Text("Lieu : ${match.location}"),
            const SizedBox(height: 8),
            if (match.score != null)
              Text("Score final : ${match.score!}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
