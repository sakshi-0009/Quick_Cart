import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/auth/presentation/views/signup_photo_preview_view/signup_photo_preview_view.dart';

class SignUpPhotoPreviewScreen extends StatelessWidget {
  const SignUpPhotoPreviewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: SignUpPhotoPreviewMobileView(),
      tabletView: SignUpPhotoPreviewMobileView(),
    );
  }
}
