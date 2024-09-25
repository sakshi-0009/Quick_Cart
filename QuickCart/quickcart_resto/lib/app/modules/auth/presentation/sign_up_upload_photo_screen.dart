import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/auth/presentation/views/signup_upload_photo/signup_upload_photo_view.dart';

class SignUpUploadPhotoScreen extends StatelessWidget {
  const SignUpUploadPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: SignUpUploadPhotoMobileView(),
      tabletView: SignUpUploadPhotoMobileView(),
    );
  }
}
