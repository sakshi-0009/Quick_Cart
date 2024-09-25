import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/products/presentation/views/product_listing_view.dart';

class CategoryProductListScreen extends StatelessWidget {
  const CategoryProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const AppViewLayout(
        mobileView: CategoryProductListingView(),
        tabletView: CategoryProductListingView(),
      );
}
