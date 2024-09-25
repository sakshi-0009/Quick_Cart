import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/auth/presentation/views/signup_payment_view/signup_payment_view.dart';

class SignUpPaymentScreen extends StatelessWidget {
  const SignUpPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: SignUpPaymentMobileView(),
      tabletView: SignUpPaymentMobileView(),
    );
  }
}
