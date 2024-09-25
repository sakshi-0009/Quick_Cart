import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_user/app/modules/auth/presentation/views/signin_mobile_view/sign_in_socical_row_button.dart';

import '../../../controllers/sign_in_controller.dart';


class SignInMobileScreen extends GetView<SignInController> {
  const SignInMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppScaffoldBackgroundImage.pattern(
        isLoading: controller.loading.value,
        body: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppImages.logo(),
                  AppPadding.medium(
                      child: AppText.titleMedium(text: 'SignInScreen_Title'.tr, fontWeight: FontWeight.bold)),
                  AppPadding(
                    padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                    child: AppTextFormField.email(
                        controller: controller.emailController,
                        errorText: controller.emailError.value,
                        hintText: 'Email'),
                  ),
                  AppPadding(
                    padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                    child: AppTextFormField.password(
                      controller: controller.passwordController,
                      errorText: controller.passwordError.value,
                      hintText: 'SignInScreen_Password'.tr,
                    ),
                  ),
                  AppPadding(
                    padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: controller.onPressedForgotPassword,
                        child: AppText.bodySmall(
                          textAlign: TextAlign.end,
                          text: 'SignInScreen_ForgotPassword'.tr,
                          color: ThemeColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  AppPadding.medium(
                    child: AppButton.max(title: 'SignInScreen_LoginBtn'.tr, onPressed: controller.onPressedLogin),
                  ),
                  AppPadding(
                      padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                      child: SignInRowButton()),
                  AppPadding(
                    padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.bodySmall(
                            textAlign: TextAlign.end, text: 'SignInScreen_DontAccount'.tr, fontWeight: FontWeight.w400),
                        GestureDetector(
                          onTap: controller.onPressedSignUp,
                          child: AppPadding.small(
                            child: AppText.bodySmall(
                                textAlign: TextAlign.end,
                                text: 'SignInScreen_SignUp'.tr,
                                fontWeight: FontWeight.w400,
                                color: ThemeColors.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppPadding.small(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
