import 'dart:convert';
import 'package:http/http.dart' as http;

class LigueCorseApiService {
  static const String baseUrl =
      "https://api.liguecorse.ffr.fr/wp-json/ffr/v1/posts";

  static Future<List<Map<String, dynamic>>> fetchNews({
    int page = 1,
    int perPage = 10,
  }) async {
    final response = await http.get(
      Uri.parse("$baseUrl?page=$page&per_page=$perPage"),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      return jsonData.map<Map<String, dynamic>>((item) {
        final media = item["featured_media"];
        String imageUrl = "";

        // Vérifie si c’est bien un objet JSON avec un champ "src"
        if (media is Map && media.containsKey("src")) {
          imageUrl = media["src"];
        }

        return {
          "title": item["title"]["rendered"] ?? "",
          "date": item["date"] ?? "",
          "excerpt": item["excerpt"]?["rendered"] ?? "",
          "image": imageUrl,
          "link": "https://liguecorse.ffr.fr${item["link"] ?? ""}",
        };
      }).toList();
    } else {
      throw Exception("Erreur API: ${response.statusCode}");
    }
  }
}
