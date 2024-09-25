part of 'home_category_view.dart';

class CategoryListView extends StatelessWidget {
  final List<CategoryModel> menuList;
  final Function(CategoryModel) onPressedMenu;

  const CategoryListView(
      {Key? key, required this.menuList, required this.onPressedMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSizeScale(
      ratioWidth: 1,
      ratioHeight: 0.2,
      child: AppAnimationList(
        scrollDirection: Axis.horizontal,
        itemCount: menuList.length,
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index, animation) {
          return AppPadding(
            padding: const AppEdgeInsets.only(right: AppGapSize.paddingMedium),
            child: CategoryItem(
                onPressedMenu: onPressedMenu,
                menuItem: menuList[index],
                animation: animation),
          );
        },
      ),
    );
  }
}
