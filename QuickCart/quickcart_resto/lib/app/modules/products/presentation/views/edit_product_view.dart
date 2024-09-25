import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/helper.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../profile/presentation/view/edit_profile_mobile_view/edit_profile_mobile_view.dart';
import '../../controller/admin_edit_product_controller.dart';

class AdminEditProductMobileView
    extends GetView<AdminEditProductScreenController> {
  const AdminEditProductMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    final textStyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.bold);

    return AppScaffoldBackgroundImage.splash(
        appBarWidget: CustomAppBar.back(
          title: 'Product_Edit_Title'.tr,
        ),
        body: AppPadding.medium(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.6,
                  child: Center(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Obx(
                                () {
                              final imagePicker = controller.imagePicker.value;
                              if (imagePicker != null) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.file(
                                    imagePicker,
                                    fit: BoxFit.fill,
                                    color: Theme.of(context).brightness ==
                                        Brightness.dark
                                        ? Colors.black.withOpacity(0.5)
                                        : null,
                                    colorBlendMode:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                        ? BlendMode.darken
                                        : null,
                                  ),
                                );
                              }
                              return AppNetworkImage(
                                  url: controller.productImage ?? '',
                                  borderRadius: 18,
                                  fit: BoxFit.fill,
                                  enableDarkMode: true);
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: -8,
                          child: AppPadding(
                            padding: const AppEdgeInsets.only(
                                top: AppGapSize.paddingMedium,
                                left: AppGapSize.paddingMedium,
                                right: AppGapSize.paddingMedium),
                            child: SizedBox(
                              width: 45,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.insetImagePicker();
                                },
                                style: Theme.of(context)
                                    .elevatedButtonTheme
                                    .style
                                    ?.copyWith(
                                  backgroundColor:
                                  MaterialStateProperty.all(ThemeColors
                                      .backgroundIconColor()),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(8)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(16.0)),
                                  ),
                                ),
                                child: const Icon(Icons.edit,
                                    color: ThemeColors.orangeColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextInputTitle(title: 'Name'.tr, paddingLeft: AppGapSize.none),
                AppTextFormField(
                    hintText: 'Edit_Profile_FirstName'.tr,
                    textStyle: textStyle,
                    maxLines: null,
                    decoration:
                    _decoration(controller.productNameError.value, context),
                    controller: controller.productNameController),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      TextInputTitle(
                          title: 'Product_Edit_Price'.tr, paddingLeft: AppGapSize.none),
                      Expanded(
                        child: AppPadding(
                          padding: const AppEdgeInsets.only(
                              top: AppGapSize.regular,
                              bottom: AppGapSize.small,
                              right: AppGapSize.small),
                          child: Obx(() {
                            return AppText.bodyMedium(
                                text: '${Common.formatMoney(
                                    controller.newPrice.value.toString())} INR',
                                color: ThemeColors.textPriceColor,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.right);
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                AppTextFormField(
                    hintText: 'Product_Edit_Price'.tr,
                    textStyle: textStyle,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    decoration: _decoration(
                        controller.productPriceError.value, context),
                    controller: controller.productPriceController),
                TextInputTitle(
                    title: 'Product_Detail_Title'.tr,
                    paddingLeft: AppGapSize.none),
                AppTextFormField(
                    hintText: 'Product_Detail_Title'.tr,
                    textStyle: textStyle,
                    maxLines: null,
                    decoration: _decoration(
                        controller.productDescriptionError.value, context),
                    controller: controller.productDescriptionController),
                SafeArea(
                  child: AppPadding(
                    padding: const AppEdgeInsets.only(
                        top: AppGapSize.small, bottom: AppGapSize.regular),
                    child: Obx(() {
                      return Center(
                        child: controller.loading.value
                            ? const AppLoading(isLoading: true)
                            : AppButton.max(
                          title: 'Edit_Profile_Update'.tr,
                          onPressed: () => controller.onPressedUpdate(),
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  InputDecoration _decoration(String? errorText, BuildContext context) =>
      InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          fillColor: Colors.transparent,
          errorText: errorText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.6),
                  width: 2.0)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
              const BorderSide(color: ThemeColors.primaryColor, width: 2.0)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
              const BorderSide(color: ThemeColors.textRedColor, width: 3.0)));
}