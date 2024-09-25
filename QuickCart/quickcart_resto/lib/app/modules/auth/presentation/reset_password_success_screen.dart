import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/auth/presentation/views/reset_password_view/reset_password_success_view.dart';

class SuccessNotificationScreen extends StatelessWidget {
  const SuccessNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: SuccessNotificationMobileView(),
      tabletView: SuccessNotificationMobileView()
    );
  }
}
