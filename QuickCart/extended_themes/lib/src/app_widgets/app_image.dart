part of app_widget;

class AppImages extends StatelessWidget {
  final String _urlDark;
  final String _urlLight;

  const AppImages.logo({super.key})
      : _urlDark = AppImageAssets.logoDark,
        _urlLight = AppImageAssets.logoLight;

  const AppImages.background({super.key})
      : _urlDark = AppImageAssets.backgroundSplash,
        _urlLight = AppImageAssets.backgroundSplash;

  const AppImages.onboardBanner1({super.key})
      : _urlDark = AppImageAssets.onboardBanner1,
        _urlLight = AppImageAssets.onboardBanner1;

  const AppImages.onboardBanner2({super.key})
      : _urlDark = AppImageAssets.onboardBanner2,
        _urlLight = AppImageAssets.onboardBanner2;

  const AppImages.backgroundPattern({super.key})
      : _urlDark = AppImageAssets.backgroundPattern,
        _urlLight = AppImageAssets.backgroundPattern;


  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Image.asset(isDark ? _urlDark : _urlLight, package: 'extended_themes');
  }
}