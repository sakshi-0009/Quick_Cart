import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../modules/chat_message/presentation/group_chat_screen.dart';
import '../modules/home/presentation/admin_home_screen.dart';
import '../modules/notification/presentation/notification_screen.dart';
import '../modules/orders/presentation/admin_order_screen.dart';
import '../modules/profile/presentation/profile_screen.dart';
import '../modules/rating/presentation/admin_rating_screen.dart';

enum MenuType {
  home,
  chat,
  profile,
  cart,
  language,
  logout,
  about,
  changeTheme,
  category,
  notification,
  order,
  rating,
}

class MenuItem {
  final String title;
  final IconData iconData;
  final Widget? screen;
  final MenuType menuType;
  final int index;

  MenuItem(
      {required this.title,
      required this.iconData,
      this.screen,
      required this.menuType,
      required this.index});

  static List<MenuItem> listAdminMenu = [
    MenuItem(
        index: 0,
        title: 'Drawer_Home'.tr,
        iconData: FontAwesomeIcons.house,
        screen: const AdminHomeScreen(),
        menuType: MenuType.home),
    MenuItem(
        index: 1,
        title: 'Order'.tr,
        iconData: FontAwesomeIcons.jediOrder,
        screen: const AdminOrderScreen(),
        menuType: MenuType.order),
    MenuItem(
        index: 2,
        title: 'Notification_Title'.tr,
        iconData: FontAwesomeIcons.bell,
        screen: const NotificationScreen(),
        menuType: MenuType.notification),
    MenuItem(
        index: 3,
        title: 'Drawer_Chat'.tr,
        iconData: FontAwesomeIcons.message,
        screen: const GroupChatScreen(),
        menuType: MenuType.chat),
    MenuItem(
        index: 4,
        title: 'Rating_Rate'.tr,
        iconData: FontAwesomeIcons.user,
        screen: const AdminRatingScreen(),
        menuType: MenuType.rating),
    MenuItem(
        index: 6,
        title: 'Drawer_Menu'.tr,
        iconData: FontAwesomeIcons.folderMinus,
        screen: null,
        menuType: MenuType.category),
    MenuItem(
        index: 5,
        title: 'Drawer_Profile'.tr,
        iconData: FontAwesomeIcons.user,
        screen: const ProfileScreen(),
        menuType: MenuType.profile),
    MenuItem(
        index: 7,
        title: 'Drawer_Language_Change'.tr,
        iconData: FontAwesomeIcons.gear,
        screen: null,
        menuType: MenuType.language),
    MenuItem(
        index: 8,
        title: 'Drawer_Theme_Change'.tr,
        iconData: FontAwesomeIcons.themeisle,
        screen: null,
        menuType: MenuType.changeTheme),
    MenuItem(
        index: 9,
        title: 'Drawer_Logout'.tr,
        iconData: FontAwesomeIcons.rightFromBracket,
        screen: null,
        menuType: MenuType.logout),
  ];

}
