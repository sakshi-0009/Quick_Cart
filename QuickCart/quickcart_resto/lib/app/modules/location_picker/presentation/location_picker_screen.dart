import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_resto/app/modules/location_picker/presentation/view/location_picker_mobile_view.dart';

class LocationPickerScreen extends StatelessWidget {
  const LocationPickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const AppViewLayout(
        mobileView: LocationPickerMobileView(),
        tabletView: LocationPickerMobileView(),
      );
}
