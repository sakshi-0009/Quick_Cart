import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/tabs/presentation/view/drawer_mobile_view/admin_drawer_mobile_view.dart';

class AdminDrawerWidget extends StatelessWidget {
  const AdminDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: AdminDrawerMobileView(),
      tabletView: AdminDrawerMobileView(),
    );
  }
}
