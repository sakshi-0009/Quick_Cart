import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_user/app/modules/home/controllers/home_controller.dart';

import '../../../../../../widgets/custom_appbar.dart';
import 'home_search_by_image_preview.dart';

class SearchByImagePreviewScreen extends GetView<HomeController> {
  const SearchByImagePreviewScreen({super.key});

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
                        text: 'Preview_Search_Title'.tr),
                  ),
                  Expanded(
                    child: Center(
                        child: AppPadding.medium(
                            child: SearchPhotoPreview(
                                removePhoto: controller.onPressedRemovePhoto))),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: AppPadding.regular(
                child: AppButton.max(
                    title: 'Search_Btn'.tr,
                    onPressed: controller.onPressedSearch),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
