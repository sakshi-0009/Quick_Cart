import 'package:quickcart_user/app/services/theme_service/theme_service.dart';

import 'auth_service/auth_service.dart';
import 'boot_service/boot_services.dart';
import 'cloud_storage_service/cloud_storage_service.dart';
import 'console_service/console_service.dart';
import 'database_service/database_service.dart';
import 'one_signal_service/one_signal_service.dart';
export 'auth_service/auth_service.dart';
export 'cloud_storage_service/cloud_storage_service.dart';
export 'console_service/console_service.dart';
export 'database_service/database_service.dart';
export 'theme_service/theme_service.dart';
export 'language_service/language_service.dart';
export 'boot_service/boot_services.dart';

final Map<Bootable, int> listBootServices = {
  ConsoleService(): 1024,
  ThemeService(): 512,
  AuthService(): 256,
  DatabaseService(): 128,
  CloudStorageService(): 32,
  OneSignalService(): 16,
};
