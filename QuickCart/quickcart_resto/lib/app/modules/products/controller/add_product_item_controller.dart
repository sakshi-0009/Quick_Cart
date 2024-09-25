
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/contains.dart';
import '../../../controllers/controllers.dart';
import '../../../core/core.dart';
import '../../../helper/helper.dart';
import '../../../models/comment_model.dart';
import '../../../models/product_model.dart';
import '../../../services/cloud_storage_service/cloud_storage_service.dart';
import '../../../services/database_service/database_service.dart';
import '../../home/controllers/admin_home_controller.dart';

const _logName = 'AdminAddProductScreenController';

class AdminAddProductScreenController extends BaseController {

  final DatabaseService _databaseService = DatabaseService.instance;
  final CloudStorageService _cloudStorageService = CloudStorageService.instance;
  late TextEditingController productNameController;
  late TextEditingController productPriceController;
  late TextEditingController productDescriptionController;

  Rxn<String?> productNameError = Rxn<String?>(null);
  Rxn<String?> productPriceError = Rxn<String?>(null);
  Rxn<String?> productDescriptionError = Rxn<String?>(null);

  String price = '';

  final products = <ProductModel>[].obs;

  String? productImage;

  Rxn<File?> imagePicker = Rxn<File?>(null);

  late final int categoryId;


  @override
  void onInit() {
    categoryId = Get.arguments as int;

    fetchProduct();
    productNameController = TextEditingController();
    productPriceController = TextEditingController();
    productDescriptionController = TextEditingController();
    price = productPriceController.text;


    productNameController.addListener(() {
      if (productNameController.text.isEmpty) {
        productNameError.value = 'Validate.Name_IsEmpty'.tr;
      } else {
        productNameError.value = null;
      }
    });

    productPriceController.addListener(() {
      price = productPriceController.text;
      if (productPriceController.text.isEmpty) {
        productPriceError.value = 'Validate.Price_IsEmpty'.tr;
      } else {
        productPriceError.value = null;
      }
    });

    productDescriptionController.addListener(() {
      if (productDescriptionController.text.isEmpty) {
        productDescriptionError.value = 'Validate.Description_IsEmpty'.tr;
      } else {
        productDescriptionError.value = null;
      }
    });

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    productPriceController.dispose();
    productDescriptionController.dispose();
  }

  Future<void> fetchProduct() async {
    final response = await _databaseService.getListProducts();
    response.fold((l) => handleFailure(_logName, l, showDialog: true), (List<ProductModel> r) {
      r.sort((a, b) => a.name!.compareTo(b.name!));
      return products.assignAll(r);
    });
  }


  void onPressedAddMenuItem() async {

    if (productDescriptionError.value != null ||
        productPriceError.value != null ||
        productNameError.value != null) {
      return;
    }

    final ProductModel addProductModel = ProductModel();

    List<CommentModel> commentsList = [];

    // set image
    if (imagePicker.value != null) {
      loading(true);
      try {
        final url =
            await _cloudStorageService.uploadImage(file: imagePicker.value!);
        if (url != null) {
          addProductModel.setImage(url);
          productImage = url;
        }
      } catch (e) {
        handleFailure(_logName, Failure.custom(e.toString()));
      }
    }else{
      final dialogController = Get.find<DialogController>();
      dialogController.showError(message: "Please select an image for the product");
      return;
    }

    // Set Name of product
    addProductModel.setName(productNameController.text);
    // Set Description of product
    addProductModel.setDescription(productDescriptionController.text);
    //Set Price of Product
    int setprice = int.tryParse(productPriceController.text)!;
    addProductModel.setPrice(setprice);
      addProductModel.comments = commentsList;

    loading(true);

    try {
      int id = products.length;

      addProductModel.id = id;

      final response = await _databaseService.addProductToCategory(addProductModel, id, categoryId);
      response.fold((l) => handleFailure(_logName, l), (r) {
        AdminHomeController.instant.fetchAllData();
        loading(false);
        Get.back();
        Get.snackbar(
          'Dialog_Notification'.tr,
          'Dialog_Add_Product_Success'.tr,
          snackPosition: SnackPosition.TOP,
        );
      });
    } catch (e) {
      handleFailure(_logName, Failure.custom(e.toString()));
      loading(false);
    }

  }

  Future<void> insetImagePicker() async {
    imagePicker.value = await FileHelper.pickImage();
  }

}