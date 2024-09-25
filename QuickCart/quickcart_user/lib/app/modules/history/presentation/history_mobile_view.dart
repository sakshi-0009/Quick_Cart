import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_appbar.dart';
import '../../profile/presentation/views/profile_mobile_view/profile_mobile_view.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffoldBackgroundImage.pattern(
        appBarWidget: CustomAppBar.drawer(title: 'Order History'),
        body: SingleChildScrollView(
          child: SafeArea(
            child: AppPadding.medium(child: HistoryList()),
          ),
        ));
  }
}
