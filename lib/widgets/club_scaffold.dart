import 'package:flutter/material.dart';
import 'bottom_nav.dart';

class ClubScaffold extends StatelessWidget {
  final int selectedIndex;
  final String title;
  final Widget body;
  final PreferredSizeWidget? bottom; // pour injecter un TabBar

  const ClubScaffold({
    super.key,
    required this.selectedIndex,
    required this.title,
    required this.body,
    this.bottom,
  });

  static const List<String> _routes = [
    '/', // 0 = Accueil
    '/news', // 1
    '/calendar', // 2
    '/school', // 3
    '/sponsors', // 4
    '/boutique', // 5 👈 ajout de la boutique
    '/contact', // 6
  ];

  void _onNavTapped(BuildContext context, int index) {
    if (index != selectedIndex) {
      Navigator.pushReplacementNamed(context, _routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true, bottom: bottom),
      body: body,
      bottomNavigationBar: BottomNav(
        currentIndex: selectedIndex,
        onTap: (index) => _onNavTapped(context, index),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onNavTapped(context, 0), // Accueil
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        child: Image.asset(
          'assets/images/logo.png',
          width: 42,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
