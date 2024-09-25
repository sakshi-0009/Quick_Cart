import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/category/presentation/view/admin_category_view.dart';

class AdminCategoryScreen extends StatelessWidget {
  const AdminCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: AdminCategoryView(),
      tabletView: AdminCategoryView(),
    );
  }
}
