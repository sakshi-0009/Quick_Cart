import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/profile/presentation/view/profile_mobile_view/profile_mobile_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: ProfileMobileView(),
      tabletView: ProfileMobileView(),
    );
  }
}
