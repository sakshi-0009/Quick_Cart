import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_resto/app/modules/auth/controller/sign_up_process_controller.dart';

import '../../../../widgets/custom_appbar.dart';

class SignUpProcessMobileScreen extends GetView<SignUpProcessController> {
  const SignUpProcessMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppScaffoldBackgroundImage.pattern(
        isLoading: controller.loading.value,
        appBarWidget: const CustomAppBar.back(),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppPadding.small(),
                    AppPadding(
                      padding: const AppEdgeInsets.symmetric(
                          horizontal: AppGapSize.medium),
                      child: AppText.headlineSmall(
                        textAlign: TextAlign.start,
                        text: 'SignUpProcessScreen_Title'.tr,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppPadding.medium(
                      child: AppText.bodyMedium(
                          textAlign: TextAlign.start,
                          text: 'SignUpProcessScreen_Description'.tr,
                          fontWeight: FontWeight.w400),
                    ),
                    AppPadding(
                      padding: const AppEdgeInsets.symmetric(
                          horizontal: AppGapSize.medium,
                          vertical: AppGapSize.small),
                      child: AppTextFormField(
                        controller: controller.firstNameController,
                        errorText: controller.firstNameError.value,
                        hintText: 'SignUpProcessScreen_RestoName'.tr,
                      ),
                    ),
                    AppPadding(
                      padding: const AppEdgeInsets.symmetric(
                          horizontal: AppGapSize.medium,
                          vertical: AppGapSize.small),
                      child: AppTextFormField.phone(
                        controller: controller.phoneController,
                        errorText: controller.phoneError.value,
                        hintText: 'SignUpProcessScreen_MobileNumber'.tr,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: AppPadding.regular(
                child: AppButton.max(
                    title: 'Next_Button'.tr,
                    onPressed: controller.onPressedNext),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
