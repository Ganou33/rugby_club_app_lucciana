import 'package:flutter/material.dart';
import 'routes.dart';

class RugbyClubApp extends StatelessWidget {
  const RugbyClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RC Lucciana',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
