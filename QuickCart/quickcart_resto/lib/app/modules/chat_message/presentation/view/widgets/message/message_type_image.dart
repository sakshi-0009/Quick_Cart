import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../models/message_chat_model.dart';
import '../../../../../../routes/routes.dart';
import 'message_type_text.dart';

class ChatMessageImage extends StatefulWidget {
  final MessageChatFile messageChat;
  final String timestamp;

  const ChatMessageImage({Key? key, required this.messageChat, required this.timestamp}) : super(key: key);

  @override
  State<ChatMessageImage> createState() => _ChatMessageImageState();
}

class _ChatMessageImageState extends State<ChatMessageImage> with AutomaticKeepAliveClientMixin {
  late final List<ChatFileModel> lstFiles;

  @override
  void initState() {
    lstFiles = widget.messageChat.lstFiles;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        ...lstFiles
            .map((e) => AppPadding.small(
                  child: InkWell(
                    onTap: () => Get.toNamed(AppRouteProvider.imagePreviewScreen, arguments: e.fileUrl),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(imageUrl: e.fileUrl, fit: BoxFit.fill),
                    ),
                  ),
                ))
            .toList(),
        ChatMessageText(message: widget.messageChat.message, timestamp: widget.timestamp)
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
