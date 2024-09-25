import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/tabs/presentation/views/drawer_mobile_view/drawer_mobile_view.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: const DrawerMobileView(),
      tabletView: const DrawerMobileView(),
    );
  }
}
