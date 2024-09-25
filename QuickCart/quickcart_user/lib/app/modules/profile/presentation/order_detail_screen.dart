import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/profile/presentation/views/order_detail_view/order_detail_view.dart';

import '../../../models/history_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderModel orderModel;

  const OrderDetailsScreen({Key? key, required this.orderModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) => AppViewLayout(
        mobileView: OrderDetailsMobileView(orderModel: orderModel),
        tabletView: OrderDetailsMobileView(orderModel: orderModel),
      );
}
