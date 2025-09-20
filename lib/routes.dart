// lib/routes.dart
import 'package:flutter/material.dart';

// Import de toutes les pages
import 'screens/home_screen.dart';
import 'screens/news_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/school_screen.dart';
import 'screens/sponsors_screen.dart';
import 'screens/boutique_screen.dart';
import 'screens/contact_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeScreen(),
  '/news': (context) => const NewsScreen(),
  '/calendar': (context) => const CalendarScreen(),
  '/school': (context) => const SchoolScreen(),
  '/sponsors': (context) => const SponsorsScreen(),
  '/boutique': (context) => BoutiqueScreen(),
  '/contact': (context) => const ContactScreen()
};
