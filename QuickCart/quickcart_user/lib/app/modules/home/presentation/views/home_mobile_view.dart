import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_user/app/modules/home/presentation/views/widgets/home_app_bar.dart';
import 'package:quickcart_user/app/modules/home/presentation/views/widgets/home_mobile_view_type/home_mobile_view_type.dart';

import '../../controllers/home_controller.dart';


class HomeMobileView extends GetView<HomeController> {
  const HomeMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: AppBarHomeWidget(),
      body: Obx(
        () {
          final isLoading = controller.loading.value;
          if (isLoading) {
            return const Center(child: AppLoading(isLoading: true));
          }
          final homeViewType = controller.homeViewType.value;
          return Builder(
            builder: (context) {
              if (homeViewType == HomeViewType.normal) {
                return HomeViewTypeNormal();
              }

              if (homeViewType == HomeViewType.popularMenu) {
                return HomeViewTypeCategory();
              }

              if (homeViewType == HomeViewType.popularFood) {
                return HomeViewTypeProduct();
              }

              if (homeViewType == HomeViewType.promotion) {
                return HomeViewTypePromotions();
              }

              return SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
