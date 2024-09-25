import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quickcart_user/app/modules/history/presentation/history_screen.dart';

import '../modules/cart/presentation/cart_screen.dart';
import '../modules/chat_message/presentation/group_chat_screen.dart';
import '../modules/home/presentation/home_screen.dart';
import '../modules/profile/presentation/profile_screen.dart';

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
  history,
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

  static List<MenuItem> listMenu = [
    MenuItem(
        index: 0,
        title: 'Drawer_Home',
        iconData: FontAwesomeIcons.house,
        screen: const HomeScreen(),
        menuType: MenuType.home),
    MenuItem(
        index: 1,
        title: 'Drawer_Profile',
        iconData: FontAwesomeIcons.user,
        screen: const ProfileScreen(),
        menuType: MenuType.profile),
    MenuItem(
        index: 2,
        title: 'Drawer_Cart',
        iconData: FontAwesomeIcons.cartShopping,
        screen: const CartScreen(),
        menuType: MenuType.cart),
    MenuItem(
        index: 3,
        title: 'Drawer_Chat',
        iconData: FontAwesomeIcons.message,
        screen: const GroupChatScreen(),
        menuType: MenuType.chat),
    MenuItem(
        index: 4,
        title: 'Drawer_Order_History',
        iconData: FontAwesomeIcons.history,
        screen: const HistoryScreen(),
        menuType: MenuType.history),
    MenuItem(
        index: 5,
        title: 'Drawer_Language_Change',
        iconData: FontAwesomeIcons.gear,
        screen: null,
        menuType: MenuType.language),
    MenuItem(
        index: 6,
        title: 'Drawer_Theme_Change',
        iconData: FontAwesomeIcons.themeisle,
        screen: null,
        menuType: MenuType.changeTheme),
    MenuItem(
        index: 7,
        title: 'Drawer_Logout',
        iconData: FontAwesomeIcons.rightFromBracket,
        screen: null,
        menuType: MenuType.logout),
  ];
}
