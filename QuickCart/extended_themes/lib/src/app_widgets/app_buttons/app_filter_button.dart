part of app_buttons;

class AppFilterButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AppFilterButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      padding: const AppEdgeInsets.only(
          top: AppGapSize.paddingMedium, left: AppGapSize.paddingMedium, right: AppGapSize.paddingMedium),
      child: SizedBox(
          width: 45,
          height: 45,
          child: ElevatedButton(
            onPressed: () => onPressed?.call(),
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: MaterialStateProperty.all(ThemeColors.backgroundIconColor()),
              padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
              ),
            ),
            child: const AppIcons.filter(),
          )),
    );
  }
}