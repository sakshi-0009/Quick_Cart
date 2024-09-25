import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_resto/app/modules/home/controllers/admin_home_controller.dart';

import '../../../../models/category_model.dart';
import '../../../../routes/routes.dart';
import '../../../../widgets/custom_appbar.dart';
import 'category_item.dart';

class AdminCategoryView extends StatelessWidget {
  const AdminCategoryView({super.key});

  Future<void> showBottomSheetSettings(BuildContext buildContext) async {
    await showModalBottomSheet(
        context: buildContext,
        builder: (context) => AppPadding.medium(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                      leading: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(16.0)),
                          child: const AppPadding.small(
                              child: Icon(Icons.add_circle_outline_rounded))),
                      title: AppText.bodyMedium(
                          text: 'Add_Category'.tr, textAlign: TextAlign.start),
                      onTap: () {
                        Navigator.pop(context);
                        Get.toNamed(AppRouteProvider.adminAddCategoryScreen);
                      }),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: CustomAppBar.back(
        title: 'Drawer_Menu'.tr,
        trailingWidget:
            AddIcon(onPressed: () => showBottomSheetSettings(context)),
      ),
      body: GetBuilder<AdminHomeController>(
        init: AdminHomeController(),
        builder: (controller) {
          return Obx(() {
            if (controller.loading.value) {
              return const AppLoading(size: kToolbarHeight, isLoading: true);
            }
            final menuList = controller.menus;
            if (menuList.isEmpty) {
              return const Center(
                  child:
                      Text("No Category to Display. Please create your menu!"));
            }
            return AppAnimationGridView(
              padding: EdgeInsets.all(AppGapSize.medium.size),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: AppGapSize.medium.size,
                  crossAxisSpacing: AppGapSize.medium.size),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: menuList.length,
              itemBuilder: (context, index, animation) => CategoryItem(
                  menuItem: menuList[index],
                  onPressedMenu: (CategoryModel categoryModel) =>
                      controller.onPressedMenuItem(categoryModel),
                  animation: animation),
            );
          });
        },
      ),
    );
  }
}

class AddIcon extends StatelessWidget {
  final VoidCallback onPressed;

  const AddIcon({super.key, required this.onPressed});

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
                  onPressed: () => onPressed(),
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
