import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // ✅ nécessite intl dans pubspec.yaml
import '../widgets/club_scaffold.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageAsset;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageAsset,
  });
}

class BoutiqueScreen extends StatelessWidget {
  static const routeName = '/boutique';

  BoutiqueScreen({super.key});

  final List<Product> _products = [
    Product(
      id: 'p1',
      title: 'Polo RC Lucciana',
      description: 'Polo officiel du club',
      price: 29.99,
      imageAsset: 'assets/images/polo.png',
    ),
    Product(
      id: 'p2',
      title: 'Short RC Lucciana',
      description: 'Short officiel (taille S à XXL)',
      price: 19.99,
      imageAsset: 'assets/images/short.png',
    ),
    Product(
      id: 'p3',
      title: 'Maillot RC Lucciana',
      description: 'Maillot officiel domicile',
      price: 39.99,
      imageAsset: 'assets/images/maillot.png',
    ),
    Product(
      id: 'p4',
      title: 'Casquette RC Lucciana',
      description: 'Casquette brodée en coton',
      price: 14.99,
      imageAsset: 'assets/images/casquette.png',
    ),
  ];

  String _formatPrice(BuildContext context, double price) {
    final format = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    return format.format(price);
  }

  void _showComingSoon(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Boutique'),
        content: const Text(
            'Boutique en ligne à venir 🚧\nMerci pour ta patience !'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return ClubScaffold(
      selectedIndex: 5,
      title: "Boutique",
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Version alpha — 4 articles de démonstration',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: _products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.70,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (ctx, i) {
                  final p = _products[i];
                  return _ProductCard(
                    product: p,
                    priceLabel: _formatPrice(context, p.price),
                    onTap: () => _showComingSoon(context),
                    isDark: isDark,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  final String priceLabel;
  final VoidCallback onTap;
  final bool isDark;

  const _ProductCard({
    required this.product,
    required this.priceLabel,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = isDark ? Colors.grey[850] : Colors.white;

    return Material(
      color: cardColor,
      borderRadius: BorderRadius.circular(12),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image locale
            AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  product.imageAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Infos
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        priceLabel,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(80, 34)),
                        child: const Text('Voir'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
