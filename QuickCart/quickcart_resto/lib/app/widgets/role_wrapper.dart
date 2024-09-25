import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controllers.dart';

class RoleWrapper extends GetView<UserController> {
  final Widget? adminView;
  final Widget? userView;

  RoleWrapper({super.key, this.adminView, this.userView});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final currentUser = controller.currentUser.value;
        if (currentUser == null) {
          return const AppLoading(isLoading: true);
        }
        final isAdmin = currentUser.isAdmin();
        return isAdmin ? adminView ?? const SizedBox() : userView ?? const SizedBox();
      },
    );
  }
}
