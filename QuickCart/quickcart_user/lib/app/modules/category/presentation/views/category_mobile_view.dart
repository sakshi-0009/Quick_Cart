import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_appbar.dart';
import '../../../home/presentation/views/widgets/home_product_view/home_product_view.dart';
import '../../controllers/category_screen_controller.dart';

class CategoryMobileView extends GetView<CategoryScreenController> {
  const CategoryMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: CustomAppBar.back(title: controller.currentMenu.name ?? ''),
      body: Obx(() {
        if (controller.loading.value) {
          return const Center(child: AppLoading(isLoading: true));
        }
        return AppPadding.medium(
            child: SingleChildScrollView(
                child: Obx(() => ProductList(productList: controller.products.toList()))));
      }),
    );
  }
}
