import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/chat_message/presentation/views/group_chat_mobile_screen.dart';

class GroupChatScreen extends StatelessWidget {
  const GroupChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: GroupChatMobileScreen(),
      tabletView: GroupChatMobileScreen(),
    );
  }
}
