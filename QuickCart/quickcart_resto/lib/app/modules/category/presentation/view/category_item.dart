import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';

import '../../../../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel menuItem;
  final Function(CategoryModel categoryModel) onPressedMenu;
  final Animation<double> animation;

  const CategoryItem({super.key, required this.onPressedMenu, required this.animation, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    final _menuName = menuItem.name ?? '';
    final _menuImage = menuItem.image;

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () => onPressedMenu(menuItem),
      child: AnimationItem(
        animation: animation,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AppSizeScale(
            backgroundColor:
            isDarkMode ? ThemeColors.backgroundTextFormDark() : Theme.of(context).colorScheme.onPrimary,
            child: Column(
              children: [
                Expanded(child: Image.network(_menuImage!, fit: BoxFit.cover)),
                AppPadding.small(
                  child: AppText.bodyLarge(text: _menuName, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
