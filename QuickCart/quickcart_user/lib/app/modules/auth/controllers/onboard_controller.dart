import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../../../models/onboard_model.dart';
import '../../../routes/routes.dart';


class OnboardController extends BaseController {
  List<OnboardModel> onboardsList = OnboardModel.lstData;
  late final PageController pageController;
  late final int lastCounter;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPressedNext(int index) => (index == 1)
        ? Get.toNamed(AppRouteProvider.signInScreen)
        : pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.ease);
}
