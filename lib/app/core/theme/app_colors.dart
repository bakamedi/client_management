import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._();

  static Color get primary => _primary;

  static Color get secondary => _secondary;

  static Color get transparent => _transparent;

  static Color get white => _white;

  /// GETS
  static Color get error50 => _error50;

  static final Color _primary = _HexColor('#5DB6B2');

  static final Color _secondary = _HexColor('#EE825A');

  static const Color _transparent = Colors.transparent;

  static final Color _white = _HexColor('#FFFFFE');

  /// Grey
  static Color get grey100 => _grey100;
  static Color get grey200 => _grey200;
  static Color get grey300 => _grey300;
  static Color get grey400 => _grey400;
  static Color get grey500 => _grey500;
  static Color get grey800 => _grey800;

  static final Color _grey100 = _HexColor('#F2F4F3');
  static final Color _grey200 = _HexColor('#F2F4F3');
  static final Color _grey300 = _HexColor('#BEC0C0');
  static final Color _grey400 = _HexColor('#636669');
  static final Color _grey500 = _HexColor('#818E8F');
  static final Color _grey800 = _HexColor('#1D4961');

  /// Black
  static final Color black100 = _HexColor('#0C1519');

  // Error
  static final Color _error50 = _HexColor("#FFF1F0");

  static getPrimaryColor(Brightness brightness) {
    return brightness == Brightness.light ? _primary : Colors.black;
  }

  static MaterialColor generateMaterialColor(bool isDarkMode) {
    final Color primaryColor = isDarkMode ? Colors.black : _primary;
    List<double> strengths = <double>[.05];
    final Map<int, Color> swatch = {};
    final int r = primaryColor.red,
        g = primaryColor.green,
        b = primaryColor.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(primaryColor.value, swatch);
  }
}

class _HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  _HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
