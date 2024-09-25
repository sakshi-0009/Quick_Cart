import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/rating/presentation/views/rating_mobile_view.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) => AppViewLayout(
        mobileView: RatingMobileView(),
        tabletView: RatingMobileView(),
      );
}
