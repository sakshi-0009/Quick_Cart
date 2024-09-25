import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/controllers.dart';
import '../../../../../helper/helper.dart';

class OrderDetailBottom extends GetView<CartController> {
  const OrderDetailBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      padding: AppEdgeInsets.only(bottom: AppGapSize.small),
      child: DecoratedBox(
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/icons/placeOrder.png'),
                fit: BoxFit.cover,
                opacity: 0.4),
            gradient: ThemeColors.gradientButtonColor,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(-4, 4)),
              BoxShadow(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(4, -4))
            ],
            borderRadius: BorderRadius.circular(16)),
        child: AppPadding.small(
          child: Obx(() {
            final cardCartModel = controller.cardCartModel.value;
            final subTotal =
                "${formatPriceToINR(cardCartModel.subTotalPrice)} INR";
            final serviceFee = "${cardCartModel.serviceFee}%";
            final discount = "${formatPriceToINR(cardCartModel.promotion)} INR";
            final total = "${formatPriceToINR(cardCartModel.totalPrice)} INR";
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderTitleValueText(
                    title: 'Cart_Sub_Total'.tr, value: subTotal),
                OrderTitleValueText(
                    title: 'Cart_Total_Tax'.tr, value: serviceFee),
                OrderTitleValueText(
                    title: 'Cart_Total_Discount'.tr, value: discount),
                AppPadding(
                  padding:
                      AppEdgeInsets.symmetric(horizontal: AppGapSize.small),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText.titleSmall(
                          text: 'Cart_Total_Price'.tr,
                          fontWeight: FontWeight.bold),
                      Expanded(
                        child: AppText.titleMedium(
                            textAlign: TextAlign.end,
                            text: total,
                            color: ThemeColors.textPriceColor,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class OrderTitleValueText extends StatelessWidget {
  final String title;
  final String value;

  const OrderTitleValueText(
      {Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPadding(
      padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.small),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AppText.bodyLarge(text: title, fontWeight: FontWeight.w500),
          Expanded(
              child: AppText.bodyLarge(
                  textAlign: TextAlign.end,
                  text: value,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
