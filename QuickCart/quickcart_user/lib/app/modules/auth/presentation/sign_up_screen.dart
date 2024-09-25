import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/auth/presentation/views/sign_up_mobile_view.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: SignUpMobileScreen(),
      tabletView: SignUpMobileScreen(),
    );
  }
}
