import 'package:url_launcher/url_launcher.dart';

import 'link_opener_service.dart';

class UrlLauncherLinkOpenerService implements LinkOpenerService {
  @override
  Future<bool> openExternal(Uri uri) {
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
