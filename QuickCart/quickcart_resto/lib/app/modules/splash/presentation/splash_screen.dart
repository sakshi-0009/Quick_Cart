import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/splash/presentation/view/splash_screen_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => const AppViewLayout(
        mobileView: SplashView(),
        tabletView: SplashView(),
      );
}
