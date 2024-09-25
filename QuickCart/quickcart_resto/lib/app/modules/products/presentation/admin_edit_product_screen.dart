import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/products/presentation/views/edit_product_view.dart';

class AdminEditProductScreen extends StatelessWidget {
  const AdminEditProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const AppViewLayout(
        mobileView: AdminEditProductMobileView(),
        tabletView: AdminEditProductMobileView(),
      );
}
