import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String url =
      "https://ganou33.github.io/rugby_club_app_lucciana/data.json";

  static Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          "Erreur de chargement des données (${response.statusCode})");
    }
  }
}
