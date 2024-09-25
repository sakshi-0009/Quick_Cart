import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/tabs/controllers/tabs_controller.dart';


enum CustomAppBarType { drawer, back }

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool centerTitle;
  final Widget? trailingWidget;
  final CustomAppBarType _type;


  const CustomAppBar.drawer(
      {super.key, this.title, this.trailingWidget, this.centerTitle = true})
      : _type = CustomAppBarType.drawer;

  const CustomAppBar.back(
      {super.key, this.title, this.trailingWidget, this.centerTitle = true})
      : _type = CustomAppBarType.back;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _type == CustomAppBarType.drawer
            ? const CustomAppButtonDrawer()
            : AppButtonBack(onPressed: () => Get.back()),
        if (title != null) CustomTitleAppbar(title: title!, centerTitle: true),
        CustomTrailingAppbar(trailingWidget: trailingWidget),
      ],
    );
  }
}

class CustomTrailingAppbar extends StatelessWidget {
  final Widget? trailingWidget;

  const CustomTrailingAppbar({super.key, this.trailingWidget});

  @override
  Widget build(BuildContext context) {
    return trailingWidget ??
        const AppPadding(
            padding: AppEdgeInsets.only(
                top: AppGapSize.paddingMedium,
                left: AppGapSize.paddingMedium,
                right: AppGapSize.paddingMedium),
            child: SizedBox(width: 45, height: 45));
  }
}

class CustomTitleAppbar extends StatelessWidget {
  final String title;
  final bool centerTitle;

  const CustomTitleAppbar(
      {super.key, required this.title, required this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppPadding(
        padding: const AppEdgeInsets.only(top: AppGapSize.paddingMedium),
        child: AppText.headlineSmall(
            textAlign: centerTitle ? TextAlign.center : TextAlign.start,
            maxLines: 1,
            fontWeight: FontWeight.bold,
            text: title),
      ),
    );
  }
}

class CustomAppButtonDrawer extends StatelessWidget {
  const CustomAppButtonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final tabsController = Get.find<TabsController>();
    return AppButtonDrawer(onPressed: () => tabsController.toggleDrawer());
  }
}
