import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/auth/presentation/views/sign_up_location_view/signup_location_view.dart';

class SetLocationScreen extends StatelessWidget {
  const SetLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: SignUpLocationMobileView(),
      tabletView: SignUpLocationMobileView(),
    );
  }
}
