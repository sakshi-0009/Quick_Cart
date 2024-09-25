import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/splash/presentation/views/splash_mobile_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => AppViewLayout(
        mobileView: SplashMobileLayout(),
        tabletView: SplashMobileLayout(),
      );
}
