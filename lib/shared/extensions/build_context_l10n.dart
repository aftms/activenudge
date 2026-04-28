import 'package:flutter/widgets.dart';

import '../../app/localization/generated/app_localizations.dart';

extension BuildContextL10n on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
