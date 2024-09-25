import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';

import '../../../../../../controllers/controllers.dart';
import '../../../../../../helper/helper.dart';
import '../../../../../../models/chat_model.dart';
import '../../../../../../models/message_chat_model.dart';


class GroupChatItem extends StatelessWidget {
  final GroupChatModel groupChatItem;
  final Function(GroupChatModel) onTap;

  const GroupChatItem(
      {super.key,
      required this.groupChatItem,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final currentUser = UserController.instance.currentUser.value;
    final _user = {groupChatItem.receiverUser, groupChatItem.senderUser}
        .firstWhere((element) => element.uid != currentUser!.uid);
    return AppPadding(
      padding: const AppEdgeInsets.only(bottom: AppGapSize.medium),
      child: GestureDetector(
        onTap: () => onTap(groupChatItem),
        child: Container(
          height: MediaQuery.of(context).size.shortestSide * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(0, 4),
              )
            ],
            color: isDarkMode
                ? ThemeColors.backgroundTextFormDark()
                : Theme.of(context).colorScheme.onPrimary,
          ),
          child: AppPadding.medium(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppPadding(
                  padding: const AppEdgeInsets.only(right: AppGapSize.medium),
                  child: AppNetworkImage(
                      borderRadius: 512,
                      width: MediaQuery.of(context).size.shortestSide * 0.15,
                      height: MediaQuery.of(context).size.shortestSide * 0.15,
                      url: _user.photoUrl ?? '',
                      fit: BoxFit.fill),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText.bodyLarge(
                          text: _user.getName(),
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.start,
                          maxLines: 1),
                      Builder(builder: (context) {
                        String message =
                            groupChatItem.lastMessageChat.message.toString();
                        if (groupChatItem.lastMessageChat.messageChatType !=
                            MessageChatType.text) {
                          message = MessageChatFile.fromJson(
                                  groupChatItem.lastMessageChat.message)
                              .message
                              .toString();
                        }

                        return AppText.bodyMedium(
                            text: message,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            color: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .color!
                                .withOpacity(0.5));
                      }),
                      AppText.bodySmall(
                          text: convertTimeStamp(
                              groupChatItem.lastMessageChat.timestamp)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
