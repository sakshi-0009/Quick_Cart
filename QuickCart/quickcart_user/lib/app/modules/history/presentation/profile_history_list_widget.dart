part of '../../profile/presentation/views/profile_mobile_view/profile_mobile_view.dart';

class HistoryList extends GetView<HistoryController> {
  const HistoryList();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () {
        final lstHistory = controller.lstHistory.toList();
        if (lstHistory.isEmpty) return const SizedBox.shrink();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedList(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                initialItemCount: lstHistory.length,
                itemBuilder: (context, index, animation) {
                  final _historyItem = lstHistory[index];
                  final _image =
                      _historyItem.carts.first.productModel.image ?? '';
                  final totalPrice =
                      '${formatPriceToINR(_historyItem.total)}\nINR';
                  final createAt = convertTimeStamp(_historyItem.createdAt);
                  final _avatarSize =
                      MediaQuery.of(context).size.shortestSide * 0.2;
                  return AnimationItem(
                    animation: animation,
                    child: GestureDetector(
                      onTap: () => Get.toNamed(
                          AppRouteProvider.orderDetailScreen,
                          arguments: _historyItem),
                      child: AppPadding(
                        padding: const AppEdgeInsets.only(bottom: AppGapSize.small),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: ColoredBox(
                            color: isDarkMode
                                ? ThemeColors.backgroundTextFormDark()
                                : Theme.of(context).colorScheme.onPrimary,
                            child: AppPadding.small(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: CachedNetworkImage(
                                      imageUrl: _image,
                                      width: _avatarSize,
                                      height: _avatarSize,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: AppPadding(
                                      padding: const AppEdgeInsets.only(
                                          left: AppGapSize.medium),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText.bodyLarge(
                                            text: "${'Code_Order'.tr}: ${_historyItem.createdAt}",
                                            fontWeight: FontWeight.bold,
                                            textAlign: TextAlign.left,
                                          ),
                                          AppPadding(
                                            padding: const AppEdgeInsets.only(
                                                top: AppGapSize.small),
                                            child: FittedBox(
                                              child: AppText.bodyMedium(
                                                text: createAt,
                                                fontWeight: FontWeight.w400,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  AppPadding(
                                    padding: const AppEdgeInsets.symmetric(
                                        horizontal: AppGapSize.medium),
                                    child: Container(
                                      width: 1,
                                      height: MediaQuery.of(context)
                                              .size
                                              .shortestSide *
                                          0.15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      AppText.bodyLarge(
                                          text: totalPrice,
                                          color: ThemeColors.textRedColor,
                                          fontWeight: FontWeight.bold),
                                      ElevatedButton(
                                        onPressed: _historyItem.status ==
                                                HistoryStatus.done
                                            ? null
                                            : () => DeliveryController.instance
                                                .onChangeDeliveryStatus(),
                                        style: Theme.of(context)
                                            .elevatedButtonTheme
                                            .style
                                            ?.copyWith(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        _historyItem
                                                            .status.color)),
                                        child: AppText.labelSmall(
                                            text: _historyItem.status.json.tr,
                                            fontWeight: FontWeight.bold,
                                            color: ThemeColors.textDarkColor),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ],
        );
      },
    );
  }
}
