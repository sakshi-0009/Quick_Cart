part of app_widget;

class AppText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final TextStyle _textStyle;
  final TextOverflow? overflow;

  const AppText.displayLarge({super.key,
    required this.text,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow})
      : _textStyle = ThemeText.displayLarge;

  const AppText.displayMedium({super.key,
    required this.text,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow})
      : _textStyle = ThemeText.displayMedium;

  const AppText.displaySmall({super.key,
    required this.text,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow})
      : _textStyle = ThemeText.displaySmall;

  const AppText.headlineLarge({super.key,
    required this.text,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow})
      : _textStyle = ThemeText.headlineLarge;

  const AppText.headlineMedium({super.key,
    required this.text,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow})
      : _textStyle = ThemeText.headlineMedium;

  const AppText.headlineSmall({super.key,
    required this.text,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow})
      : _textStyle = ThemeText.headlineSmall;

  const AppText.bodyLarge({super.key,
    required this.text,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow})
      : _textStyle = ThemeText.bodyLarge;

  const AppText.bodyMedium({super.key,
    required this.text,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow})
      : _textStyle = ThemeText.bodyMedium;

  const AppText.bodySmall({super.key,
    required this.text,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow})
      : _textStyle = ThemeText.bodySmall;

  const AppText.titleLarge({super.key,
    required this.text,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow})
      : _textStyle = ThemeText.titleLarge;

  const AppText.titleMedium({super.key,
    required this.text,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow})
      : _textStyle = ThemeText.titleMedium;

  const AppText.titleSmall({super.key,
    required this.text,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow})
      : _textStyle = ThemeText.titleSmall;

  const AppText.labelLarge({super.key,
    required this.text,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow})
      : _textStyle = ThemeText.labelLarge;

  const AppText.labelMedium({super.key,
    required this.text,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow})
      : _textStyle = ThemeText.labelMedium;

  const AppText.labelSmall({super.key,
    required this.text,
    this.textAlign,
    this.fontWeight,
    this.color,
    this.maxLines,
    this.overflow})
      : _textStyle = ThemeText.labelSmall;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;
    return Text(text,
        textAlign: textAlign ?? TextAlign.center,
        overflow: overflow,
        maxLines: maxLines,
        style: _textStyle.copyWith(
            fontWeight: fontWeight,
            color: color ?? textTheme.bodySmall!.color));
  }
}