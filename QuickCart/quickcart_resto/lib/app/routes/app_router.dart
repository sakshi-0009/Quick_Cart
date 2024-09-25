part of 'routes.dart';

class AppPages {
  static String initial = AppRouteProvider.splashScreen;

  static navigateDefaultPage() async {
    final userController = UserController.instance;
    if (userController.firebaseAuthUser.value != null) {
      initial = AppRouteProvider.tabScreen;
      return;
    }

    initial = AppRouteProvider.splashScreen;
  }

  //
  static final routes = [
    GetPage(
      name: AppRouteProvider.splashScreen,
      page: () => const SplashScreen(),
      binding: GetBinding(AppRouteProvider.splashScreen),
    ),
    GetPage(
      name: AppRouteProvider.onboardScreen,
      page: () => const OnboardScreen(),
      binding: GetBinding(AppRouteProvider.onboardScreen),
    ),
    GetPage(
      name: AppRouteProvider.signInScreen,
      page: () => const SignInScreen(),
      binding: GetBinding(AppRouteProvider.signInScreen),
    ),
    GetPage(
      name: AppRouteProvider.signupScreen,
      page: () => const SignUpScreen(),
      binding: GetBinding(AppRouteProvider.signupScreen),
    ),
    GetPage(
      name: AppRouteProvider.signupProcessScreen,
      page: () => const SignUpProcessScreen(),
      binding: GetBinding(AppRouteProvider.signupProcessScreen),
    ),
    GetPage(
      name: AppRouteProvider.paymentMethodScreen,
      page: () => const SignUpPaymentScreen(),
      binding: GetBinding(AppRouteProvider.paymentMethodScreen),
    ),
    GetPage(
      name: AppRouteProvider.uploadPhotoScreen,
      page: () => const SignUpUploadPhotoScreen(),
      binding: GetBinding(AppRouteProvider.uploadPhotoScreen),
    ),
    GetPage(
      name: AppRouteProvider.uploadPreviewScreen,
      page: () => const SignUpPhotoPreviewScreen(),
      binding: GetBinding(AppRouteProvider.uploadPreviewScreen),
    ),
    GetPage(
      name: AppRouteProvider.setLocationScreen,
      page: () => const SetLocationScreen(),
      binding: GetBinding(AppRouteProvider.setLocationScreen),
    ),
    GetPage(
      name: AppRouteProvider.signupSuccessScreen,
      page: () => const SignupSuccessScreen(),
      binding: GetBinding(AppRouteProvider.signupSuccessScreen),
    ),
    GetPage(
      name: AppRouteProvider.tabScreen,
      page: () => const AdminTabsScreen(),
      binding: GetBinding(AppRouteProvider.tabScreen),
    ),
    GetPage(
      name: AppRouteProvider.forgotPasswordScreen,
      page: () => const ResetPasswordScreen(),
      binding: GetBinding(AppRouteProvider.forgotPasswordScreen),
    ),
    GetPage(
      name: AppRouteProvider.successNotificationScreen,
      page: () => SuccessNotificationScreen(),
      binding: GetBinding(AppRouteProvider.successNotificationScreen),
    ),
    GetPage(
      name: AppRouteProvider.chatDetailsScreen,
      page: () => const ChatDetailsScreen(),
      binding: GetBinding(AppRouteProvider.chatDetailsScreen),
    ),
    GetPage(
      name: AppRouteProvider.productFoodDetailScreen,
      page: () => const ProductFoodDetailView(),
      binding: GetBinding(AppRouteProvider.productFoodDetailScreen),
    ),
    GetPage(
      name: AppRouteProvider.imagePreviewScreen,
      page: () => ImagePreviewScreen(url: Get.arguments),
    ),
    GetPage(
      name: AppRouteProvider.editProfileScreen,
      page: () => const EditProfileScreen(),
      binding: GetBinding(AppRouteProvider.editProfileScreen),
    ),
    GetPage(
      name: AppRouteProvider.notificationScreen,
      page: () => const NotificationScreen(),
      binding: GetBinding(AppRouteProvider.notificationScreen),
    ),
    GetPage(
      name: AppRouteProvider.orderDetailScreen,
      page: () => OrderDetailsScreen(orderModel: Get.arguments),
      binding: GetBinding(AppRouteProvider.orderDetailScreen),
    ),
    GetPage(
      name: AppRouteProvider.locationPickerScreen,
      page: () => const LocationPickerScreen(),
      binding: GetBinding(AppRouteProvider.locationPickerScreen),
    ),
    GetPage(
      name: AppRouteProvider.adminEditProductScreen,
      page: () => const AdminEditProductScreen(),
      binding: GetBinding(AppRouteProvider.adminEditProductScreen),
    ),
    GetPage(
      name: AppRouteProvider.adminCategoryScreen,
      page: () => const AdminCategoryScreen(),
      binding: GetBinding(AppRouteProvider.adminCategoryScreen),
    ),
    GetPage(
        name: AppRouteProvider.adminAddCategoryScreen,
        page: () => const AdminAddCategoryScreen(),
        binding: GetBinding(AppRouteProvider.adminAddCategoryScreen)
    ),
    GetPage(
        name: AppRouteProvider.adminCategoryProductListScreen,
        page: () => const CategoryProductListScreen(),
        binding: GetBinding(AppRouteProvider.adminCategoryProductListScreen)
    ),
    GetPage(
        name: AppRouteProvider.adminAddProductScreen,
        page: () => const ProductAddScreen(),
        binding: GetBinding(AppRouteProvider.adminAddProductScreen)
    ),
  ];
}
