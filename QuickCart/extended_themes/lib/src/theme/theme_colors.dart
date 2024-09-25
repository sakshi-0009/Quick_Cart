part of theme;

class ThemeColors {
  ///Colors
  static const primaryColor = Color(0xFF53E88B);
  static const backgroundColor = Color(0xFFF5F7FE);
  static const backgroundDarkColor = Color(0xFF0D0D0D);
  static const backgroundColor2 = Color(0xFFF7F8FE);

  static const menuLightColor = Color(0xFFE5E5E5);

  static const textLightColor = Color(0xFF09051C);
  static const textDarkColor = Color(0xFFFFFFFF);
  static const textRedColor = Color(0xFFE74C3C);
  static const orangeColor = Color(0xFFDA6317);
  static  backgroundIconColor() => const Color(0xFFF9A84D).withOpacity(0.1);

  static const labelColor = Color(0xFF3B3B3B);
  static const labelDarkColor = Color(0xFF666666);
  static const textPriceColor = Color(0xFFFEAD1D);

  static const hintColorLight = Color(0xFF3B3B3B);
  static const hintColorDark = Color(0xFFFFFFFF);

  static backgroundTextFormDark() => backgroundColor.withOpacity(0.1);
  static const backgroundTextFormLight = Color(0xFFFFFFFF);

  static const borderColorLight = Color(0xFFF4F4F4);
  static const borderColorDark = Colors.transparent;

  static shadowLightColor() => const Color(0xFF5A6CEA).withOpacity(0.07);

  static const shadowLayer1Color = Color(0xFF7F67BE);
  static Color shadowLayer1ColorDark() => _convertLightColorToDarkColor(shadowLayer1Color);
  static const shadowLayer2Color = Color(0xFFFFD8E4);
  static Color shadowLayer2ColorDark() => _convertLightColorToDarkColor(shadowLayer2Color);

  static const gradientButtonColor = LinearGradient(
      begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFF53E88B), Color(0xFF15BE77)]);


  static Color _convertLightColorToDarkColor(Color color) {
    final hsl = HSLColor.fromColor(color);
    final darkHsl = hsl.withLightness((hsl.lightness - 0.4).clamp(0.0, 1.0));
    return darkHsl.toColor();
  }
}