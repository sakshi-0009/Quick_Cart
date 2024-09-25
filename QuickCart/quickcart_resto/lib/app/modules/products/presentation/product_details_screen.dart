import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/products/presentation/views/product_details_view/product_details_view.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: ProductFoodDetailView(),
      tabletView: ProductFoodDetailView(),
    );
  }
}