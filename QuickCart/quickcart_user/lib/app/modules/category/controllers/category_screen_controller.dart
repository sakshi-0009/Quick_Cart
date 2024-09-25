import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../models/category_model.dart';
import '../../../models/product_model.dart';
import '../../home/controllers/home_controller.dart';

class CategoryScreenController extends BaseController {
  final homeController = Get.find<HomeController>();

  late final CategoryModel currentMenu;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  @override
  void onInit() {
    currentMenu = Get.arguments as CategoryModel;
    products.value = homeController.filterProductByIds(currentMenu.productIds!);

    homeController.products.listen((_newVal) {
      products.assignAll(
          homeController.filterProductByIds(currentMenu.productIds!));
    });
    super.onInit();
  }

  void onSelectedProduct(ProductModel product) {
    Get.snackbar('Selected', product.name!);
  }
}
