enum MatchCategory { senior1, reserve, loisir, ecole }

class NewsItem {
  final String title;
  final String content;
  final String date;

  NewsItem({
    required this.title,
    required this.content,
    required this.date,
  });
}

class MatchItem {
  final DateTime date;
  final String competition;
  final String opponentHome;
  final String opponentAway;
  final String location;
  final String? score;
  final MatchCategory category;

  MatchItem({
    required this.date,
    required this.competition,
    required this.opponentHome,
    required this.opponentAway,
    required this.location,
    this.score,
    required this.category,
  });

  bool get isHome => opponentHome == "RC Lucciana";
}

class SponsorItem {
  final String name;
  final String logo;
  final String website;

  SponsorItem({
    required this.name,
    required this.logo,
    required this.website,
  });
}
