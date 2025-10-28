import 'package:flutter/material.dart';
import 'package:news_app/config/theme/theme_manager.dart';
import 'package:news_app/core/routes_manager/routes_manager.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesManager.splash,
      routes: RoutesManager.routes,
      theme: ThemeManager.dark,
      darkTheme: ThemeManager.dark,
      themeMode: ThemeMode.light,
      locale: Locale("en"),
    );
  }
}