import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/contains.dart';
import '../../../controllers/controllers.dart';
import '../../../core/core.dart';
import '../../../helper/helper.dart';
import '../../../routes/routes.dart';
import '../../../services/cloud_storage_service/cloud_storage_service.dart';

const _logName = 'SignUpProcessController';

class SignUpProcessController extends BaseController {
  final userController = UserController.instance;
  final CloudStorageService cloudStorageService = CloudStorageService.instance;

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneController;

  File? imageFile;
  Rxn<String?> firstNameError = Rxn<String?>(null);
  Rxn<String?> lastNameError = Rxn<String?>(null);
  Rxn<String?> phoneError = Rxn<String?>(null);
  Rxn<String?> addressLocation = Rxn<String?>(null);

  @override
  void onInit() {
    final currentUser = userController.currentUser.value;
    firstNameController =
        TextEditingController(text: currentUser?.firstName ?? '');
    lastNameController =
        TextEditingController(text: currentUser?.lastName ?? '');
    phoneController =
        TextEditingController(text: currentUser?.phoneNumber ?? '');

    firstNameController.addListener(() {
      final firstName = firstNameController.text;
      firstNameError.value = Validator.validateName(firstName);
    });

    lastNameController.addListener(() {
      final lastName = lastNameController.text;
      lastNameError.value = Validator.validateName(lastName);
    });

    phoneController.addListener(() {
      final phone = phoneController.text;
      phoneError.value = Validator.validatePhone(phone);
    });

    super.onInit();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void onPressBack() => Get.back();

  Future<void> onPressedNext() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (firstNameError.value != null ||
        lastNameError.value != null ||
        phoneError.value != null) {
      return;
    }
    loading(true);
    userController
        .updateUser(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneController.text)
        .then((response) => response.fold((l) {
      loading(false);
      return handleFailure(_logName, l);
    }, (r) {
      loading(false);
      return Get.toNamed(AppRouteProvider.paymentMethodScreen);
    }));
  }

  Future<void> onPressedLocationPicker() async {
    final result = await Get.toNamed(AppRouteProvider.locationPickerScreen);
    if (result != null) {
      addressLocation.value = result;
    }
  }

  Future<void> onPressedNextButtonLocation() async {
    if (addressLocation.value == null) {
      final dialogController = Get.find<DialogController>();
      dialogController.showError(message: "Please Select the Location");
      return;
    }
    loading(true);
    await userController
        .updateUser(address: addressLocation.value)
        .then((response) => response.fold((l) {
      loading(false);
      return handleFailure(_logName, l, showDialog: true);
    }, (r) {
      loading(false);
      return Get.toNamed(AppRouteProvider.signupSuccessScreen);
    }));
  }

  void onPressedNextPayment() =>
      (userController.currentUser.value?.photoUrl?.isNotEmpty ?? false)
          ? Get.toNamed(AppRouteProvider.setLocationScreen)
          : Get.toNamed(AppRouteProvider.uploadPhotoScreen);

  Future<void> onPressedPhotoGallery() async {
    imageFile = null;
    final image = await FileHelper.pickImage();
    if (image != null) {
      imageFile = image;
      Get.toNamed(AppRouteProvider.uploadPreviewScreen);
    }
  }

  Future<void> onPressedTakePhoto() async =>
      FileHelper.takePhoto().then((image) {
        if (image != null) Get.toNamed(AppRouteProvider.uploadPreviewScreen);
      });

  void onPressedSkipPhoto() => Get.toNamed(AppRouteProvider.setLocationScreen);

  void onPressedRemovePhoto() => Get.back();

  Future<void> onPressedPhotoNext() async {
    final currentUser = userController.currentUser.value;
    if (currentUser == null) return;
    try {
      loading(true);
      final urlCallBack = await cloudStorageService.uploadAvatarImage(
          file: imageFile!, uid: currentUser.uid);

      if (urlCallBack == null) {
        return;
      }
      await userController
          .updateUser(photoUrl: urlCallBack)
          .then((response) => response.fold((l) {
        loading(false);
        return handleFailure(_logName, l, showDialog: true);
      }, (r) {
        loading(false);
        return Get.toNamed(AppRouteProvider.setLocationScreen);
      }));
    } catch (e) {
      loading(false);
      handleFailure(_logName, Failure.custom(e.toString()), showDialog: true);
    }
  }
}
