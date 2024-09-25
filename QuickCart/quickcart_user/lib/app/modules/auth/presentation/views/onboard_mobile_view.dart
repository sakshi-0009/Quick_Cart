import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/onboard_controller.dart';

class OnboardMobileScreen extends GetView<OnboardController> {
  const OnboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _onboardListData = controller.onboardsList;
    final _pageController = controller.pageController;
    return AppScaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: _onboardListData.length,
          controller: _pageController,
          itemBuilder: (context, index) {
            final item = _onboardListData[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: AppSizeScale(ratioHeight: 0.5, ratioWidth: 1, child: item.image)),
                AppPadding(
                    padding: AppEdgeInsets.only(
                        top: AppGapSize.large, left: AppGapSize.veryLarge, right: AppGapSize.veryLarge),
                    child: AppText.titleLarge(text: item.title.tr, fontWeight: FontWeight.bold)),
                AppPadding.medium(
                    padding: AppEdgeInsets.symmetric(vertical: AppGapSize.medium, horizontal: AppGapSize.large),
                    child: AppText.bodySmall(text: item.description.tr)),
                AppPadding.large(
                  child: AppButton.min(title: 'Next_Button'.tr, onPressed: () => controller.onPressedNext(index)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
