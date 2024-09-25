import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/auth/presentation/views/sign_up_upload_photo_mobile_view/sign_up_upload_photo_mobile_view.dart';

class SignUpUploadPhotoScreen extends StatelessWidget {
  const SignUpUploadPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: SignUpUploadPhotoMobileView(),
      tabletView: SignUpUploadPhotoMobileView(),
    );
  }
}
