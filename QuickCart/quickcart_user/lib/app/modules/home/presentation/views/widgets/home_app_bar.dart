import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_user/app/modules/home/presentation/views/widgets/widgets.dart';
import 'package:quickcart_user/app/routes/routes.dart';

import '../../../../../controllers/controllers.dart';
import '../../../../../helper/helper.dart';
import '../../../../tabs/controllers/tabs_controller.dart';
import '../../../controllers/home_controller.dart';

class AppBarHomeWidget extends GetView<TabsController> {

  const AppBarHomeWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notificationController = NotificationController.instance;

    return Column(
      children: [
        Row(
          children: [
            Obx(() {
              final homeController = Get.find<HomeController>();
              final isViewTypeNormal =
                  homeController.homeViewType.value == HomeViewType.normal;
              if (!isViewTypeNormal) {
                return AppButtonBack(onPressed: () {
                  homeController.onPressedBackToNormalHome();
                });
              }
              return AppButtonDrawer(
                  onPressed: () => controller.toggleDrawer());
            }),
            const Expanded(
              child: AppPadding(
                  padding: AppEdgeInsets.only(top: AppGapSize.medium),
                  child: AppText.headlineSmall(text: 'Quick Cart')),
            ),
            AppPadding(
                padding: const AppEdgeInsets.only(
                    top: AppGapSize.paddingMedium,
                    left: AppGapSize.paddingMedium,
                    right: AppGapSize.paddingMedium),
                child: SizedBox(
                  width: 45,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () => controller.onPressedNotification(),
                      style: Theme.of(context)
                          .elevatedButtonTheme
                          .style
                          ?.copyWith(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            backgroundColor: MaterialStateProperty.all(
                                ThemeColors.backgroundIconColor()),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                            ),
                          ),
                      child: Obx(() {
                        final newestNotification =
                            notificationController.notificationNews.toList();
                        final totalNotification = newestNotification.length;
                        return Badge(
                          label: Text('$totalNotification'),
                          backgroundColor:
                              ThemeColors.orangeColor.withOpacity(0.2),
                          textColor:
                              Theme.of(context).textTheme.bodySmall?.color,
                          textStyle: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                          child: const Icon(Icons.notifications,
                              color: ThemeColors.orangeColor),
                        );
                      })),
                )),
            ScanIcon(onPressedScan: () {
              Get.toNamed(AppRouteProvider.searchByImageScreen);
            }),
          ],
        ),
        AppPadding(
            padding: AppEdgeInsets.only(
                left: AppGapSize.medium,
                right: AppGapSize.medium,
                top: AppGapSize.medium,
                bottom: isIos ? AppGapSize.none : AppGapSize.medium),
            child:
                const ProductSearchBar(),
            ),
      ],
    );
  }
}

class ScanIcon extends StatelessWidget {
  final VoidCallback onPressedScan;

  const ScanIcon({super.key, required this.onPressedScan});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SafeArea(
          child: AppPadding(
            padding: const AppEdgeInsets.only(
                top: AppGapSize.paddingMedium,
                left: AppGapSize.paddingMedium,
                right: AppGapSize.paddingMedium),
            child: SizedBox(
              width: 45,
              height: 45,
              child: ElevatedButton(
                  onPressed: () => onPressedScan(),
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        backgroundColor: MaterialStateProperty.all(
                            ThemeColors.backgroundIconColor()),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                  child: const Center(
                      child: Icon(Icons.image_search_rounded,
                          color: ThemeColors.orangeColor, size: 24))),
            ),
          ),
        ),
      ],
    );
  }
}
