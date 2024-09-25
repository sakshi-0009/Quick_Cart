import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';

import '../../../../helper/helper.dart';
import '../../../../models/promotion_model.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/widgets.dart';

class PromotionMobileView extends StatelessWidget {
  final PromotionModel promotionModel;

  const PromotionMobileView({Key? key, required this.promotionModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
        appBarWidget: CustomAppBar.back(),
        body: AppPadding(
          padding: AppEdgeInsets.only(
            top: isIos ? AppGapSize.none : AppGapSize.medium,
            left: AppGapSize.medium,
            right: AppGapSize.medium,
            bottom: AppGapSize.medium,
          ),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSizeScale(
                    ratioHeight: 0.25,
                    ratioWidth: 1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(imageUrl: promotionModel.thumbnail ?? '', fit: BoxFit.fill))),
                AppPadding(
                    padding: AppEdgeInsets.symmetric(vertical: AppGapSize.small),
                    child: AppText.titleLarge(text: promotionModel.title ?? '', textAlign: TextAlign.start)),
                Divider(color: Theme.of(context).colorScheme.primary, thickness: 1),
                RowTextValueWidget(title: 'Start Date: ', value: promotionModel.startDate ?? ''),
                RowTextValueWidget(title: 'End Date: ', value: promotionModel.endDate ?? ''),
                RowTextValueWidget(
                    title: 'Expires later: ',
                    value:
                        getExpiresDayLaterByTwoDateTime(promotionModel.startDate ?? '', promotionModel.endDate ?? '') +
                            ' days'),
                Divider(color: Theme.of(context).colorScheme.primary, thickness: 1),
              ],
            ),
          ),
        ));
  }
}
