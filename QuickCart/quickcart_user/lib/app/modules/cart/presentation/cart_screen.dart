import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/cart/presentation/views/order_detail_mobile_view.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: OrderDetailsMobileView(),
      tabletView: OrderDetailsMobileView(),
    );
  }
}
