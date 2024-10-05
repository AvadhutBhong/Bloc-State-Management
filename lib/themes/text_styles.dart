import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Abel',
    color: Colors.white, // Ensure button text is always white for visibility
  );
}
