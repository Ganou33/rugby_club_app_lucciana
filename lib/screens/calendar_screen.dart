import 'package:flutter/material.dart';
import '../data/calendar_senior1.dart';
import '../data/calendar_reserve.dart';
import '../data/models.dart';
import '../widgets/club_scaffold.dart';
import 'match_detail_screen.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Séniors 1, Réserve, U18, U16
      child: ClubScaffold(
        selectedIndex: 2,
        title: "Calendrier",
        bottom: const TabBar(
          isScrollable: true,
          tabs: [
            Tab(text: "Séniors 1"),
            Tab(text: "Réserve"),
            Tab(text: "U18"),
            Tab(text: "U16"),
          ],
        ),
        body: TabBarView(
          // ⚠️ PAS de 'const' ici
          children: [
            _CalendarTab(matches: seasonMatches), // Séniors 1
            _CalendarTab(matches: reserveMatches), // Réserve
            const Center(child: Text("Calendrier U18 à ajouter")),
            const Center(child: Text("Calendrier U16 à ajouter")),
          ],
        ),
      ),
    );
  }
}

class _CalendarTab extends StatelessWidget {
  final List<MatchItem> matches;
  const _CalendarTab({required this.matches});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (context, index) {
        final match = matches[index];
        final bool isPast = match.date.isBefore(now);

        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: const Icon(Icons.sports_rugby, color: Colors.red),
            title: Text("${match.opponentHome} vs ${match.opponentAway}"),
            subtitle: Text(
              "${match.competition}\n"
              "${match.date.day}/${match.date.month}/${match.date.year} "
              "à ${match.date.hour}h${match.date.minute.toString().padLeft(2, '0')} "
              "${match.isHome ? "🏠 Domicile" : "🚗 Extérieur"}",
            ),
            trailing: isPast && match.score != null
                ? Text(
                    match.score!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                : null,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MatchDetailScreen(match: match),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
