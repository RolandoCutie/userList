import 'package:flutter/material.dart';

class AppColors {
  static Color primary([double? opacity]) {
    const color = Color(0xFF002A4E);
    return opacity == null ? color : color.withOpacity(opacity);
  }

  static Color secondary([double? opacity]) {
    const color = Color(0xFF4698CB);
    return opacity == null ? color : color.withOpacity(opacity);
  }

  static Color tertiary() {
    return const Color(0xFFFDB714);
  }

  static Color white() {
    return Colors.white;
  }

  static Color error() => _errorWarningDangerColor;

  static Color errorOpacity() => _errorWithOpacityColor;

  static Color success() => _successColor;

  static Color successOpacity() => _successOpacityColor;

  static Color darkGrey() => _darkGrey;

  static Color blueNavy() => _blueNavy;

  static Color blue() => _blue;

  static const _errorWarningDangerColor = Color(0xFFB60000);
  static const _errorWithOpacityColor = Color(0xFFFFBDBD);
  static const _successColor = Color(0xFF007918);
  static const _successOpacityColor = Color(0xFFBAFFC8);
  static const _darkGrey = Color(0xFF444444);
  static const _blueNavy = Color(0xFF002A4E);
  static const _blue = Color(0xFF104F6D);
}
