import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/tabs/presentation/view/admin_tab_mobile_view.dart';

class AdminTabsScreen extends StatelessWidget {
  const AdminTabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: AdminTabsMobileView(),
      tabletView: AdminTabsMobileView(),
    );
  }
}
