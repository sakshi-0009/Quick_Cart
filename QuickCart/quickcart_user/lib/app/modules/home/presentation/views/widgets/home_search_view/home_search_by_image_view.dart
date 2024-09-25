import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_user/app/modules/home/controllers/home_controller.dart';

import '../../../../../../widgets/custom_appbar.dart';
import '../../../../../auth/presentation/views/sign_up_upload_photo_mobile_view/sign_up_photo_box.dart';

class SearchByImageView extends GetView<HomeController> {
  const SearchByImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: const CustomAppBar.back(),
      body: AppPadding.small(
        child: Column(
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
                          text: 'Preview_Search_Title'.tr)),
                  const AppPadding.large(),
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
                  const AppPadding.medium(),
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
          ],
        ),
      ),
    );
  }
}