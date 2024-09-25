library global_controller;

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_themes/extended_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:quickcart_resto/app/controllers/restaurant_controller.dart';
import 'package:uuid/uuid.dart';

import '../constants/contains.dart';
import '../core/core.dart';
import '../helper/helper.dart';
import '../models/card_cart_model.dart';
import '../models/cart_model.dart';
import '../models/chat_model.dart';
import '../models/comment_model.dart';
import '../models/history_model.dart';
import '../models/message_chat_model.dart';
import '../models/notification_model.dart';
import '../models/product_model.dart';
import '../models/user_model.dart';
import '../modules/tabs/controllers/admin_tabs_controller.dart';
import '../routes/routes.dart';
import '../services/auth_service/auth_service.dart';
import '../services/boot_service/boot_services.dart';
import '../services/console_service/console_service.dart';
import '../services/database_service/database_service.dart';
import '../services/one_signal_service/one_signal_service.dart';
import 'delivery_controller.dart';

part 'dialog_controller.dart';

part 'message_controller.dart';

part 'user_controller.dart';

part 'notification_controller.dart';

part 'favorite_controller.dart';

part 'cart_controller.dart';

part 'history_controller.dart';

final Map<Bootable, int> listBootsController = {
  DialogController(): 1024,
  UserController(): 512,
  RestaurantController(): 256,
  DeliveryController(): 128,
  FavoriteController(): 68,
  CartController(): 66,
  HistoryController(): 64,
  MessageController(): 62,
  NotificationController(): 32,
};
