import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_user/app/modules/tabs/presentation/views/tabs_mobile_view.dart';

import '../../../controllers/delivery_controller.dart';
import '../../../models/history_model.dart';
import '../../../widgets/role_wrapper.dart';
import 'delivery_status.dart';

class TabScreen extends GetView<DeliveryController> {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoleWrapper(
      userView: Obx(
        () {
          final currentOrder = controller.currentOrder.value;
          final disableShowDelivery = controller.disableShowDelivery.value;
          return (currentOrder != null &&
                  currentOrder.status != HistoryStatus.done &&
                  !disableShowDelivery)
              ? DeliveryStatusWidget(currentOrder: currentOrder)
              : AppViewLayout(
                  mobileView: TabsMobileView(),
                  tabletView: TabsMobileView(),
                );
        },
      ),
    );
  }
}
