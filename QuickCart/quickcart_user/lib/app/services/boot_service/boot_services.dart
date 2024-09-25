
import 'package:flutter/foundation.dart';

part 'bootable_service.dart';

class BootServices {
  /// List of boot services
  /// The first element is the service
  /// The second element is the priority
  final Map<Bootable, int> boots;

  BootServices({required this.boots});

  Future<void> call() async {
    boots.entries.toList().sort((a, b) => b.value.compareTo(a.value));
    boots.forEach((key, value) async => await key());
    if (kDebugMode) {
      print('Boot services completed');
    }
  }
}
