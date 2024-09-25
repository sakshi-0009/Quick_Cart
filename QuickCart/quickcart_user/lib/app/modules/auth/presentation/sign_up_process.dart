import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/auth/presentation/views/sign_up_process_mobile_view.dart';

class SignUpProcessScreen extends StatelessWidget {
  const SignUpProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: SignUpProcessMobileScreen(),
      tabletView: SignUpProcessMobileScreen(),
    );
  }
}
