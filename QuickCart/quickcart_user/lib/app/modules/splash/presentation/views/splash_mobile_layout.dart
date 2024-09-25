import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/splash_controller.dart';


class SplashMobileLayout extends StatelessWidget {
  const SplashMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => AppScaffoldBackgroundImage.splash(
          body: Center(child: AppImages.logo())),
    );
  }
}
