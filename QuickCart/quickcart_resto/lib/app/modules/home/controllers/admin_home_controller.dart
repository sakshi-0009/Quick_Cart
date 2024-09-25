import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quickcart_resto/app/helper/helper.dart';
import 'package:quickcart_resto/app/modules/rating/controller/admin_rating_screen_controller.dart';

import '../../../constants/contains.dart';
import '../../../controllers/delivery_controller.dart';
import '../../../core/core.dart';
import '../../../models/category_model.dart';
import '../../../models/comment_model.dart';
import '../../../models/history_model.dart';
import '../../../models/product_model.dart';
import '../../../routes/routes.dart';
import '../../../services/database_service/database_service.dart';
import '../../chat_message/controllers/group_chat_screen_controller.dart';
import '../../tabs/controllers/admin_tabs_controller.dart';
import '../presentation/view/chart_data/bar_chart_group_data.dart';

const _logName = 'AdminHomeController';

enum AdminHomeControllerType { normal, popularMenu, popularFood, promotion }

class AdminHomeController extends BaseController {
  static AdminHomeController get instant => Get.find<AdminHomeController>();
  final AdminTabsController adminTabsController = AdminTabsController.instance;

  final DeliveryController deliveryController = DeliveryController.instance;

  Rx<AdminHomeControllerType> adminHomeViewType = AdminHomeControllerType.normal.obs;

  final DatabaseService databaseService = DatabaseService.instance;
  final menus = <CategoryModel>[].obs;
  final products = <ProductModel>[].obs;

  // Revenue chart
  final RxList<ChartData> lstRevenuesChart = <ChartData>[].obs;

  // Order charts
  final RxList<ChartData> lstOrdersChart = <ChartData>[].obs;

  final revenuesFilterChartType = FilterChart.week.obs;
  final ordersFilterChartType = FilterChart.week.obs;

  final RxString todayRevenue = '0.0'.obs; // '0.0
  final RxString todayOrder = '0'.obs;
  final RxString totalReview = '0'.obs;

  @override
  void onInit() {
    fetchAllData();
    final lstOrderModel = deliveryController.lstOrderModel.toList();
    todayRevenue.value = calculateTotalPriceToday(lstOrderModel);
    todayOrder.value = lstOrderModel.length.toString();
    createChartData(revenuesFilterChartType.value).then((value) => lstRevenuesChart.assignAll(value));
    createChartData(ordersFilterChartType.value, isOrdersChart: true).then((value) => lstOrdersChart.assignAll(value));
    Get.put(AdminRatingController());
    Get.find<AdminRatingController>().onInit();
    Get.find<GroupChatScreenController>().onInit();
    _listens();
    super.onInit();
  }

  Future<void> fetchAllData() async {
    loading.value = true;
    await fetchProduct();
    await _fetchMenus();
    loading.value = false;
  }

  Future<void> _fetchMenus() async {
    final response = await databaseService.getListCategories();
    response.fold((l) => handleFailure(_logName, l, showDialog: true), (List<CategoryModel> r) {
      r.sort((a, b) => a.name!.compareTo(b.name!));
      return menus.value = r;
    });
  }

  Future<void> fetchProduct() async {
    final response = await databaseService.getListProducts();
    response.fold((l) => handleFailure(_logName, l, showDialog: true), (List<ProductModel> r) {
      r.sort((a, b) => a.name!.compareTo(b.name!));
      return products.assignAll(r);
    });
  }

  void onPressedMenuItem(CategoryModel category) {
    Get.toNamed(AppRouteProvider.adminCategoryProductListScreen, arguments: category);
  }

