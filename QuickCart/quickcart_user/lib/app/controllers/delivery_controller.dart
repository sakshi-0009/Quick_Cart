import 'dart:async';

import 'package:get/get.dart';

import '../models/history_model.dart';
import '../services/boot_service/boot_services.dart';
import '../services/database_service/database_service.dart';
import 'controllers.dart';


final class DeliveryController extends GetxController implements Bootable {
  static DeliveryController get instance => Get.find<DeliveryController>();
  StreamSubscription? _orderSubscription;
  late final UserController _userController;
  late final DatabaseService _databaseService;
  final currentOrder = Rx<OrderModel?>(null);
  final lstOrderModel = RxList<OrderModel>([]);
  final disableShowDelivery = Rx<bool>(false);

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    _userController = UserController.instance;
    _databaseService = DatabaseService.instance;
    _userController.currentUser.listen((user) {
      if (user == null) {
        _orderSubscription?.cancel();
        currentOrder.value = null;
        lstOrderModel.clear();
        disableShowDelivery.value = false;
      }
      if (user != null) {
        _handleDelivery(user.uid);
      }
    });
  }

  void _handleDelivery(String userUid) async {
    _orderSubscription =
        _databaseService.listenCurrentOrder(userUid).listen((event) {
      if (event.docs.isEmpty || event.docs.last.data().isEmpty) return;
      final _order = OrderModel.fromJson(event.docs.first.data());
      HistoryController.instance.onRefresh();
      if (_order.status != currentOrder.value?.status) {
        disableShowDelivery.value = false;
      }
      currentOrder.value = _order;
    });
  }

  void onChangeDeliveryStatus() =>
      disableShowDelivery(!disableShowDelivery.value);

  @override
  void dispose() {
    _orderSubscription?.cancel();
    super.dispose();
  }
}
