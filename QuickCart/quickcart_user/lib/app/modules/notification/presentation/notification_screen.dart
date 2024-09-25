import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/notification/presentation/views/notification_mobile_view.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
      },
      child: const AppViewLayout(
        mobileView: NotificationMobileView(),
        tabletView: NotificationMobileView(),
      ),
    );
  }
}
