import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/products/presentation/views/product_add_item_view.dart';

class ProductAddScreen extends StatelessWidget {
  const ProductAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const AppViewLayout(
    mobileView: AdminAddProductMobileView(),
    tabletView: AdminAddProductMobileView(),
  );
}