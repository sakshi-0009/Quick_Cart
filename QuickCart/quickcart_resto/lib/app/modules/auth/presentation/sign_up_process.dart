import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/auth/presentation/views/signup_process_view.dart';

class SignUpProcessScreen extends StatelessWidget {
  const SignUpProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: SignUpProcessMobileScreen(),
      tabletView: SignUpProcessMobileScreen(),
    );
  }
}
