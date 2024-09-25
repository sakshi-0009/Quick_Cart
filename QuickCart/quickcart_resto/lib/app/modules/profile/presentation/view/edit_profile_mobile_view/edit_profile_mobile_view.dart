library edit_profile_mobile_view;

import 'dart:io';
import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../widgets/custom_appbar.dart';
import '../../../controller/edit_profile_controller.dart';

part 'edit_profile_avatar.dart';

part 'edit_profile_input_title.dart';

class EditProfileMobileScreen extends GetView<EditProfileController> {
  const EditProfileMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldBackgroundImage.pattern(
      appBarWidget: const CustomAppBar.back(title: 'Edit_Profile_Title'),
      body: AppPadding(
        padding: const AppEdgeInsets.symmetric(horizontal: AppGapSize.medium),
        child: Obx(() {
          final currentUser = controller.currentUser.value;
          if (currentUser == null) return const SizedBox();
          final textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold);
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(child: CircleAvatarWithEditButton()),
                      const TextInputTitle(title: 'Edit_Profile_FirstName'),
                      AppTextFormField(
                          hintText: 'Edit_Profile_FirstName'.tr,
                          textStyle: textStyle,
                          decoration: decoration(controller.firstNameError.value, context),
                          controller: controller.firstNameController),
                      const TextInputTitle(title: 'Edit_Profile_LastName'),
                      AppTextFormField(
                          hintText: 'Edit_Profile_LastName'.tr,
                          textStyle: textStyle,
                          decoration: decoration(controller.lastNameError.value, context),
                          controller: controller.lastNameController),
                      const TextInputTitle(title: 'Edit_Profile_Email'),
                      AppTextFormField(
                          hintText: 'Edit_Profile_Email'.tr,
                          enabled: false,
                          textStyle: textStyle,
                          decoration: decoration(null, context),
                          controller: controller.emailController),
                      const TextInputTitle(title: 'Edit_Profile_Phone'),
                      AppTextFormField.phone(
                          hintText: 'Edit_Profile_Phone'.tr,
                          textStyle: textStyle,
                          decoration: decoration(controller.phoneError.value, context),
                          controller: controller.phoneController),
                      const TextInputTitle(title: 'Edit_Profile_Address'),
                      Row(
                        children: [
                          Expanded(
                            child: AppTextFormField(
                                hintText: 'Edit_Profile_Address'.tr,
                                textStyle: textStyle,
                                decoration: decoration(controller.addressError.value, context),
                                controller: controller.addressController),
                          ),
                          IconButton(
                              onPressed: () => controller.onPressedLocationPicker(),
                              icon: const Icon(FontAwesomeIcons.mapLocationDot, color: ThemeColors.primaryColor))
                        ],
                      ),
                      SizedBox(height: AppGapSize.medium.size),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: AppPadding(
                  padding: const AppEdgeInsets.symmetric(vertical: AppGapSize.medium),
                  child: AnimationButton(
                    ratioWidthButton: 0.95,
                    ratioWidthDone: 0.8,
                    ratioWidthLoading: 0.9,
                    textButton: 'Edit_Profile_Update'.tr,
                    onDone: () => Get.back(),
                    loading: controller.loading.value,
                    onPressed: () => controller.updateUser(),
                    textDone: 'Edit_Profile_Update_Success',
                    textLoading: 'Edit_Profile_Updating',
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

InputDecoration decoration(String? errorText, BuildContext context) => InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
    fillColor: Colors.transparent,
    errorText: errorText,
    enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.6), width: 2.0)),
    border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8.0), borderSide: const BorderSide(color: ThemeColors.primaryColor, width: 2.0)),
    errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8.0), borderSide: const BorderSide(color: ThemeColors.textRedColor, width: 3.0)));
