part of app_widget;

class AppLoading extends StatelessWidget {
  final bool isLoading;
  final Color? color;
  final double? size;

  const AppLoading({super.key, required this.isLoading, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return const SizedBox.shrink();
    return Center(
      child: SpinKitFadingCircle(
        size: size ?? 50,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(decoration: BoxDecoration(color: color ?? ThemeColors.primaryColor));
        },
      ),
    );
  }
}