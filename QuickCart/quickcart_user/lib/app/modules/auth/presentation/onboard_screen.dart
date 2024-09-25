import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/auth/presentation/views/onboard_mobile_view.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: OnboardMobileScreen(),
      tabletView: OnboardMobileScreen(),
    );
  }
}
