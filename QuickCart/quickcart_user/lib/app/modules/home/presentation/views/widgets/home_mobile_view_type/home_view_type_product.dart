part of 'home_mobile_view_type.dart';

class HomeViewTypeProduct extends StatelessWidget {
  const HomeViewTypeProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const SingleChildScrollView(child: ProductPopular());
}
