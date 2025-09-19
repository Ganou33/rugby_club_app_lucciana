import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class ScraperService {
  static Future<List<Map<String, String>>> fetchNews() async {
    final url = Uri.parse("https://liguecorse.ffr.fr/actualites");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Erreur lors du chargement des actualités");
    }

    final document = parser.parse(response.body);
    final articles = document.querySelectorAll('article');

    List<Map<String, String>> news = [];

    for (var article in articles) {
      final titleElement = article.querySelector('h2 a');
      final link = titleElement?.attributes['href'] ?? '';
      final title = titleElement?.text.trim() ?? 'Sans titre';

      final dateElement = article.querySelector('time, .date');
      final date = dateElement?.text.trim() ?? '';

      final imgElement = article.querySelector('img');
      final imageUrl = imgElement?.attributes['src'] ?? '';

      final excerptElement = article.querySelector('p');
      final excerpt = excerptElement?.text.trim() ?? '';

      news.add({
        "title": title,
        "link":
            link.startsWith('http') ? link : "https://liguecorse.ffr.fr$link",
        "date": date,
        "image": imageUrl.startsWith('http')
            ? imageUrl
            : (imageUrl.isNotEmpty ? "https://liguecorse.ffr.fr$imageUrl" : ""),
        "excerpt": excerpt,
      });
    }

    return news;
  }
}
