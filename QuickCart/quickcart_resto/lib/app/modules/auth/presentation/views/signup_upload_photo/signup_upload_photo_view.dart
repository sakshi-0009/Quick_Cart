import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_resto/app/modules/auth/controller/sign_up_process_controller.dart';
import 'package:quickcart_resto/app/modules/auth/presentation/views/signup_upload_photo/signup_photo_box.dart';

import '../../../../../widgets/custom_appbar.dart';

class SignUpUploadPhotoMobileView extends GetView<SignUpProcessController> {
  const SignUpUploadPhotoMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: const CustomAppBar.back(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppPadding.small(),
                AppPadding(
                    padding: const AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
                    child: AppText.headlineSmall(
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                        text: 'UploadPhotoScreen_Title'.tr)),
                AppPadding.medium(
                    child: AppText.bodyMedium(
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                        text: 'UploadPhotoScreen_Description'.tr)),
                AppPadding(
                  padding: const AppEdgeInsets.symmetric(
                      horizontal: AppGapSize.medium,
                      vertical: AppGapSize.small),
                  child: BoxPhoto(
                    iconPhoto: const AppIcons.gallery(),
                    textPhoto: 'Form Gallery',
                    onPressed: controller.onPressedPhotoGallery,
                  ),
                ),
                AppPadding(
                  padding: const AppEdgeInsets.symmetric(
                      horizontal: AppGapSize.medium,
                      vertical: AppGapSize.small),
                  child: BoxPhoto(
                    iconPhoto: const AppIcons.camera(),
                    textPhoto: 'Take Photo',
                    onPressed: controller.onPressedTakePhoto,
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: AppPadding.regular(
              child: AppButton.max(
                  title: 'Skip_Button'.tr,
                  onPressed: controller.onPressedSkipPhoto),
            ),
          ),
        ],
      ),
    );
  }
}