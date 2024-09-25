import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_resto/app/modules/auth/controller/sign_up_process_controller.dart';
import 'package:quickcart_resto/app/modules/auth/presentation/views/signup_photo_preview_view/signup_photo_preview.dart';

import '../../../../../widgets/custom_appbar.dart';

class SignUpPhotoPreviewMobileView extends GetView<SignUpProcessController> {
  const SignUpPhotoPreviewMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppScaffoldBackgroundImage.pattern(
        isLoading: controller.loading.value,
        appBarWidget: const CustomAppBar.back(),
        body: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const AppPadding.small(),
                  AppPadding(
                    padding: const AppEdgeInsets.symmetric(
                        horizontal: AppGapSize.medium),
                    child: AppText.headlineSmall(
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start,
                        text: 'UploadPreviewScreen_Title'.tr),
                  ),
                  AppPadding.medium(
                    child: AppText.bodyMedium(
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                        text: 'UploadPreviewScreen_Description'.tr),
                  ),
                  Expanded(
                    child: Center(
                        child: AppPadding.medium(
                            child: SignUpPhotoPreview(
                                removePhoto: controller.onPressedRemovePhoto))),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: AppPadding.regular(
                child: AppButton.max(
                    title: 'Next_Button'.tr,
                    onPressed: controller.onPressedPhotoNext),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
