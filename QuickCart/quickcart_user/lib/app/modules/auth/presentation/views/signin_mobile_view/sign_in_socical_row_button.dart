import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/sign_in_controller.dart';
import 'sign_in_social_button.dart';

class SignInRowButton extends GetView<SignInController> {
  const SignInRowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppPadding.small(),
        Expanded(
          child: SignInSocialButton(
            title: 'Google',
            iconWidget: AppIcons.google(),
            onPressed: controller.onPressedSocialGoogle,
          ),
        ),
      ],
    );
  }
}
