library profile_mobile_view;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../controllers/controllers.dart';
import '../../../../../controllers/delivery_controller.dart';
import '../../../../../helper/helper.dart';
import '../../../../../models/history_model.dart';
import '../../../../../routes/routes.dart';
import '../../../../../widgets/custom_appbar.dart';
import '../../../../../widgets/role_wrapper.dart';
import '../../../../category/presentation/views/product_detail_view/widgets/product_add_to_cart.dart';
import '../../../../category/presentation/views/product_detail_view/widgets/product_favorite_item.dart';
import '../../../../home/controllers/home_controller.dart';

part 'profile_appbar.dart';

part 'profile_body.dart';

part 'profile_favorite_list_widget.dart';

part '../../../../history/presentation/profile_history_list_widget.dart';

part 'profile_user_info_widget.dart';

part 'profile_voucher_widget.dart';

class ProfileMobileView extends GetView<UserController> {
  const ProfileMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentUser = controller.currentUser.value;
      if (currentUser == null) return Container();
      return ColoredBox(
        color: Theme.of(context).colorScheme.background,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
                pinned: true,
                delegate: ProfileAppBar(
                    expandedHeight: MediaQuery.of(context).size.height * 0.4,
                    minExtentHeight: MediaQuery.of(context).size.height * 0.2,
                    backgroundImage: Obx(() => CachedNetworkImage(
                          imageUrl:
                              controller.currentUser.value?.photoUrl ?? '',
                          fit: BoxFit.fill,
                        )),
                    title: const CustomAppBar.drawer())),
            const ProfileBody(),
          ],
        ),
      );
    });
  }
}
