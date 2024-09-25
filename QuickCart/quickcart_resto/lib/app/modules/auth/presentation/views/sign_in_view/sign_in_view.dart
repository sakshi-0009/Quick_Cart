import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_resto/app/modules/auth/controller/sign_in_controller.dart';
import 'package:quickcart_resto/app/modules/auth/presentation/views/sign_in_view/sign_in_social_row_button.dart';

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
                      child: AppText.titleMedium(
                          text: 'SignInScreen_Title'.tr,
                          fontWeight: FontWeight.bold)),
                  AppPadding(
                    padding: const AppEdgeInsets.symmetric(
                        horizontal: AppGapSize.medium,
                        vertical: AppGapSize.small),
                    child: AppTextFormField.email(
                        controller: controller.emailController,
                        errorText: controller.emailError.value,
                        hintText: 'Email'),
                  ),
                  AppPadding(
                    padding: const AppEdgeInsets.symmetric(
                        horizontal: AppGapSize.medium,
                        vertical: AppGapSize.small),
                    child: AppTextFormField.password(
                      controller: controller.passwordController,
                      errorText: controller.passwordError.value,
                      hintText: 'SignInScreen_Password'.tr,
                    ),
                  ),
                  AppPadding(
                    padding: const AppEdgeInsets.symmetric(
                        horizontal: AppGapSize.medium,
                        vertical: AppGapSize.small),
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
                    child: AppButton.max(
                        title: 'SignInScreen_LoginBtn'.tr,
                        onPressed: controller.onPressedLogin),
                  ),
                  const AppPadding(
                      padding: AppEdgeInsets.symmetric(
                          horizontal: AppGapSize.medium,
                          vertical: AppGapSize.small),
                      child: SignInRowButton()),
                  AppPadding(
                    padding:
                        const AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.bodySmall(
                            textAlign: TextAlign.end,
                            text: 'SignInScreen_DontAccount'.tr,
                            fontWeight: FontWeight.w400),
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
                  const AppPadding.small(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
