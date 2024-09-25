part of app_widget;

class AppViewLayout extends StatelessWidget {
  final Widget? mobileView;
  final Widget? tabletView;
  const AppViewLayout({super.key, this.mobileView, this.tabletView});

  @override
  Widget build(BuildContext context) {
    final deviceType = DeviceHelper.deviceType;

    if (deviceType == DeviceType.mobile) {
      return mobileView ?? const AppErrorWidget(message: 'Layout Mobile Not Found');
    }
    return tabletView ?? const AppErrorWidget(message: 'Layout Tablet Not Found');
  }
}