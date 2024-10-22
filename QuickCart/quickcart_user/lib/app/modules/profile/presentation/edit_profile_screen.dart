import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:quickcart_user/app/modules/profile/presentation/views/edit_profile_mobile_view/edit_profile_mobile_view.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppViewLayout(
      mobileView: EditProfileMobileScreen(),
      tabletView: EditProfileMobileScreen(),
    );
  }
}
