import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/auth/presentation/views/sign_up_success_mobile_view.dart';


class SignupSuccessScreen extends StatelessWidget {
  const SignupSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: SignupSuccessMobileView(),
      tabletView: SignupSuccessMobileView(),
    );
  }
}
