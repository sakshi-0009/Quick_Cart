import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/controllers.dart';
import '../../../../../models/menu_models.dart';
import '../../../controllers/admin_tabs_controller.dart';

part 'admin_drawer_mobile_item_widget.dart';
part 'admin_drawer_mobile_list_widget.dart';
part 'drawer_mobile_header_widget.dart';


class AdminDrawerMobileView extends StatelessWidget {
  const AdminDrawerMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppSizeScale(
        child: AppPadding(
          padding: const AppEdgeInsets.only(left: AppGapSize.medium, top: AppGapSize.medium, bottom: AppGapSize.medium),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const DrawerHeaderWidget(),
                AppSizeScale(
                    ratioWidth: 0.5, child: Divider(color: Theme.of(context).colorScheme.primary, thickness: 1)),
                const Expanded(child: AdminDrawerListWidget())
              ]),
        ),
      ),
    );
  }
}
