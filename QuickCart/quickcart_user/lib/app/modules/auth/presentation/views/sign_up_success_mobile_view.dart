import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/routes.dart';

class SignupSuccessMobileView extends StatelessWidget {
  const SignupSuccessMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 4)).then((value) {
    //   Get.offAllNamed(AppRouteProvider.tabScreen);
    // });
    return AppScaffoldBackgroundImage.pattern(
      body: AppSizeScale(
        ratioWidth: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: AppPadding.medium(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                  AppIcons.success(),
                  AppPadding.regular(
                      child: AppText.headlineLarge(
                          text: 'Congrats_Title'.tr,
                          color: ThemeColors.primaryColor,
                          fontWeight: FontWeight.bold)),
                  AppText.titleLarge(text: 'CongratsScreen_Description'.tr)
                ]))),
            SafeArea(
              child: AppPadding.regular(
                  child: AppButton.max(
                      title: 'Next_Button'.tr,
                      onPressed: () =>
                          Get.offAllNamed(AppRouteProvider.tabScreen))),
            )
          ],
        ),
      ),
    );
  }
}
