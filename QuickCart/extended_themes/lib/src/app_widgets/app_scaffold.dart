part of app_widget;

class AppScaffold extends StatelessWidget {
  final bool isLoading;
  final Widget body;
  final Widget? appBarWidget;
  final Widget? floatActionButton;

  const AppScaffold(
      {super.key,
        required this.body,
        this.floatActionButton,
        this.isLoading = false, this.appBarWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          alignment: Alignment.center,
          children: [SafeArea(child: body), AppLoading(isLoading: isLoading)]),
      floatingActionButton: floatActionButton,
    );
  }
}