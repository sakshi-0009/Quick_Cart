import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../boot_service/boot_services.dart';
import '../console_service/console_service.dart';

const _logName = 'OneSignalService';

final class OneSignalService extends GetxService implements Bootable {
  static OneSignalService get instance => Get.find<OneSignalService>();

  late ConsoleService log = ConsoleService.instance;
  final oneSignal = OneSignal.shared;

  @override
  Future<void> call() async {
    Get.put(this, permanent: true);
    await _initService();
  }

  // Remove player id
  Future<void> removePlayerId(String uid) async {
    await OneSignal.shared.removeExternalUserId();
    log.show(_logName, 'removePlayerId $uid');
  }

  Future<String?> setPlayerId(String uid) async {
    await OneSignal.shared.setExternalUserId(uid);
    return await getPlayerId();
  }

  Future<String?> getPlayerId() async {
    var deviceState = await OneSignal.shared.getDeviceState();
    if (deviceState == null || deviceState.userId == null) return null;

    log.show(_logName, 'getPlayerId ${deviceState.jsonRepresentation()}');
    log.show(_logName, 'getPlayerId ${deviceState.userId}');

    return deviceState.userId;
  }

  _initService() async {
    // final String oneSignalAppId = FlutterConfigPlus.get('ONE_SIGNAL_APP_ID');
    const String oneSignalAppId = '3b86fa26-52fa-4358-8bc1-a5cf6a57281f';
    await OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    await OneSignal.shared.setAppId(oneSignalAppId);
    await OneSignal.shared.consentGranted(true);

    OneSignal.shared.promptUserForPushNotificationPermission();
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      log.show(_logName, 'NOTIFICATION OPENED HANDLER CALLED WITH: $result');
    });

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      log.show(_logName, 'FOREGROUND HANDLER CALLED WITH: $event');
      event.complete(null);
    });

    OneSignal.shared
        .setInAppMessageClickedHandler((OSInAppMessageAction action) {
      log.show(_logName,
          'In App Message Clicked: \n${action.jsonRepresentation().replaceAll("\\n", "\n")}');
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      log.show(_logName,
          'SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}');
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      log.show(_logName,
          'PERMISSION STATE CHANGED: ${changes.jsonRepresentation()}');
    });

    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges changes) {
      log.show(_logName,
          'EMAIL SUBSCRIPTION STATE CHANGED ${changes.jsonRepresentation()}');
    });

    OneSignal.shared
        .setSMSSubscriptionObserver((OSSMSSubscriptionStateChanges changes) {
      log.show(_logName,
          'SMS SUBSCRIPTION STATE CHANGED: ${changes.jsonRepresentation()}');
    });

    OneSignal.shared.setOnWillDisplayInAppMessageHandler((message) {
      if (kDebugMode) {
        print("ON WILL DISPLAY IN APP MESSAGE ${message.messageId}");
      }
      log.show(_logName, 'ON WILL DISPLAY IN APP MESSAGE ${message.messageId}');
    });

    OneSignal.shared.setOnDidDisplayInAppMessageHandler((message) {
      if (kDebugMode) {
        print("ON DID DISPLAY IN APP MESSAGE ${message.messageId}");
      }
      log.show(_logName, 'ON DID DISPLAY IN APP MESSAGE ${message.messageId}');
    });

    OneSignal.shared.setOnWillDismissInAppMessageHandler((message) {
      if (kDebugMode) {
        print("ON WILL DISMISS IN APP MESSAGE ${message.messageId}");
      }
      log.show(_logName, 'ON WILL DISMISS IN APP MESSAGE ${message.messageId}');
    });

    OneSignal.shared.setOnDidDismissInAppMessageHandler((message) {
      if (kDebugMode) {
        print("ON DID DISMISS IN APP MESSAGE ${message.messageId}");
      }
      log.show(_logName, 'ON DID DISMISS IN APP MESSAGE ${message.messageId}');
    });

    // if (isIos) OneSignal.shared.setLaunchURLsInApp(false);

    await OneSignal.shared.requiresUserPrivacyConsent();

    bool userProvidedPrivacyConsent =
        await OneSignal.shared.userProvidedPrivacyConsent();
    log.show(
        _logName, 'USER PROVIDED PRIVACY CONSENT: $userProvidedPrivacyConsent');
  }

  Future<void> sendNotification(OSCreateNotification notification) async {
    try {
      var response = await OneSignal.shared.postNotification(notification);
      if (kDebugMode) {
        print(response.toString());
      }
      log.show(_logName, 'sendNotification: ${response.toString()}');

    } catch (e) {
      log.show(_logName, 'NOTIFICATION OPENED HANDLER ERROR: $e');
    }
  }
}
