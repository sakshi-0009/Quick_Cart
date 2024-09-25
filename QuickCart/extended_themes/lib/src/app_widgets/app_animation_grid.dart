part of 'app_widgets.dart';

class AppAnimationGridView extends StatelessWidget {
  final ScrollController? controller;
  final Widget Function(
      BuildContext context, int index, Animation<double> animation) itemBuilder;
  final int itemCount;
  final ScrollPhysics? physics;
  final bool? shrinkWrap;
  final Axis? scrollDirection;
  final SliverGridDelegate gridDelegate;
  final EdgeInsetsGeometry? padding;

  const AppAnimationGridView(
      {Key? key,
        this.controller,
        required this.itemBuilder,
        required this.itemCount,
        this.scrollDirection = Axis.vertical,
        this.physics,
        this.shrinkWrap,
        required this.gridDelegate,
        this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LiveGrid.options(
      scrollDirection: scrollDirection!,
      padding: padding,
      options: const LiveOptions(
          delay: Duration(milliseconds: 100),
          showItemInterval: Duration(milliseconds: 100),
          showItemDuration: Duration(milliseconds: 100),
          visibleFraction: 0.05,
          reAnimateOnVisibility: false),
      shrinkWrap: shrinkWrap ?? false,
      physics: physics ?? const NeverScrollableScrollPhysics(),
      itemBuilder: itemBuilder,
      itemCount: itemCount,
      gridDelegate: gridDelegate,
    );
  }
}