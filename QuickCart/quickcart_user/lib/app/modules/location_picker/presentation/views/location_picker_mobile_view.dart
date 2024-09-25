import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class LocationPickerMobileView extends StatefulWidget {
  const LocationPickerMobileView({Key? key}) : super(key: key);

  @override
  State<LocationPickerMobileView> createState() =>
      _LocationPickerMobileViewState();
}

class _LocationPickerMobileViewState extends State<LocationPickerMobileView> {
  String? address;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        child: OpenStreetMapSearchAndPick(
          buttonColor: isDark
              ? Theme.of(context).primaryColor
              : ThemeColors.primaryColor,
          hintText: 'Set Current Location',
          onPicked: (result) => Get.back(result: result.address.toString()),
        ),
      ),
    );
  }
}
