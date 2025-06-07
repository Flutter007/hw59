import 'package:flutter/material.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.yellow.shade200,
);
final defaultTheme = ThemeData.light(useMaterial3: true);
final lightTheme = defaultTheme.copyWith(
  colorScheme: lightColorScheme,
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: lightColorScheme.primaryContainer,
    foregroundColor: lightColorScheme.onPrimaryContainer,
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: lightColorScheme.surface,
    errorStyle: TextStyle(color: lightColorScheme.error, fontSize: 15),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: lightColorScheme.error, width: 2),
    ),
    labelStyle: TextStyle(color: lightColorScheme.onSurface, fontSize: 15),
    helperStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: lightColorScheme.inverseSurface,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: lightColorScheme.onPrimaryContainer,
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: lightColorScheme.tertiary, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: lightColorScheme.inverseSurface, width: 2),
    ),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(textStyle: TextStyle(fontSize: 18)),
  snackBarTheme: SnackBarThemeData(contentTextStyle: TextStyle(fontSize: 18)),
  scaffoldBackgroundColor: lightColorScheme.inversePrimary,
  cardTheme: CardTheme().copyWith(color: lightColorScheme.surface),
);
