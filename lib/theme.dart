import 'package:flutter/material.dart';

class AppColors {
  // ==============================
  // GLOBAL BACKGROUNDS (PRO / TECH)
  // ==============================
  static const Color scaffold = Color(0xFF0F2027); // dark tech background
  static const Color surface = Color(0xFF203A43);
  static const Color surfaceAlt = Color(0xFF2C5364);

  // ==============================
  // PRIMARY BRAND COLORS
  // ==============================
  static const Color primary = Color(0xFF00E5A0); // green tech accent
  static const Color secondary = Color(0xFF00B4D8); // blue tech
  static const Color white = Colors.white;

  // ==============================
  // SECTIONS (DARK VERSION)
  // ==============================
  static const Color hero = Color(0xFF0F2027);
  static const Color services = Color(0xFF16222A);
  static const Color projects = Color(0xFF1B2A41);
  static const Color about = Color(0xFF1E2D3A);
  static const Color contact = Color(0xFF203A43);
  static const Color footer = Color(0xFF0B1C23);

  // ==============================
  // CARD COLORS (FLYER STYLE)
  // ==============================
  static const Color cardBackground = Color.fromRGBO(0, 0, 0, 0.6);

  static const List<Color> cardAccents = [
    Color(0xFF00E5A0), // green
    Color(0xFF00B4D8), // blue
    Color(0xFF90DBF4), // light blue
    Color(0xFF72EFDD), // aqua
  ];

  // ==============================
  // GRADIENTS
  // ==============================
  static const LinearGradient mainGradient = LinearGradient(
    colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
