import 'package:get/get.dart';
import 'package:quickcart_resto/app/modules/home/controllers/admin_home_controller.dart';

import '../../../constants/contains.dart';
import '../../../controllers/controllers.dart';
import '../../../core/core.dart';
import '../../../models/category_model.dart';
import '../../../models/product_model.dart';
import '../../../services/database_service/database_service.dart';

const _logName = 'CategoryProductListingScreenController';

class CategoryProductListingScreenController extends BaseController {
  final homeController = Get.find<AdminHomeController>();

  final DatabaseService _databaseService = DatabaseService.instance;
  final dialogController = Get.find<DialogController>();

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

  Future<void> onPressedDeleteCategory() async {
    if (currentMenu.productIds!.isNotEmpty) {
      dialogController.showError(
          message: "Category containing products cannot be deleted!");
      return;
    }
    dialogController.showCustomizedDialog(
        title: "Delete Category",
        leftBtnText: "Delete",
        leftBtnOnPressed: () async {
          try {
            final response = await _databaseService.deleteCategory(currentMenu.id!);
            response.fold((l) => handleFailure(_logName, l), (r) {
              AdminHomeController.instant.fetchAllData();
              loading(false);
              Get.back();
              Get.snackbar(
                'Dialog_Notification'.tr,
                'Dialog_Delete_Success'.tr,
                snackPosition: SnackPosition.TOP,
              );
            });
            Get.back();
          } catch (e) {
            handleFailure(_logName, Failure.custom(e.toString()));
            loading(false);
          }
        },
        rightBtnText: "Cancel",
        message: "Are You sure you want to delete the category?");
  }
}
