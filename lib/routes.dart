import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/news_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/school_screen.dart';
import 'screens/sponsors_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomeScreen(),
  '/news': (context) => const NewsScreen(),
  '/calendar': (context) => const CalendarScreen(),
  '/school': (context) => const SchoolScreen(),
  '/sponsors': (context) => const SponsorsScreen(),
};
