part of app_widget;

class AppButton extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final void Function()? onPressed;
  final String title;
  final double _ratio;
  final double? borderRadius;

  const AppButton.min(
      {super.key,
        required this.title,
        this.padding,
        this.margin,
        this.onPressed})
      : _ratio = 0.45,
        borderRadius = 16;

  const AppButton.max({
    super.key,
    required this.title,
    this.padding,
    this.margin,
    this.onPressed,
  })  : _ratio = 1,
        borderRadius = 16;

  const AppButton.customize({
    super.key,
    required this.title,
    this.padding,
    this.margin,
    this.onPressed,
    this.borderRadius,
  }) : _ratio = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * _ratio;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: width,
      height: 64,
      margin: margin,
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: ThemeColors.gradientButtonColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 16)),
        child: ElevatedButton(
          onPressed: onPressed,
          child: FittedBox(
              child: Text(title,
                  style: ThemeText.bodyLarge
                      .copyWith(fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }
}