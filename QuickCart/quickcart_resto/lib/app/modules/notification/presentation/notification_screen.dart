import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_resto/app/modules/notification/presentation/view/notification_mobile_view.dart';
import 'package:quickcart_resto/app/modules/tabs/presentation/admin_tab_srceen.dart';
import 'package:quickcart_resto/app/routes/routes.dart';

import '../../tabs/presentation/view/admin_tab_mobile_view.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  PopScope(
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

