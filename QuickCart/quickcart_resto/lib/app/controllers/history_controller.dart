part of 'controllers.dart';

final class HistoryController extends BaseController implements Bootable {
  static HistoryController get instance => Get.find<HistoryController>();
  late final UserController _userController;
  final DatabaseService _databaseService = DatabaseService.instance;
  final lstHistory = <OrderModel>[].obs;

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    _userController = UserController.instance;
    _listenHistory();
  }

  void _listenHistory() => _userController.currentUser
      .listen((event) => _getListOrderHistory(event?.orderIds));

  Future<void> _getListOrderHistory(List<String>? ordersId) async {
    lstHistory.clear();
    if (ordersId != null && ordersId.isNotEmpty) {
      await _databaseService.getListOrdersByListId(ordersId).then((response) =>
          response.fold((l) => handleFailure(_logName, l, showDialog: true),
              (r) => lstHistory.assignAll(r)));
    }
  }


  void onRefresh()=> _getListOrderHistory(_userController.currentUser.value?.orderIds);

  OrderModel? getOrderById(String orderId) =>
      lstHistory.firstWhereOrNull((element) => element.createdAt == orderId);
}
