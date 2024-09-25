library routes;

import 'package:get/get.dart';
import 'package:quickcart_resto/app/modules/category/controller/admin_add_category_controller.dart';
import 'package:quickcart_resto/app/modules/category/presentation/admin_category_add_screen.dart';
import 'package:quickcart_resto/app/modules/home/controllers/admin_home_controller.dart';
import 'package:quickcart_resto/app/modules/products/presentation/views/product_details_view/product_details_view.dart';
import 'package:quickcart_resto/app/modules/rating/controller/admin_rating_screen_controller.dart';
import 'package:quickcart_resto/app/modules/splash/controller/splash_controller.dart';

import '../controllers/controllers.dart';
import '../modules/auth/controller/forget_password_controller.dart';
import '../modules/auth/controller/onboard_controller.dart';
import '../modules/auth/controller/sign_in_controller.dart';
import '../modules/auth/controller/sign_up_controller.dart';
import '../modules/auth/controller/sign_up_process_controller.dart';
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
import '../modules/orders/presentation/order_detail_screen.dart';
import '../modules/products/controller/admin_edit_product_controller.dart';
import '../modules/category/presentation/admin_category_screen.dart';
import '../modules/products/presentation/admin_edit_product_screen.dart';
import '../modules/chat_message/controllers/group_chat_screen_controller.dart';
import '../modules/chat_message/controllers/room_chat_screen_controller.dart';
import '../modules/chat_message/presentation/image_preview_screen.dart';
import '../modules/chat_message/presentation/room_chat_screen.dart';
import '../modules/location_picker/presentation/location_picker_screen.dart';
import '../modules/notification/presentation/notification_screen.dart';
import '../modules/products/controller/add_product_item_controller.dart';
import '../modules/products/controller/category_product_listing_controller.dart';
import '../modules/products/controller/product_details_screen_controller.dart';
import '../modules/products/presentation/product_add_screen.dart';
import '../modules/products/presentation/product_list_screen.dart';
import '../modules/profile/controller/edit_profile_controller.dart';
import '../modules/profile/presentation/edit_profile_screen.dart';
import '../modules/splash/presentation/splash_screen.dart';
import '../modules/tabs/controllers/admin_tabs_controller.dart';
import '../modules/tabs/presentation/admin_tab_srceen.dart';


part 'app_provider.dart';

part 'app_router.dart';

part 'bindings.dart';
