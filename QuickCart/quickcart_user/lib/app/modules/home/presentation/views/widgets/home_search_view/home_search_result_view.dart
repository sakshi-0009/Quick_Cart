import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_user/app/widgets/custom_appbar.dart';

import '../../../../controllers/home_controller.dart';
import '../home_product_view/home_product_view.dart';

class SearchResultView extends GetView<HomeController> {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
        appBarWidget: CustomAppBar.back(title: 'Search_Results'.tr),
        body: AppPadding.medium(
          child: Column(
            children: [
              SingleChildScrollView(
                  child: AppPadding(
                padding: const AppEdgeInsets.symmetric(
                    horizontal: AppGapSize.medium),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText.bodyLarge(
                          text: 'Searched Results for ${controller.searchTerm}',
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    AppPadding(
                      padding: const AppEdgeInsets.only(top: AppGapSize.medium),
                      child: AppSizeScale(
                        child: Obx(() {
                          return controller.searchedProducts.value.isEmpty
                              ? Center(child: Text('No item found'))
                              : ProductList(
                                  productList:
                                      controller.searchedProducts.value);
                        }),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ));
  }
}
