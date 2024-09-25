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
      page: () => const TabScreen(),
      binding: GetBinding(AppRouteProvider.tabScreen),
    ),
    GetPage(
      name: AppRouteProvider.forgotPasswordScreen,
      page: () => const ResetPasswordScreen(),
      binding: GetBinding(AppRouteProvider.forgotPasswordScreen),
    ),
    GetPage(
      name: AppRouteProvider.successNotificationScreen,
      page: () => const SuccessNotificationScreen(),
      binding: GetBinding(AppRouteProvider.successNotificationScreen),
    ),
    GetPage(
      name: AppRouteProvider.categoryScreen,
      page: () => const CategoryScreen(),
      binding: GetBinding(AppRouteProvider.categoryScreen),
    ),
    GetPage(
      name: AppRouteProvider.chatDetailsScreen,
      page: () => const ChatDetailsScreen(),
      binding: GetBinding(AppRouteProvider.chatDetailsScreen),
    ),
    GetPage(
      name: AppRouteProvider.foodDetailScreen,
      page: () => const ProductDetailScreen(),
      binding: GetBinding(AppRouteProvider.foodDetailScreen),
    ),
    GetPage(
      name: AppRouteProvider.imagePreviewScreen,
      page: () => ImagePreviewScreen(url: Get.arguments),
    ),
    GetPage(
      name: AppRouteProvider.promotionDetailScreen,
      page: () => PromotionDetailScreen(promotionModel: Get.arguments),
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
      name: AppRouteProvider.ratingScreen,
      page: () => const RatingScreen(),
      binding: GetBinding(AppRouteProvider.ratingScreen),
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
      name: AppRouteProvider.searchByImageScreen,
      page: () =>  const SearchByImageView(),
      binding: GetBinding(AppRouteProvider.searchByImageScreen),
    ),
    GetPage(
      name: AppRouteProvider.searchByImagePreview,
      page: () =>  const SearchByImagePreviewScreen(),
      binding: GetBinding(AppRouteProvider.searchByImagePreview),
    ),
  ];
}
