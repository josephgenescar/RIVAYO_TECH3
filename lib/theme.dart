import 'package:flutter/material.dart';

class RivayoTheme {
  // Koulè Flyers Rivayo Tech la
  static const Color tealRivayo = Color(0xFF00B4AD);
  static const Color bleFonse = Color(0xFF002B36);
  static const Color nwaRivayo = Color(0xFF0B0D0E);

  static BoxDecoration get rivayoGradient {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [tealRivayo, bleFonse, nwaRivayo],
        stops: [0.0, 0.4, 0.9],
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: tealRivayo,
      scaffoldBackgroundColor: Colors.transparent, // Pou gradyan an ka parèt
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(color: Colors.white70),
      ),
    );
  }
}