  void onPressedViewMorePopularMenu() {
    adminHomeViewType.value = AdminHomeControllerType.popularMenu;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _listens() async {
    deliveryController.lstOrderModel.listen((_orders) async {
      todayRevenue.value = calculateTotalPriceToday(_orders);
      todayOrder.value = _orders.length.toString();
      await createChartData(revenuesFilterChartType.value).then((value) => lstRevenuesChart.assignAll(value));
      await createChartData(ordersFilterChartType.value, isOrdersChart: true)
          .then((value) => lstOrdersChart.assignAll(value));
    });

    databaseService.listenRating().listen((QuerySnapshot<Map<String, dynamic>> event) {
      final List<CommentModel> _result = event.docs.map((e) => CommentModel.fromJson(e.data())).toList();
      totalReview.value = _result.length.toString();
    });

    if (kDebugMode) {
      print('$_logName: "lstRevenuesChart $lstRevenuesChart"');
    }
  }

  String calculateTotalPriceToday(List<OrderModel> orders) {
    final _orders = orders.where((element) => element.status == HistoryStatus.done).toList();
    final total = _orders.fold<double>(0, (previousValue, element) => previousValue + element.total);
    return '${formatPriceToINR(total)} INR';
  }

  // Chart

  Future<List<ChartData>> createChartData(FilterChart filterChartType, {bool isOrdersChart = false}) async {
    {
      var result = <ChartData>[];
      final lstDateTime = filterChartType.generateListDate();
      final response = await databaseService.getListOrderModelByStatus(
          timeStampStart: lstDateTime.first.millisecondsSinceEpoch.toString(),
          timeStampEnd: lstDateTime.last.millisecondsSinceEpoch.toString());
      List<OrderModel> orders = [];

      response.fold((l) => <OrderModel>[], (r) {
        final _filter = r.where((element) => element.status == HistoryStatus.done).toList();
        orders.assignAll(_filter);
      });

      result = lstDateTime.map((e) {
        final listOrderInDay = orders
            .where((element) =>
                compareTwoDateTimeIsSameDay(convertTimeStampToDateTime(element.createdAt), e) &&
                element.status == HistoryStatus.done)
            .toList();

        final total = isOrdersChart
            ? listOrderInDay.length.toDouble()
            : listOrderInDay.fold<double>(0, (previousValue, element) => previousValue + element.total);
        int index = lstDateTime.indexOf(e);

        final _bottomTitle = switch (filterChartType) {
          FilterChart.week => getDayInWeek(e),
          FilterChart.month => e.day % 2 == 0 ? DateFormat('d').format(e) : '',
          FilterChart.year => getMonthInYear(e.month),
        };

        final _toolTip = switch (filterChartType) {
          FilterChart.week => getDayInWeek(e),
          FilterChart.month => DateFormat('dd/MM/yyyy').format(e),
          FilterChart.year => getMonthInYear(e.month)
        };
        return ChartData(
            bottomTitle: _bottomTitle, toolTip: _toolTip, month: e.month, index: index, dateTime: e, value: total);
      }).toList();
      if (filterChartType == FilterChart.year) {
        final _lst = <ChartData>[];
        for (int i = 0; i < 12; i++) {
          final _filter = result.where((element) => element.month == i + 1).toList();
          final total = _filter.fold<double>(0, (previousValue, element) => previousValue + element.value);
          _lst.add(ChartData(
              bottomTitle: (i + 1).toString(),
              toolTip: getMonthInYear(i + 1),
              month: i + 1,
              index: i,
              dateTime: DateTime(2021, i + 1, 1),
              value: total));
        }
        return _lst;
      }

      return result;
    }
  }

  void onFilterRevenueChart(FilterChart filterChartType) {
    revenuesFilterChartType.value = filterChartType;
    createChartData(filterChartType).then((value) => lstRevenuesChart.assignAll(value));
  }

  void onFilterOrderChart(FilterChart filterChartType) {
    ordersFilterChartType.value = filterChartType;
    createChartData(filterChartType, isOrdersChart: true).then((value) => lstOrdersChart.assignAll(value));
  }

  void onPressedOrderProcess() => adminTabsController.onChangeToOrderScreen();

  void onPressedReview() => adminTabsController.onChangeToReviewScreen();

  List<ProductModel> filterProductByIds(List<int> ids) =>
      products.where((element) => ids.contains(element.id)).toList();
}
