import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_resto/app/modules/auth/controller/forget_password_controller.dart';

class ResetPasswordBoxEmail extends GetView<ForgotPassWordController> {
  const ResetPasswordBoxEmail({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => AppTextFormField.email(
        hintText: 'Email',
        controller: controller.emailController,
        errorText: controller.emailError.value),
  );
}