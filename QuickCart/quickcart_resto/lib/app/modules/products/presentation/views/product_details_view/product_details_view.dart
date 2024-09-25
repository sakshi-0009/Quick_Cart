
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_resto/app/modules/products/presentation/views/product_details_view/widgets/product_detail_widget.dart';

import '../../../../../controllers/controllers.dart';
import '../../../controller/product_details_screen_controller.dart';

class ProductFoodDetailView extends GetView<ProductDetailScreenController> {
  const ProductFoodDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final isRoleUser = UserController.instance.currentUser.value?.isUser() ?? false;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding:
            EdgeInsets.only(bottom: isRoleUser ? kTextTabBarHeight * 2 : 0),
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: ProductDetailAppbar(
                      title: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppButtonBack(onPressed: () => Get.back()),
                            if (!isRoleUser)
                              SafeArea(
                                child: AppPadding(
                                  padding: const AppEdgeInsets.only(
                                      top: AppGapSize.paddingMedium,
                                      left: AppGapSize.paddingMedium,
                                      right: AppGapSize.paddingMedium),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 45,
                                        height: 45,
                                        child: ElevatedButton(
                                          onPressed: () =>
                                              controller.onPressedEditProduct(),
                                          style: Theme.of(context)
                                              .elevatedButtonTheme
                                              .style
                                              ?.copyWith(
                                            backgroundColor:
                                            MaterialStateProperty.all(
                                                ThemeColors
                                                    .backgroundIconColor()),
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      16.0)),
                                            ),
                                          ),
                                          child: const Icon(Icons.edit,
                                              color: ThemeColors.orangeColor),
                                        ),
                                      ),
                                      const SizedBox(width: 30,),
                                      SizedBox(
                                        width: 45,
                                        height: 45,
                                        child: ElevatedButton(
                                          onPressed: () =>
                                              controller.onPressedDeleteProduct(),
                                          style: Theme.of(context)
                                              .elevatedButtonTheme
                                              .style
                                              ?.copyWith(
                                            backgroundColor:
                                            MaterialStateProperty.all(
                                                ThemeColors
                                                    .backgroundIconColor()),
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.all(8)),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      16.0)),
                                            ),
                                          ),
                                          child: const Icon(Icons.delete_rounded,
                                              color: ThemeColors.orangeColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      expandedHeight: MediaQuery.of(context).size.height * 0.4,
                      minExtentHeight: MediaQuery.of(context).size.height * 0.2,
                      backgroundImage: Obx(
                            () {
                          final product = controller.currentProduct.value;
                          return HeaderImage(
                              image: product.image ?? '',
                              enableDarkMode: true);
                        },
                      )),
                ),
                const ProductDetailDescription(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  final String image;
  final bool enableDarkMode;

  const HeaderImage(
      {super.key, required this.image, this.enableDarkMode = false});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.cover,
      color: enableDarkMode ? Colors.black.withOpacity(0.6) : null,
      colorBlendMode: enableDarkMode ? BlendMode.darken : null,
    );
  }
}

