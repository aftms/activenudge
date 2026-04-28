enum AppPlatform { android, windows, other }

abstract interface class PlatformInfoService {
  AppPlatform get currentPlatform;
  bool get supportsVibration;
}
