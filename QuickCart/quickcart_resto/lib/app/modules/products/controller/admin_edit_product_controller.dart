import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_resto/app/core/core.dart';

import '../../../constants/contains.dart';
import '../../../helper/helper.dart';
import '../../../models/product_model.dart';
import '../../../services/cloud_storage_service/cloud_storage_service.dart';
import '../../../services/database_service/database_service.dart';
import '../../home/controllers/admin_home_controller.dart';

const _logName = 'AdminEditProductScreenController';

class AdminEditProductScreenController extends BaseController {
  final DatabaseService _databaseService = DatabaseService.instance;
  final CloudStorageService _cloudStorageService = CloudStorageService.instance;
  late TextEditingController productNameController;
  late TextEditingController productPriceController;
  late TextEditingController productDescriptionController;

  Rxn<String?> productNameError = Rxn<String?>(null);
  Rxn<String?> productPriceError = Rxn<String?>(null);
  Rxn<String?> productDescriptionError = Rxn<String?>(null);

  String? productImage;

  final newPrice = Rx<String>('');

  late ProductModel productModel;

  Rxn<File?> imagePicker = Rxn<File?>(null);

  @override
  void onInit() {
    productModel = Get.arguments as ProductModel;
    newPrice.value = (productModel.price).toString();
    final description = productModel.description ?? " ";
    productNameController = TextEditingController(text: productModel.name);
    productPriceController = TextEditingController(text: newPrice.value);
    productDescriptionController = TextEditingController(
        text: productModel.description ?? description);
    productImage = productModel.image;

    productNameController.addListener(() {
      if (productNameController.text.isEmpty) {
        productNameError.value = 'Validate.Name_IsEmpty'.tr;
      } else {
        productNameError.value = null;
      }
    });

    productPriceController.addListener(() {
      newPrice.value = productPriceController.text;
      if (productPriceController.text.isEmpty) {
        productPriceError.value = 'Validate.Name_IsEmpty'.tr;
      } else {
        productPriceError.value = null;
      }
    });

    productDescriptionController.addListener(() {
      if (productDescriptionController.text.isEmpty) {
        productDescriptionError.value = 'Validate.Name_IsEmpty'.tr;
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

  void onPressedUpdate() async {
    if (productDescriptionError.value != null ||
        productPriceError.value != null ||
        productNameError.value != null) {
      return;
    }
    final updateProduct = productModel;
    final price = int.tryParse(productPriceController.text);
    updateProduct.setName(productNameController.text);
    if (price != null) {
      updateProduct.setPrice(price);
    }
    updateProduct.setDescription(productDescriptionController.text);

    if (imagePicker.value != null) {
      loading(true);
      try {
        final url =
        await _cloudStorageService.uploadImage(file: imagePicker.value!);
        if (url != null) {
          updateProduct.setImage(url);
        }
      } catch (e) {
        handleFailure(_logName, Failure.custom(e.toString()));
      }
    }

    loading(true);
    try {
      final response = await _databaseService.updateProduct(updateProduct);
      response.fold((l) => handleFailure(_logName, l), (r) {
        productModel = r;
        AdminHomeController.instant.fetchProduct();
        loading(false);
        Get.back(result: productModel);
        Get.snackbar(
          'Dialog_Notification'.tr,
          'Dialog_Update_Success'.tr,
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