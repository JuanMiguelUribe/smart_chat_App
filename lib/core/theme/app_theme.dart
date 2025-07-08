import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF1E1E2C);

const List<Color> _colorThemes = [
  _customColor, // Tu color principal personalizado
  Color(0xFF4ECCA3), // Verde menta elegante
  Color(0xFF6C63FF), // Azul-violeta vibrante
  Color(0xFFFFC93C), // Amarillo cálido tipo mostaza
  Color(0xFFFC5185), // Rosado fuerte para destacar
  Color(0xFF3A86FF), // Azul puro brillante
  Color(0xFF8338EC), // Morado llamativo
  Color(0xFFFF6B6B), // Rojo coral bonito
  Color(0xFF00B8A9), // Turquesa fresco
  Color(0xFF8D99AE), // Gris azulado elegante
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 3})
    : assert(
        selectedColor >= 0 && selectedColor <= _colorThemes.length -1,
        "Colors must be between 0 and ${_colorThemes.length - 1}",
      );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
