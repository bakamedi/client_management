import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Clase [ThemeAppData] para los colores de la aplicacion
/// Si se desea poner un color directamente de [Colors] se añade aqui
abstract class ThemeAppData {
  ThemeAppData._();

  static ThemeData getTheme(bool darkMode) {
    final baseTheme = ThemeData(
      primarySwatch: AppColors.generateMaterialColor(
        darkMode,
      ),
    );

    if (darkMode) {
      return baseTheme.copyWith(
        brightness: Brightness.dark,
        elevatedButtonTheme: _elevatedButtonThemeData(),
        outlinedButtonTheme: _outlinedButtonThemeData(),
      );
    }

    return baseTheme.copyWith(
        brightness: Brightness.light,
        elevatedButtonTheme: _elevatedButtonThemeData(),
        outlinedButtonTheme: _outlinedButtonThemeData(),
        textButtonTheme: _textFormFieldThemeData(),
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.white,
        ));
  }

  static ElevatedButtonThemeData _elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (Set<WidgetState> states) {
            return TextStyle(
              color: AppColors.white,
            );
          },
        ),
        minimumSize: WidgetStateProperty.resolveWith<Size>(
          (Set<WidgetState> states) {
            return const Size(100, 50);
          },
        ),
        shadowColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            return AppColors.transparent; // Defer to the widget's default.
          },
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.grey400;
            }
            return AppColors.primary; // Use the component's default.
          },
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonThemeData() {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.resolveWith<Size>(
          (Set<WidgetState> states) {
            return const Size(100, 50);
          },
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.grey300.withOpacity(0.8);
            }
            return AppColors.white; // Use the component's default.
          },
        ),
      ),
    );
  }

  static TextButtonThemeData _textFormFieldThemeData() {
    return TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (Set<WidgetState> states) {
            return TextStyle(
              color: AppColors.secondary,
            );
          },
        ),
      ),
    );
  }
}
