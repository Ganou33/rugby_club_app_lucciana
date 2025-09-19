import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.article),
            color: currentIndex == 1 ? Colors.red : Colors.grey,
            onPressed: () => onTap(1),
          ),
          IconButton(
            icon: const Icon(Icons.event),
            color: currentIndex == 2 ? Colors.red : Colors.grey,
            onPressed: () => onTap(2),
          ),
          const SizedBox(width: 48), // espace pour le bouton central
          IconButton(
            icon: const Icon(Icons.school),
            color: currentIndex == 3 ? Colors.red : Colors.grey,
            onPressed: () => onTap(3),
          ),
          IconButton(
            icon: const Icon(Icons.handshake),
            color: currentIndex == 4 ? Colors.red : Colors.grey,
            onPressed: () => onTap(4),
          ),
        ],
      ),
    );
  }
}
