import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../../../controllers/forgot_password_controller.dart';
import 'reset_password_box_email.dart';

class ResetPasswordMobileView extends GetView<ForgotPassWordController> {
  const ResetPasswordMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget:
          CustomAppBar.back(title: 'ResetPassword_Title'.tr),
      // wrapBodyWithSafeArea: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppPadding.medium(
            child: AppText.bodyMedium(
                text: 'ResetPassword_Description'.tr,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start),
          ),
          AppPadding.medium(child: ResetPasswordBoxEmail()),
          AppPadding.regular(
            child: AppButton.max(
                title: 'ResetPassword_Send_Button'.tr,
                onPressed: controller.onPressedSend),
          ),
        ],
      ),
    );
  }
}
