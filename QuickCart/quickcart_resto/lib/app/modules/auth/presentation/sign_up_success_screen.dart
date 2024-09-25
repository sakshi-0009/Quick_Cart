import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/auth/presentation/views/signup_success_view.dart';

class SignupSuccessScreen extends StatelessWidget {
  const SignupSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: SignupSuccessMobileView(),
      tabletView: SignupSuccessMobileView(),
    );
  }
}
