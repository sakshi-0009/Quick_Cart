import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/auth/presentation/views/sign_up_photo_preview_mobile_view/sign_up_photo_preview_mobile_view.dart';

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
