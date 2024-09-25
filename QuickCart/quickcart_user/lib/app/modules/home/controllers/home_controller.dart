import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/contains.dart';
import '../../../core/core.dart';
import '../../../helper/helper.dart';
import '../../../models/category_model.dart';
import '../../../models/product_model.dart';
import '../../../models/promotion_model.dart';
import '../../../routes/routes.dart';
import '../../../services/database_service/database_service.dart';

import 'package:http/http.dart' as http;
import '../presentation/views/widgets/home_search_view/home_search_result_view.dart';

const _logName = 'HomeController';

enum HomeViewType { normal, popularMenu, popularFood, promotion }

class HomeController extends BaseController {
  static HomeController get instant => Get.find<HomeController>();

  final databaseService = DatabaseService.instance;
  final menus = <CategoryModel>[].obs;
  final products = <ProductModel>[].obs;
  final promotions = <PromotionModel>[].obs;

  Rx<HomeViewType> homeViewType = HomeViewType.normal.obs;
  final currentIndexPromotion = 0.obs;
  late final searchController;
  final showClearSearch = false.obs;
  String lastSearch = "";
  String searchTerm = "";
  late var searchedProducts = <ProductModel>[].obs;


  late File imageFile;

  Future<void> onPressedPhotoGallery() async {
    //imageFile = null;
    final image = await FileHelper.pickImage();
    if (image != null) {
      imageFile = image;
      Get.toNamed(AppRouteProvider.searchByImagePreview);
    }
  }

  Future<void> onPressedTakePhoto() async =>
      FileHelper.takePhoto().then((image) {
        if (image != null) {
          imageFile = image;
          Get.toNamed(AppRouteProvider.searchByImagePreview);
        }
      });

  void onPressedRemovePhoto() => Get.back();

  // works with logmeal api
  // Future<void> onPressedSearch() async {
  //
  //   // Lgo Meal API: https://api.logmeal.com/v2/image/segmentation/complete
  //
  //   var url = Uri.parse('https://api.logmeal.com/v2/image/segmentation/complete');
  //   String api_user_token = '3b553c6724efc76d9e944e3b386381a691f6e7c0';
  //
  //   var request = http.MultipartRequest('POST', url);
  //   request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
  //   request.headers.addAll({
  //     "Content-type": "multipart/form-data",
  //     'Authorization': 'Bearer ' + api_user_token,
  //   });
  //
  //   var res = await request.send();
  //
  //   http.Response response = await http.Response.fromStream(res);
  //   var jsondata = json.decode(response.body) as Map<String, dynamic>;
  //   print(jsondata['segmentation_results']);
  //
  // }


  Future<void> onPressedSearch() async {

    var url = Uri.parse('https://vision.foodvisor.io/api/1.0/en/analysis/');
    String api_user_token = 'CqU9bXGk.TApqmJYpeHla5tlaGtli9g6mxUmdkqmK';
    var request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
    request.headers.addAll({
      "Content-type": "multipart/form-data",
      'Authorization': 'Api-Key ' + api_user_token,
    });


    var res = await request.send();

    http.Response response = await http.Response.fromStream(res);
    var jsondata = json.decode(response.body) as Map<String, dynamic>;

    searchTerm = jsondata['items'][0]['food'][1]['food_info']['display_name'].toString();

    searchedProducts.value = await searchFood(searchTerm);

    Get.to(() => const SearchResultView());

  }



  @override
  void onInit() {
    searchController = TextEditingController();
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        showClearSearch.value = false;
      } else {
        showClearSearch.value = true;
      }
    });
    fetchAllData();
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchAllData() async {
    loading.value = true;
    await fetchProduct();
    await _fetchMenus();
    await _fetchPromotions();
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

  Future<void> _fetchPromotions() async {
    final response = await databaseService.getListPromotions();
    response.fold((l) => handleFailure(_logName, l, showDialog: true), (r) => promotions.value = r);
  }

  String getImageUrlByProductId(int id) => products.firstWhere((element) => id == element.id).image ?? '';

  List<ProductModel> filterProductByIds(List<int> ids) =>
      products.where((element) => ids.contains(element.id)).toList();

  Future<List<ProductModel>> searchFood(String pattern) async {
    List<ProductModel> tempList = [];
    if (pattern.isNotEmpty && lastSearch != pattern) {
      String _searchData = Common.sanitizing(pattern);
      for (int index = 0; index < products.length; index++) {
        bool compareProduct = Common.sanitizing(products[index].name ?? '').toString().contains(_searchData);
        if (compareProduct) tempList.add(products[index]);
      }
      lastSearch = pattern;
    } else {
      tempList.assignAll(products);
    }
    return tempList;
  }

  void onSuggestionSelected(ProductModel product) {
    lastSearch = product.name ?? '';
    Get.toNamed(AppRouteProvider.foodDetailScreen, arguments: product);
  }

  void onPressedViewMorePopularMenu() {
    homeViewType.value = HomeViewType.popularMenu;
  }

  void onPressedViewMorePopularFood() {
    homeViewType.value = HomeViewType.popularFood;
  }

  void onPressedBackToNormalHome() {
    homeViewType.value = HomeViewType.normal;
  }

  void onPressedMenuItem(CategoryModel category) {
    Get.toNamed(AppRouteProvider.categoryScreen, arguments: category);
  }

  void onPressedFoodItem(ProductModel product) {
    Get.toNamed(AppRouteProvider.foodDetailScreen, arguments: product);
  }

  void onPressedPromotionItem(PromotionModel promotion) {
    homeViewType.value = HomeViewType.promotion;
  }

  void onPressedClearSearch() {
    searchController.clear();
    showClearSearch.value = false;
  }
}
