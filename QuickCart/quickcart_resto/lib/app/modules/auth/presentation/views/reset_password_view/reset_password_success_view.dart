import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_resto/app/modules/auth/controller/forget_password_controller.dart';

class SuccessNotificationMobileView extends GetView<ForgotPassWordController> {
  const SuccessNotificationMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      body: AppSizeScale(
        ratioWidth: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppIcons.success(),
                  AppPadding.regular(
                    child: AppText.headlineLarge(
                      text: 'ResetPassword_Send_Success'.tr,
                      color: ThemeColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AppText.titleLarge(
                    text: 'ResetPassword_Send_Success_Detail'.tr,
                  ),
                ],
              ),
            ),
            AppPadding.regular(child: AppButton.max(title: 'Back', onPressed: controller.onPressedBackSuccess)),
          ],
        ),
      ),
    );
  }
}