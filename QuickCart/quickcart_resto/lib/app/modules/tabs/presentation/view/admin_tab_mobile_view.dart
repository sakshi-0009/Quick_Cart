import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../controllers/admin_tabs_controller.dart';
import '../admin_tab_drawer_menus.dart';

class AdminTabsMobileView extends GetView<AdminTabsController> {
  const AdminTabsMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Obx(
      () {
        final loading = controller.loading.value;
        return AppScaffoldBackgroundImage.splash(
          isLoading: loading,
          body: ZoomDrawer(
              controller: controller.zoomDrawerController,
              androidCloseOnBackTap: true,
              style: DrawerStyle.defaultStyle,
              menuScreenTapClose: true,
              menuScreen: const AdminDrawerWidget(),
              mainScreen:
                  Obx(() => IndexedStack(index: controller.currentMenuItem.value.index, children: controller.screens)),
              shadowLayer1Color: Get.isDarkMode ? ThemeColors.shadowLayer1ColorDark() : ThemeColors.shadowLayer1Color,
              shadowLayer2Color: Get.isDarkMode ? ThemeColors.shadowLayer2ColorDark() : ThemeColors.shadowLayer2Color,
              borderRadius: 32.0,
              showShadow: true,
              angle: -8.0,
              slideWidth: MediaQuery.of(context).size.width * 0.8),
        );
      },
    );
  }
}
