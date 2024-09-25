import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/history/presentation/history_mobile_view.dart';
import 'package:quickcart_user/app/modules/profile/presentation/views/profile_mobile_view/profile_mobile_view.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: HistoryView(),
      tabletView: HistoryView(),
    );
  }
}
