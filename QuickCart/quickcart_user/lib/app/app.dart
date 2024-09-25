import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickcart_user/app/routes/routes.dart';
import 'package:quickcart_user/app/services/language_service/language_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
          title: "Quick Cart",
          theme: ThemePrimary.lightTheme(),
          darkTheme: ThemePrimary.darkTheme(),
          onInit: () async => DeviceHelper.init(),
          debugShowCheckedModeBanner: false,
          enableLog: true,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          locale: TranslationService.fallbackLocale,
          fallbackLocale: TranslationService.fallbackLocale,
          builder: (context, child) =>
              MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)), child: child!),
          translations: TranslationService()),
    );
  }
}