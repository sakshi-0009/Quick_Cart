import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../constants/contains.dart';
import '../../../controllers/controllers.dart';
import '../../../core/core.dart';
import '../../../models/cart_model.dart';
import '../../../models/product_model.dart';
import '../../../routes/routes.dart';
import '../../../services/database_service/database_service.dart';
import '../../home/controllers/admin_home_controller.dart';

const _logName = 'ProductDetailController';

class ProductDetailScreenController extends BaseController {
  late Rx<ProductModel> currentProduct;
  final UserController userController = UserController.instance;
  final RxList<CartModel> lstCurrentCart = <CartModel>[].obs;
  final RxBool isInCarts = false.obs;

  final DatabaseService _databaseService = DatabaseService.instance;
  final dialogController = Get.find<DialogController>();

  @override
  void onInit() {
    currentProduct = (Get.arguments as ProductModel).obs;
    lstCurrentCart.value =
        userController.currentUser.value?.carts ?? <CartModel>[];
    userController.currentUser.listen((event) {
      if (event == null) return;
      lstCurrentCart.assignAll(event.carts);
    });
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPressedBack() => Get.back();



  Future<void> onPressedDeleteProduct() async {

    dialogController.showCustomizedDialog(
      title: "Delete Menu Item",
      leftBtnText: "Delete",
      leftBtnOnPressed: () async {
        try {
          final response = await _databaseService.deleteProductFromCategory(currentProduct.value.id!.toInt());
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
        message: "Are You sure you want to delete the menu item?",
    );
    Get.back();
  }

  Future<void> onPressedEditProduct() async {
    final response = await Get.toNamed(AppRouteProvider.adminEditProductScreen,
        arguments: currentProduct.value);
    if (response != null) {
      if (response is ProductModel) {
        currentProduct.value = response.copyWith();
        if (kDebugMode) {
          print('currentProduct: ${currentProduct.value.price}');
        }
      }
    }
  }
}