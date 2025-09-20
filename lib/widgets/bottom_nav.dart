import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // largeur réservée pour le FAB central
    const centerGap = 80.0; // 56 (FAB) + marges

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        children: [
          // Groupe gauche (3 icônes)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _item(Icons.article, 1),
                _item(Icons.event, 2),
                _item(Icons.school, 3),
              ],
            ),
          ),
          const SizedBox(width: centerGap), // espace pour le FAB
          // Groupe droit (3 icônes)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _item(Icons.handshake, 4),
                _item(Icons.shopping_bag, 5),
                _item(Icons.contact_mail, 6),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(IconData icon, int idx) {
    return IconButton(
      icon: Icon(icon),
      color: currentIndex == idx ? Colors.red : Colors.grey,
      onPressed: () => onTap(idx),
      tooltip: '$idx',
    );
  }
}
