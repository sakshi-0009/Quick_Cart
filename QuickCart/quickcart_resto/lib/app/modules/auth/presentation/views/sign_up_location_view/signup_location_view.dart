import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_resto/app/modules/auth/controller/sign_up_process_controller.dart';
import 'package:quickcart_resto/app/modules/auth/presentation/views/sign_up_location_view/signup_location_box.dart';

import '../../../../../widgets/custom_appbar.dart';

class SignUpLocationMobileView extends GetView<SignUpProcessController> {
  const SignUpLocationMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      isLoading: controller.loading.value,
      appBarWidget: const CustomAppBar.back(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const AppPadding.small(),
                AppPadding(
                    padding: const AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
                    child: AppText.headlineSmall(
                        text: 'SetLocationScreen_Title'.tr, fontWeight: FontWeight.bold, textAlign: TextAlign.start)),
                AppPadding.medium(
                    child: AppText.bodyMedium(
                        text: 'SetLocationScreen_Description'.tr,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start)),
                AppPadding.medium(
                  child: Center(
                    child: BoxLocation(
                      onPressSetLocation: controller.onPressedLocationPicker,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: AppPadding.regular(
              child: Obx(() {
                final title = controller.addressLocation.value == null ? 'Skip_Button' : 'Next_Button';
                return AppButton.max(title: title.tr, onPressed: controller.onPressedNextButtonLocation);
              }),
            ),
          ),
        ],
      ),
    );
  }
}