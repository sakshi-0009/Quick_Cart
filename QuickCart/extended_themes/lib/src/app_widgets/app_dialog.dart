part of app_widget;

enum AppDialogType { error, success, warning, info }

class AppDialog extends StatelessWidget {
  final String title;
  final String? message;
  final Widget? child;
  final String? leftBtnText;
  final String? rightBtnText;
  final VoidCallback? leftBtnOnPressed;
  final VoidCallback? rightBtnOnPressed;
  final Animation<double> animation;

  const AppDialog(
      {super.key,
        required this.title,
        this.message,
        this.child,
        this.rightBtnText = 'OK',
        this.rightBtnOnPressed,
        this.leftBtnOnPressed,
        this.leftBtnText,
        required this.animation})
      : assert(message != null || child != null,
  'message or child must not be null');

  const AppDialog.error(
      {super.key,
        required this.title,
        required this.message,
        this.rightBtnText = 'OK',
        this.rightBtnOnPressed,
        required this.animation})
      : leftBtnText = null,
        child = null,
        leftBtnOnPressed = null;

  const AppDialog.success(
      {super.key,
        required this.title,
        required this.message,
        this.rightBtnText,
        this.rightBtnOnPressed,
        required this.animation})
      : leftBtnText = null,
        child = null,
        leftBtnOnPressed = null;

  const AppDialog.warning(
      {super.key,
        required this.title,
        required this.message,
        this.leftBtnText,
        this.rightBtnText,
        this.leftBtnOnPressed,
        this.rightBtnOnPressed,
        required this.animation})
      : child = null;

  const AppDialog.info(
      {super.key,
        required this.title,
        required this.message,
        this.leftBtnText,
        this.rightBtnText,
        this.leftBtnOnPressed,
        this.rightBtnOnPressed,
        required this.animation})
      : child = null;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colorScheme.background,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: colorScheme.primary.withOpacity(0.4),
                    blurRadius: 4,
                    offset: const Offset(0, 2)),
                BoxShadow(
                    color: colorScheme.primary.withOpacity(0.4),
                    blurRadius: 4,
                    offset: const Offset(2, 0))
              ],
            ),
            child: AppSizeScale(
              ratioWidth: 0.75,
              child: AppPadding.medium(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppPadding.small(
                        child: AppText.titleMedium(
                            text: title,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.textRedColor)),
                    AppPadding(
                        padding: const AppEdgeInsets.symmetric(
                            horizontal: AppGapSize.small,
                            vertical: AppGapSize.medium),
                        child: child ?? AppText.bodyMedium(text: message!)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _txtBtn(
                            text: leftBtnText,
                            onPressed: leftBtnOnPressed,
                            backgroundColor:
                            ThemeColors.textRedColor.withOpacity(0.4)),
                        const SizedBox(width: 16),
                        _txtBtn(
                            text: rightBtnText,
                            onPressed: rightBtnOnPressed,
                            backgroundColor:
                            colorScheme.primary.withOpacity(0.4)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _txtBtn(
      {String? text, VoidCallback? onPressed, required Color backgroundColor}) {
    if (onPressed == null || text == null) return const SizedBox.shrink();
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      onPressed: onPressed,
      child: AppText.bodySmall(text: text),
    );
  }
}