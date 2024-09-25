import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/orders/presentation/view/admin_order_mobile_view.dart';

class AdminOrderScreen extends StatelessWidget {
  const AdminOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: AdminOrderMobileView(),
      tabletView: AdminOrderMobileView(),
    );
  }
}
