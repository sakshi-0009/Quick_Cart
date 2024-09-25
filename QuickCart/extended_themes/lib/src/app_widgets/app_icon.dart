part of app_widget;

class AppIcons extends StatelessWidget {
  final Color? color;
  final String _urlIcon;

  const AppIcons.email({super.key, this.color}) : _urlIcon = AppIconsAssets.email;

  const AppIcons.password({super.key, this.color}) : _urlIcon = AppIconsAssets.password;

  const AppIcons.userProfile({super.key, this.color}) : _urlIcon = AppIconsAssets.userProfile;

  const AppIcons.checkbox({super.key, this.color}) : _urlIcon = AppIconsAssets.checkbox;

  const AppIcons.unCheckbox({super.key, this.color}) : _urlIcon = AppIconsAssets.unCheckbox;

  const AppIcons.google({super.key, this.color}) : _urlIcon = AppIconsAssets.google;

  const AppIcons.gallery({super.key, this.color}) : _urlIcon = AppIconsAssets.gallery;

  const AppIcons.camera({super.key, this.color}) : _urlIcon = AppIconsAssets.camera;

  const AppIcons.yourLocation({super.key, this.color}) : _urlIcon = AppIconsAssets.yourLocation;

  const AppIcons.viaEmail({super.key, this.color}) : _urlIcon = AppIconsAssets.viaEmail;

  const AppIcons.viaSMS({super.key, this.color}) : _urlIcon = AppIconsAssets.viaSMS;

  const AppIcons.menuHome({super.key, this.color}) : _urlIcon = AppIconsAssets.menuHome;

  const AppIcons.menuUser({super.key, this.color}) : _urlIcon = AppIconsAssets.menuUser;

  const AppIcons.menuCart({super.key, this.color}) : _urlIcon = AppIconsAssets.menuCart;

  const AppIcons.menuChat({super.key, this.color}) : _urlIcon = AppIconsAssets.menuChat;

  const AppIcons.notification({super.key, this.color}) : _urlIcon = AppIconsAssets.notification;

  const AppIcons.search({super.key, this.color}) : _urlIcon = AppIconsAssets.search;

  const AppIcons.filter({super.key, this.color}) : _urlIcon = AppIconsAssets.filter;

  const AppIcons.sendMessage({super.key, this.color}) : _urlIcon = AppIconsAssets.sendMessage;

  const AppIcons.volumeOn({super.key, this.color}) : _urlIcon = AppIconsAssets.volumeOn;

  const AppIcons.volumeOff({super.key, this.color}) : _urlIcon = AppIconsAssets.volumeOff;

  const AppIcons.edit({super.key, this.color}) : _urlIcon = AppIconsAssets.edit;

  const AppIcons.locationMap({super.key, this.color}) : _urlIcon = AppIconsAssets.locationMap;

  const AppIcons.heart({super.key, this.color}) : _urlIcon = AppIconsAssets.heart;

  const AppIcons.back({super.key, this.color}) : _urlIcon = AppIconsAssets.back;

  const AppIcons.paypal({super.key, this.color}) : _urlIcon = AppIconsAssets.paypal;

  const AppIcons.visa({super.key, this.color}) : _urlIcon = AppIconsAssets.visa;

  const AppIcons.success({super.key, this.color}) : _urlIcon = AppIconsAssets.successIcon;

  const AppIcons.close({super.key, this.color}) : _urlIcon = AppIconsAssets.close;

  const AppIcons.voucher({super.key, this.color}) : _urlIcon = AppIconsAssets.voucher;

  const AppIcons.star({super.key, this.color}) : _urlIcon = AppIconsAssets.star;

  const AppIcons.halfStar({super.key, this.color}) : _urlIcon = AppIconsAssets.halfStar;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(_urlIcon, package: 'extended_themes', semanticsLabel: 'App Icon');
}