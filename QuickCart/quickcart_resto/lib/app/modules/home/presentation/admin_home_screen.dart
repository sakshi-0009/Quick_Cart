import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/home/presentation/view/admin_home_mobile_view.dart';

class AdminHomeScreen extends StatelessWidget {

  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: AdminHomeMobileView(),
      tabletView: AdminHomeMobileView(),
    );
  }
}
