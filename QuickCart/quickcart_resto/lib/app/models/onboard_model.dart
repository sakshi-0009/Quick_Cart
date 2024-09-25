import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardModel {
  final String title, description;
  final Widget image;

  OnboardModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static final List<OnboardModel> lstData = [
    OnboardModel(
        image: const AppImages.onboardBanner1(),
        title: 'OnboardScreen_Title1'.tr,
        description: 'OnboardScreen_Description1'.tr),
    OnboardModel(
        image: const AppImages.onboardBanner2(),
        title: 'OnboardScreen_Title2'.tr,
        description: 'OnboardScreen_Description2'.tr),
  ];
}
