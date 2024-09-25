import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/auth/presentation/views/signup_view.dart';

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
