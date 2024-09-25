import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_resto/app/modules/auth/controller/sign_in_controller.dart';
import 'package:quickcart_resto/app/modules/auth/presentation/views/sign_in_view/sign_in_social_button.dart';

class SignInRowButton extends GetView<SignInController> {
  const SignInRowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SignInSocialButton(
            title: 'Google',
            iconWidget: const AppIcons.google(),
            onPressed: controller.onPressedSocialGoogle,
          ),
        ),
      ],
    );
  }
}