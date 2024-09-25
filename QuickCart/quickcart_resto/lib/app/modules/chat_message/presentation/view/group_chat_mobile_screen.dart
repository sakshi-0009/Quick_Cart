import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_resto/app/modules/chat_message/presentation/view/widgets/group_chat/group_chat_item.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../controllers/group_chat_screen_controller.dart';

class GroupChatMobileScreen extends StatelessWidget {
  const GroupChatMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
        appBarWidget: CustomAppBar.drawer(title: 'Drawer_Chat'.tr),
        body: GetX<GroupChatScreenController>(
            init: GroupChatScreenController(),
            builder: (controller) => controller.groupChats.isEmpty
                ? const Center(child: Text("No Chats to Display."))
                : ListView.builder(
                    itemCount: controller.groupChats.length,
                    padding: EdgeInsets.only(
                        top: AppGapSize.medium.size,
                        left: AppGapSize.paddingMedium.size,
                        right: AppGapSize.paddingMedium.size),
                    itemBuilder: (context, index) {
                      final _groupChatItem = controller.groupChats[index];
                      return GroupChatItem(
                          groupChatItem: _groupChatItem,
                          onTap: controller.onTapChat);
                    })
        )
    );

  }
}
