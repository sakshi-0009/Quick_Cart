import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_user/app/modules/auth/presentation/views/sign_up_payment_mobile_view/sign_up_payment_button.dart';

import '../../../../../widgets/custom_appbar.dart';
import '../../../controllers/sign_up_process_controller.dart';


class SignUpPaymentMobileView extends GetView<SignUpProcessController> {
  const SignUpPaymentMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: CustomAppBar.back(),
      // onPressBackButton: controller.onPressBack,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppPadding.small(),
                AppPadding(
                  padding: const AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
                  child: AppText.headlineSmall(
                      fontWeight: FontWeight.bold, textAlign: TextAlign.start, text: 'PaymentMethodScreen_Title'.tr),
                ),
                AppPadding.medium(
                  child: AppText.bodyMedium(
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                      text: 'PaymentMethodScreen_Description'.tr),
                ),
                AppPadding(
                    padding: const AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                    child: SignUpPaymentButton(
                      onPressed: () {},
                      child: const AppPadding.medium(child: AppIcons.paypal()),
                    )),
                AppPadding(
                    padding: const AppEdgeInsets.symmetric(horizontal: AppGapSize.medium, vertical: AppGapSize.small),
                    child: SignUpPaymentButton(
                      onPressed: () {},
                      child: const AppIcons.visa(),
                    )),
                AppPadding(
                    padding: const AppEdgeInsets.symmetric(
                        horizontal: AppGapSize.medium,
                        vertical: AppGapSize.small),
                    child: SignUpPaymentButton(
                      onPressed: () {},
                      child: const Center(
                          child: AppText.titleMedium(
                            text: "Cash on Delivery",
                            color: ThemeColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          )),
                    )),
              ],
            ),
          ),
          SafeArea(
            child: AppPadding.regular(
              child: AppButton.max(title: 'Next_Button'.tr, onPressed: controller.onPressedNextPayment),
            ),
          ),
        ],
      ),
    );
  }
}
