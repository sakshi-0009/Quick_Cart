part of 'routes.dart';

class GetBinding extends Bindings {
  final String routerName;

  GetBinding(this.routerName);

  @override
  void dependencies() {
    switch (routerName) {
      case AppRouteProvider.splashScreen:
        Get.lazyPut(() => SplashController());
        break;
      case AppRouteProvider.onboardScreen:
        Get.lazyPut(() => OnboardController());
        break;
      case AppRouteProvider.signupScreen:
        Get.lazyPut(() => SignUpController());
        break;
      case AppRouteProvider.signInScreen:
        Get.lazyPut(() => SignInController());
        break;
      case AppRouteProvider.signupProcessScreen:
        Get.lazyPut(() => SignUpProcessController());
        break;
      case AppRouteProvider.tabScreen:
        Get.lazyPut(() => AdminTabsController());
        Get.lazyPut(() => AdminHomeController());
        Get.lazyPut(() => GroupChatScreenController());
        break;
      case AppRouteProvider.forgotPasswordScreen:
        Get.lazyPut(() => ForgotPassWordController());
        break;
      case AppRouteProvider.chatDetailsScreen:
        Get.lazyPut(() => RoomChatScreenController());
        break;
      case AppRouteProvider.productFoodDetailScreen:
        Get.lazyPut(() => ProductDetailScreenController());
        break;
      case AppRouteProvider.editProfileScreen:
        Get.lazyPut(() => EditProfileController());
        break;
      case AppRouteProvider.adminAddCategoryScreen:
        Get.lazyPut(() => AdminAddCategoryScreenController());
        break;
      case AppRouteProvider.ratingScreen:
        Get.lazyPut(() => AdminRatingController());
        break;
      case AppRouteProvider.adminEditProductScreen:
        Get.lazyPut(() => AdminEditProductScreenController());
        break;
      case AppRouteProvider.adminCategoryProductListScreen:
        Get.lazyPut(() => CategoryProductListingScreenController());
        break;
      case AppRouteProvider.adminAddProductScreen:
        Get.lazyPut(() => AdminAddProductScreenController());
        break;
    }
  }
}
