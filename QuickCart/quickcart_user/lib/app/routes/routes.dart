library routes;

import 'package:get/get.dart';

import '../controllers/controllers.dart';
import '../modules/auth/controllers/forgot_password_controller.dart';
import '../modules/auth/controllers/onboard_controller.dart';
import '../modules/auth/controllers/sign_in_controller.dart';
import '../modules/auth/controllers/sign_up_controller.dart';
import '../modules/auth/controllers/sign_up_process_controller.dart';
import '../modules/auth/presentation/onboard_screen.dart';
import '../modules/auth/presentation/reset_password_screen.dart';
import '../modules/auth/presentation/reset_password_success_screen.dart';
import '../modules/auth/presentation/sign_in_screen.dart';
import '../modules/auth/presentation/sign_up_location_screen.dart';
import '../modules/auth/presentation/sign_up_payment_screen.dart';
import '../modules/auth/presentation/sign_up_photo_review_screen.dart';
import '../modules/auth/presentation/sign_up_process.dart';
import '../modules/auth/presentation/sign_up_screen.dart';
import '../modules/auth/presentation/sign_up_success_screen.dart';
import '../modules/auth/presentation/sign_up_upload_photo_screen.dart';
import '../modules/category/controllers/category_screen_controller.dart';
import '../modules/category/controllers/product_detail_screen_controller.dart';
import '../modules/category/presentation/category_screen.dart';
import '../modules/category/presentation/product_detail_screen.dart';
import '../modules/chat_message/controllers/group_chat_screen_controller.dart';
import '../modules/chat_message/controllers/room_chat_screen_controller.dart';
import '../modules/chat_message/presentation/image_preview_screen.dart';
import '../modules/chat_message/presentation/room_chat_screen.dart';
import '../modules/home/controllers/home_controller.dart';
import '../modules/home/presentation/promotion_detail_screen.dart';
import '../modules/home/presentation/views/widgets/home_search_view/home_search_by_image.dart';
import '../modules/home/presentation/views/widgets/home_search_view/home_search_by_image_preview.dart';
import '../modules/home/presentation/views/widgets/home_search_view/home_search_by_image_view.dart';
import '../modules/location_picker/presentation/location_picker_screen.dart';
import '../modules/notification/presentation/notification_screen.dart';
import '../modules/profile/controller/edit_profile_controller.dart';
import '../modules/profile/presentation/edit_profile_screen.dart';
import '../modules/profile/presentation/order_detail_screen.dart';
import '../modules/rating/controller/rating_screen_controller.dart';
import '../modules/rating/presentation/rating_screen.dart';
import '../modules/splash/controllers/splash_controller.dart';
import '../modules/splash/presentation/splash_screen.dart';
import '../modules/tabs/controllers/tabs_controller.dart';
import '../modules/tabs/presentation/tab_screen.dart';


part 'app_provider.dart';

part 'app_router.dart';

part 'bindings.dart';
