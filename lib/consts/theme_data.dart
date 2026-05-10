import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    final backgroundColor =
        isDarkTheme ? const Color(0xFF00001a) : const Color(0xFFFFFFFF);
    final cardColor = isDarkTheme ? const Color(0xFF0a0d2c) : Colors.grey[50];

    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: Colors.blue,
      colorScheme: ThemeData().colorScheme.copyWith(
        secondary:
            isDarkTheme ? const Color(0xFF1a1f3c) : const Color(0xFFE8FDFD),
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      cardColor: cardColor,
      drawerTheme: DrawerThemeData(backgroundColor: backgroundColor),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme:
            isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light(),
      ),
    );
  }
}
