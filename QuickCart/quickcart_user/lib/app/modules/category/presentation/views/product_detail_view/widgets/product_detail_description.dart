part of product_detail_mobile_widgets;

class ProductDetailDescription extends GetView<ProductDetailScreenController> {
  const ProductDetailDescription();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AppSizeScale(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: AppPadding(
          padding: AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
          child: Obx(() {
            final product = controller.currentProduct.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: ThemeColors.primaryColor.withOpacity(0.1)),
                      child: AppPadding.small(
                          child: AppText.bodyMedium(
                              text: 'Home_Popular_Food'.tr,
                              fontWeight: FontWeight.w400,
                              color: ThemeColors.primaryColor)),
                    ),
                    Spacer(),
                    AppPadding(
                        // padding: AppEdgeInsets.only(left: AppGapSize.small),
                        child: ProductFavoriteItem(productId: product.id ?? 0))
                  ],
                ),
                AppPadding(
                  padding: const AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                  child: AppText.headlineMedium(
                      text: product.name ?? '',
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start),
                ),
                AppText.headlineSmall(
                    text: '${product.price} INR',
                    color: ThemeColors.textPriceColor,
                    textAlign: TextAlign.start),
                AppPadding(
                  padding: const AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                  child: AppText.bodyMedium(
                    text: product.description ?? ' ',
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
