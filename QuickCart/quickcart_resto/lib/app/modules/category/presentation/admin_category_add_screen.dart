import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/category/presentation/view/admin_add_category_view.dart';

class AdminAddCategoryScreen extends StatelessWidget {
  const AdminAddCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) => const AppViewLayout(
    mobileView: AdminAddCategoryView(),
    tabletView: AdminAddCategoryView(),
  );
}