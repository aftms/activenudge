import 'package:flutter/foundation.dart';

import 'platform_info_service.dart';

class FlutterPlatformInfoService implements PlatformInfoService {
  @override
  AppPlatform get currentPlatform {
    if (kIsWeb) {
      return AppPlatform.other;
    }
    return switch (defaultTargetPlatform) {
      TargetPlatform.android => AppPlatform.android,
      TargetPlatform.windows => AppPlatform.windows,
      _ => AppPlatform.other,
    };
  }

  @override
  bool get supportsVibration => currentPlatform == AppPlatform.android;
}
