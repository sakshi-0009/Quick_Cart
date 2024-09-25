import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_resto/app/modules/home/controllers/admin_home_controller.dart';
import 'package:quickcart_resto/app/modules/products/presentation/views/product_item_view.dart';

import '../../../../models/product_model.dart';

class ProductList extends GetView<AdminHomeController> {
  final List<ProductModel> productList;

  const ProductList({Key? key, required this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppAnimationList(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: productList.length,
    itemBuilder: (context, index, animation) =>
        ProductItem(productItem: productList[index], animation: animation),
  );
}