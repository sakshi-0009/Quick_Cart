import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/home/presentation/views/promotion_detail_view.dart';

import '../../../models/promotion_model.dart';

class PromotionDetailScreen extends StatelessWidget {
  final PromotionModel promotionModel;

  const PromotionDetailScreen({Key? key, required this.promotionModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) => AppViewLayout(
        mobileView: PromotionMobileView(promotionModel: promotionModel),
        tabletView: PromotionMobileView(promotionModel: promotionModel),
      );
}
