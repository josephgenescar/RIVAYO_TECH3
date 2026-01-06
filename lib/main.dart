import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/services.dart';
import 'pages/projects.dart';
import 'pages/about.dart';
import 'pages/contact.dart';
import 'dart:ui_web' as ui; // Import enpòtan pou Web
import 'dart:html' as html; // Import enpòtan pou HTML

void main() {
  ui.platformViewRegistry.registerViewFactory(
    'adsense-view',
    (int viewId) => html.IFrameElement()
      ..style.width = '100%'
      ..style.height = '100%'
      ..src = 'assets/adsense_block.html'
      ..style.border = 'none',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final seed = const Color(0xFF1565C0);
    return MaterialApp(
      title: 'RIVAYO_TECH',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seed,
          primary: seed,
          secondary: const Color(0xFF2E7D32),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/services': (context) => const ServicesPage(),
        '/projects': (context) => const ProjectsPage(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}
