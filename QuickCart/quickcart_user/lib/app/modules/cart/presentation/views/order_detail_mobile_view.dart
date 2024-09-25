import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quickcart_user/app/modules/cart/presentation/views/widgets/order_detail_body.dart';
import 'package:quickcart_user/app/modules/cart/presentation/views/widgets/order_detail_bottom.dart';

import '../../../../controllers/controllers.dart';
import '../../../../helper/helper.dart';
import '../../../../widgets/custom_appbar.dart';

class OrderDetailsMobileView extends GetView<CartController> {
  const OrderDetailsMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: CustomAppBar.drawer(title: 'Cart_Title'.tr),
      body: AppPadding(
        padding: AppEdgeInsets.symmetric(
            horizontal: AppGapSize.medium,
            vertical: isIos ? AppGapSize.none : AppGapSize.medium),
        child: Obx(
          () {
            final _listCarts = controller.lstCarts.toList();
            if (_listCarts.isEmpty) {
              return Container(
                margin: EdgeInsets.only(bottom: kToolbarHeight * 2),
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/lottie/empty_cart.json'),
                    // AppText.bodyLarge(
                    //     text: 'Cart_Empty'.tr, textAlign: TextAlign.center),
                  ],
                ),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderDetailBodyView(
                    onPressedIncreaseQuantity: (cart, index) =>
                        controller.increaseQuantity(cart, index),
                    onPressedDecreaseQuantity: (cart, index) =>
                        controller.decreaseQuantity(cart, index),
                    onPressedRemoveItem: (index) =>
                        controller.onPressedRemoveItem(index),
                    lstCarts: _listCarts),
                const OrderDetailBottom(),
                SafeArea(
                  top: false,
                  child: Obx(
                    () {
                      return AnimationButton(
                          ratioWidthDone: 0.95,
                          ratioWidthLoading: 0.9,
                          ratioWidthButton: 0.95,
                          onPressed: () => controller.onSubmit(),
                          textDone: 'Cart_Order_Success'.tr,
                          onDone: () => controller.onSubmitDone(),
                          textLoading: 'Cart_Oder_Loading'.tr,
                          textButton: 'Cart_Order_Now'.tr,
                          loading: controller.loading.value);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
