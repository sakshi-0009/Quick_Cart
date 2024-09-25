import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/home/presentation/views/home_mobile_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const AppViewLayout(
        mobileView: HomeMobileView(),
        tabletView: HomeMobileView(),
      );
}
