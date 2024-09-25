import 'package:get/get.dart';

import '../../../controllers/controllers.dart';
import '../../../core/core.dart';
import '../../../models/chat_model.dart';
import '../../../models/message_chat_model.dart';
import '../../../routes/routes.dart';

class GroupChatScreenController extends BaseController {
  final messageController = MessageController.instance;
  final RxList<GroupChatModel> groupChats = <GroupChatModel>[].obs;

  @override
  void onInit() {
    groupChats.assignAll(messageController.groupChats.toList());
    messageController.groupChats.listen((event) => groupChats.assignAll(event));
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapChat(GroupChatModel chatModel) {
    Get.toNamed(AppRouteProvider.chatDetailsScreen, arguments: chatModel);
  }

  Future<void> handleOnTapChat() async {
    final response = await messageController.sendMessage(
        message: 'Hello', messageChatType: MessageChatType.text);
    response.fold((l) => print(l), (r) {
      if (groupChats.isNotEmpty) {
        Get.toNamed(AppRouteProvider.chatDetailsScreen,
            arguments: groupChats[0]);
      }
    });
  }
}
