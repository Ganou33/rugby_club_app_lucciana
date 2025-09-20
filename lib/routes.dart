// lib/routes.dart
import 'package:flutter/material.dart';

// Import des pages principales
import 'screens/home_screen.dart';
import 'screens/news_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/school/school_screen.dart';
import 'screens/sponsors_screen.dart';
import 'screens/boutique_screen.dart';
import 'screens/contact_screen.dart';

// Import des catégories
import 'screens/school/baby_screen.dart';
import 'screens/school/u6_screen.dart';
import 'screens/school/u8_screen.dart';
import 'screens/school/u10_screen.dart';
import 'screens/school/u12_screen.dart';
import 'screens/school/u14_screen.dart';

// Import des pages événements par catégorie
import 'screens/school/events/baby_events_screen.dart';
import 'screens/school/events/u6_events_screen.dart';
import 'screens/school/events/u8_events_screen.dart';
import 'screens/school/events/u10_events_screen.dart';
import 'screens/school/events/u12_events_screen.dart';
import 'screens/school/events/u14_events_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  // Pages principales
  '/': (context) => const HomeScreen(),
  '/news': (context) => const NewsScreen(),
  '/calendar': (context) => const CalendarScreen(),
  '/school': (context) => const SchoolScreen(),
  '/sponsors': (context) => const SponsorsScreen(),
  '/boutique': (context) => BoutiqueScreen(),
  '/contact': (context) => const ContactScreen(),

  // Catégories
  '/school/baby': (context) => const BabyScreen(),
  '/school/u6': (context) => const U6Screen(),
  '/school/u8': (context) => const U8Screen(),
  '/school/u10': (context) => const U10Screen(),
  '/school/u12': (context) => const U12Screen(),
  '/school/u14': (context) => const U14Screen(),

  // Pages événements
  '/school/baby/events': (context) => const BabyEventsScreen(),
  '/school/u6/events': (context) => const U6EventsScreen(),
  '/school/u8/events': (context) => const U8EventsScreen(),
  '/school/u10/events': (context) => const U10EventsScreen(),
  '/school/u12/events': (context) => const U12EventsScreen(),
  '/school/u14/events': (context) => const U14EventsScreen(),
};
