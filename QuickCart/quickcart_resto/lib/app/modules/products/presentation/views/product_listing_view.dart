import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_resto/app/modules/products/presentation/views/product_list_view.dart';
import 'package:quickcart_resto/app/routes/routes.dart';

import '../../../../widgets/custom_appbar.dart';
import '../../controller/category_product_listing_controller.dart';


class CategoryProductListingView
    extends GetView<CategoryProductListingScreenController> {
  const CategoryProductListingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: CustomAppBar.back(
          title: controller.currentMenu.name ?? '',
          trailingWidget: Row(
            children: [
              AddIcon(onPressedAdd: () async {
                var result = await Get.toNamed(AppRouteProvider.adminAddProductScreen,
                    arguments: controller.currentMenu.id);
              }),

              DeleteIcon(onPressedDelete: () {
                controller.onPressedDeleteCategory();
              }),

            ],
          )),
      body: Obx(() {
        if (controller.loading.value) {
          return const Center(child: AppLoading(isLoading: true));
        }
        if (controller.products.isEmpty) {
          String menuName = controller.currentMenu.name.toString();
          return Center(
              child: Text("No menu items in $menuName category"));
        }
        return AppPadding.medium(
            child: SingleChildScrollView(
                child: Obx(() =>
                    ProductList(productList: controller.products.toList()))));
      }),
    );
  }
}

class AddIcon extends StatelessWidget {
  final VoidCallback onPressedAdd;

  const AddIcon({super.key, required this.onPressedAdd});

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
                  onPressed: () => onPressedAdd(),
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
                      child: Icon(Icons.add_rounded,
                          color: ThemeColors.orangeColor, size: 24))),
            ),
          ),
        ),
      ],
    );
  }
}

class DeleteIcon extends StatelessWidget {
  final VoidCallback onPressedDelete;

  const DeleteIcon({super.key, required this.onPressedDelete});

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
                  onPressed: () => onPressedDelete(),
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
                      child: Icon(Icons.delete_rounded,
                          color: ThemeColors.orangeColor, size: 24))),
            ),
          ),
        ),
      ],
    );
  }
}
