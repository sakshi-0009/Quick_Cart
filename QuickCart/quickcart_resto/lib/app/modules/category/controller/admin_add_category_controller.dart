import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_resto/app/models/category_model.dart';

import '../../../constants/contains.dart';
import '../../../controllers/controllers.dart';
import '../../../core/core.dart';
import '../../../helper/helper.dart';
import '../../../services/cloud_storage_service/cloud_storage_service.dart';
import '../../../services/database_service/database_service.dart';
import '../../home/controllers/admin_home_controller.dart';

const _logName = 'AdminAddCategoryScreenController';

class AdminAddCategoryScreenController extends BaseController {

  final DatabaseService _databaseService = DatabaseService.instance;
  final CloudStorageService _cloudStorageService = CloudStorageService.instance;
  late final TextEditingController categoryNameController;

  Rxn<String?> categoryNameError = Rxn<String?>(null);
  Rxn<String?> categoryImageError = Rxn<String?>(null);

  final menus = <CategoryModel>[].obs;

  Rxn<File?> imagePicker = Rxn<File?>(null);

  String? categoryImage;

  @override
  void onInit() {
    _fetchMenus();
    categoryNameController = TextEditingController();
    categoryNameController.addListener(() {
      if (categoryNameController.text.isEmpty) {
        categoryNameError.value = 'Validate.Name_IsEmpty'.tr;
      } else {
        categoryNameError.value = null;
      }
    });
    super.onInit();
  }

  @override
  dispose(){
    super.dispose();
    categoryNameController.dispose();
  }

  Future<void> _fetchMenus() async {
    final response = await _databaseService.getListCategories();
    response.fold((l) => handleFailure(_logName, l, showDialog: true), (List<CategoryModel> r) {
      r.sort((a, b) => a.name!.compareTo(b.name!));
      return menus.value = r;
    });
  }

  void onPressedAdd() async {

    if (categoryNameError.value != null) {
      return;
    }

    final CategoryModel categoryModel = CategoryModel();
    List<int> productIds = [];

    if (imagePicker.value != null) {
      loading(true);
      try {
        final url = await _cloudStorageService.uploadImage(file: imagePicker.value!);

        if (url != null) {
          categoryModel.image = url;
          categoryImage = url;
        }
      } catch (e) {
        handleFailure(_logName, Failure.custom(e.toString()));
      }
    }else{
      final dialogController = Get.find<DialogController>();
      dialogController.showError(message: "Please select an image for the category");
      return;
    }

    loading(true);
    try {
      int id = menus.length;

      // Preparing the object
      categoryModel.id = id;
      categoryModel.name = categoryNameController.text;
      categoryModel.image = categoryImage;
      categoryModel.productIds = productIds;

      final response = await _databaseService.addCategory(categoryModel, id);
      response.fold((l) => handleFailure(_logName, l), (r) {
        CategoryModel addedCategory = r;
        AdminHomeController.instant.fetchAllData();
        loading(false);
        Get.back(result: addedCategory);
        Get.snackbar(
          'Dialog_Notification'.tr,
          'Dialog_Add_Category_Success'.tr,
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