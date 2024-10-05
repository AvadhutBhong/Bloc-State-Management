import 'package:flutter/material.dart';

class ThemeState {
  final ThemeData themeData;

  ThemeState({required this.themeData});
}

abstract class ThemeEvent {}

class ToggleThemeEvent extends ThemeEvent {}
