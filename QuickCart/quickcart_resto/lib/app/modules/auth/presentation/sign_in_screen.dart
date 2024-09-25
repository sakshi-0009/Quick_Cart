import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/auth/presentation/views/sign_in_view/sign_in_view.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: SignInMobileScreen(),
      tabletView: SignInMobileScreen(),
    );
  }
}
