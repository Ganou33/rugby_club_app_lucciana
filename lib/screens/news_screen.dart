import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/liguecorse_api_service.dart';
import '../widgets/club_scaffold.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<Map<String, dynamic>> _news = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final data = await LigueCorseApiService.fetchNews(page: 1, perPage: 10);
      setState(() {
        _news = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      debugPrint("Erreur chargement actualités: $e");
    }
  }

  Future<void> _openWebsite(String url) async {
    final Uri uri = Uri.parse(url);

    try {
      final bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Impossible d’ouvrir $url")),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erreur lors de l’ouverture: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClubScaffold(
      selectedIndex: 1,
      title: "Actualités",
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _news.isEmpty
              ? const Center(child: Text("Aucune actualité disponible"))
              : ListView.builder(
                  itemCount: _news.length,
                  itemBuilder: (context, index) {
                    final news = _news[index];

                    final String title = news["title"] ?? "";
                    final String date = news["date"] ?? "";
                    final String excerpt = (news["excerpt"] ?? "")
                        .replaceAll(RegExp(r"<[^>]*>"), "");
                    final String imageUrl = news["image"] ?? "";
                    final String link = news["link"] ?? "";

                    return GestureDetector(
                      onTap: () => _openWebsite(link),
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (imageUrl.isNotEmpty)
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(6)),
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 180,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.broken_image,
                                          size: 50, color: Colors.grey),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    date,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    excerpt,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
