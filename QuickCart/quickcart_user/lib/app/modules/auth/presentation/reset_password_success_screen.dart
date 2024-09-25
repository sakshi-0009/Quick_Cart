import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/auth/presentation/views/reset_password_mobile_view/reset_password_success_mobile_view.dart';

class SuccessNotificationScreen extends StatelessWidget {
  const SuccessNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: SuccessNotificationMobileView(),
      tabletView: SuccessNotificationMobileView()
    );
  }
}
