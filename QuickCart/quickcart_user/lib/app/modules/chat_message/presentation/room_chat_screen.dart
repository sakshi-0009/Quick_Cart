import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/chat_message/presentation/views/room_chat_mobile_screen.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: RoomChatMobileScreen(),
      tabletView: RoomChatMobileScreen(),
    );
  }
}
