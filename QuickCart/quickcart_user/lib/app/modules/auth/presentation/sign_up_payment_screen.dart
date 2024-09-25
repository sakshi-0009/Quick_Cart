import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/auth/presentation/views/sign_up_payment_mobile_view/sign_up_payment_mobile_view.dart';

class SignUpPaymentScreen extends StatelessWidget {
  const SignUpPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: SignUpPaymentMobileView(),
      tabletView: SignUpPaymentMobileView(),
    );
  }
}