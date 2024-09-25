import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_user/app/modules/chat_message/presentation/views/widgets/group_chat/group_chat_list.dart';

import '../../../../widgets/custom_appbar.dart';
import '../../controllers/group_chat_screen_controller.dart';

class GroupChatMobileScreen extends GetView<GroupChatScreenController> {
  const GroupChatMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
        floatActionButton: Obx(() {
          return controller.groupChats.isNotEmpty
              ? SizedBox.shrink()
              : FloatingActionButton(
                  heroTag: null,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: () => controller.handleOnTapChat(),
                  child: Icon(Icons.message, color: Colors.white),
                );
        }),
        appBarWidget: CustomAppBar.drawer(title: 'Drawer_Chat'.tr),
        body: AppPadding.medium(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => GroupChatList(
                  groupChats: controller.groupChats.toList(),
                  onTap: controller.onTapChat))
            ],
          ),
        ));
  }
}
