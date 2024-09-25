import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config_plus/flutter_config_plus.dart';
import 'package:quickcart_user/firebase_options.dart';

import 'app/app.dart';
import 'app/controllers/controllers.dart';
import 'app/routes/routes.dart';
import 'app/services/services.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await FlutterConfigPlus.loadEnvVariables();
    await TranslationService.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    await BootServices(boots: listBootServices)();
    await BootServices(boots: listBootsController)();
    await AppPages.navigateDefaultPage();
    runApp(const MyApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}
