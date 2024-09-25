import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/category/presentation/views/product_detail_view/product_detail_mobile_view.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppViewLayout(
      mobileView: FoodDetailMobileView(),
      tabletView: FoodDetailMobileView(),
    );
  }
}
