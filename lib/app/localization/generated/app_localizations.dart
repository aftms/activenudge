import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'ActiveNudge'**
  String get appTitle;

  /// No description provided for @reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// No description provided for @nextReminder.
  ///
  /// In en, this message translates to:
  /// **'Next reminder'**
  String get nextReminder;

  /// No description provided for @suggestedActivity.
  ///
  /// In en, this message translates to:
  /// **'Suggested activity'**
  String get suggestedActivity;

  /// No description provided for @startNow.
  ///
  /// In en, this message translates to:
  /// **'Start now'**
  String get startNow;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @activities.
  ///
  /// In en, this message translates to:
  /// **'Activities'**
  String get activities;

  /// No description provided for @newActivity.
  ///
  /// In en, this message translates to:
  /// **'New activity'**
  String get newActivity;

  /// No description provided for @editActivity.
  ///
  /// In en, this message translates to:
  /// **'Edit activity'**
  String get editActivity;

  /// No description provided for @createActivity.
  ///
  /// In en, this message translates to:
  /// **'Create activity'**
  String get createActivity;

  /// No description provided for @updateActivity.
  ///
  /// In en, this message translates to:
  /// **'Update activity'**
  String get updateActivity;

  /// No description provided for @titleEnglish.
  ///
  /// In en, this message translates to:
  /// **'Title in English'**
  String get titleEnglish;

  /// No description provided for @titlePortuguese.
  ///
  /// In en, this message translates to:
  /// **'Title in Portuguese'**
  String get titlePortuguese;

  /// No description provided for @activityTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get activityTitle;

  /// No description provided for @descriptionEnglish.
  ///
  /// In en, this message translates to:
  /// **'Description in English'**
  String get descriptionEnglish;

  /// No description provided for @descriptionPortuguese.
  ///
  /// In en, this message translates to:
  /// **'Description in Portuguese'**
  String get descriptionPortuguese;

  /// No description provided for @activityDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get activityDescription;

  /// No description provided for @instructionsEnglish.
  ///
  /// In en, this message translates to:
  /// **'Instructions in English'**
  String get instructionsEnglish;

  /// No description provided for @instructionsPortuguese.
  ///
  /// In en, this message translates to:
  /// **'Instructions in Portuguese'**
  String get instructionsPortuguese;

  /// No description provided for @activityInstructions.
  ///
  /// In en, this message translates to:
  /// **'Instructions'**
  String get activityInstructions;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @intensity.
  ///
  /// In en, this message translates to:
  /// **'Intensity'**
  String get intensity;

  /// No description provided for @contentType.
  ///
  /// In en, this message translates to:
  /// **'Content type'**
  String get contentType;

  /// No description provided for @textContent.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get textContent;

  /// No description provided for @imageContent.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get imageContent;

  /// No description provided for @externalLinkContent.
  ///
  /// In en, this message translates to:
  /// **'External link'**
  String get externalLinkContent;

  /// No description provided for @externalVideoContent.
  ///
  /// In en, this message translates to:
  /// **'External video'**
  String get externalVideoContent;

  /// No description provided for @urlOptional.
  ///
  /// In en, this message translates to:
  /// **'URL, optional'**
  String get urlOptional;

  /// No description provided for @imageOptional.
  ///
  /// In en, this message translates to:
  /// **'Image, optional'**
  String get imageOptional;

  /// No description provided for @chooseImage.
  ///
  /// In en, this message translates to:
  /// **'Choose image'**
  String get chooseImage;

  /// No description provided for @removeImage.
  ///
  /// In en, this message translates to:
  /// **'Remove image'**
  String get removeImage;

  /// No description provided for @isActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get isActive;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @titleEnRequired.
  ///
  /// In en, this message translates to:
  /// **'English title is required.'**
  String get titleEnRequired;

  /// No description provided for @titlePtRequired.
  ///
  /// In en, this message translates to:
  /// **'Portuguese title is required.'**
  String get titlePtRequired;

  /// No description provided for @titleRequired.
  ///
  /// In en, this message translates to:
  /// **'Title is required.'**
  String get titleRequired;

  /// No description provided for @urlInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid http or https URL.'**
  String get urlInvalid;

  /// No description provided for @imageRequired.
  ///
  /// In en, this message translates to:
  /// **'Choose an image for image content.'**
  String get imageRequired;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get systemDefault;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @portuguese.
  ///
  /// In en, this message translates to:
  /// **'Português'**
  String get portuguese;

  /// No description provided for @reminderInterval.
  ///
  /// In en, this message translates to:
  /// **'Reminder interval'**
  String get reminderInterval;

  /// No description provided for @defaultActivityDuration.
  ///
  /// In en, this message translates to:
  /// **'Default activity duration'**
  String get defaultActivityDuration;

  /// No description provided for @activeHours.
  ///
  /// In en, this message translates to:
  /// **'Active hours'**
  String get activeHours;

  /// No description provided for @startTime.
  ///
  /// In en, this message translates to:
  /// **'Start time'**
  String get startTime;

  /// No description provided for @endTime.
  ///
  /// In en, this message translates to:
  /// **'End time'**
  String get endTime;

  /// No description provided for @activeDays.
  ///
  /// In en, this message translates to:
  /// **'Active days'**
  String get activeDays;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @sound.
  ///
  /// In en, this message translates to:
  /// **'Sound'**
  String get sound;

  /// No description provided for @vibration.
  ///
  /// In en, this message translates to:
  /// **'Vibration'**
  String get vibration;

  /// No description provided for @autoOpenExternalContent.
  ///
  /// In en, this message translates to:
  /// **'Auto-open external content'**
  String get autoOpenExternalContent;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 min} other{{count} min}}'**
  String minutes(int count);

  /// No description provided for @intervalValidation.
  ///
  /// In en, this message translates to:
  /// **'Reminder interval must be greater than zero.'**
  String get intervalValidation;

  /// No description provided for @durationValidation.
  ///
  /// In en, this message translates to:
  /// **'Activity duration must be greater than zero.'**
  String get durationValidation;

  /// No description provided for @timeValidation.
  ///
  /// In en, this message translates to:
  /// **'Start and end time must be valid.'**
  String get timeValidation;

  /// No description provided for @activeDaysValidation.
  ///
  /// In en, this message translates to:
  /// **'Select at least one active day when reminders are enabled.'**
  String get activeDaysValidation;

  /// No description provided for @completedToday.
  ///
  /// In en, this message translates to:
  /// **'Completed today'**
  String get completedToday;

  /// No description provided for @activeMinutesToday.
  ///
  /// In en, this message translates to:
  /// **'Active minutes today'**
  String get activeMinutesToday;

  /// No description provided for @completionRate.
  ///
  /// In en, this message translates to:
  /// **'Completion rate'**
  String get completionRate;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @skipped.
  ///
  /// In en, this message translates to:
  /// **'Skipped'**
  String get skipped;

  /// No description provided for @expired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get expired;

  /// No description provided for @manual.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get manual;

  /// No description provided for @reminder.
  ///
  /// In en, this message translates to:
  /// **'Reminder'**
  String get reminder;

  /// No description provided for @activityDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get activityDuration;

  /// No description provided for @instructions.
  ///
  /// In en, this message translates to:
  /// **'Instructions'**
  String get instructions;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @openContent.
  ///
  /// In en, this message translates to:
  /// **'Open content'**
  String get openContent;

  /// No description provided for @noActivitySelected.
  ///
  /// In en, this message translates to:
  /// **'No activity selected'**
  String get noActivitySelected;

  /// No description provided for @noHistoryYet.
  ///
  /// In en, this message translates to:
  /// **'No sessions yet'**
  String get noHistoryYet;

  /// No description provided for @noNextReminder.
  ///
  /// In en, this message translates to:
  /// **'No reminder scheduled'**
  String get noNextReminder;

  /// No description provided for @remindersEnabled.
  ///
  /// In en, this message translates to:
  /// **'Reminders enabled'**
  String get remindersEnabled;

  /// No description provided for @remindersDisabled.
  ///
  /// In en, this message translates to:
  /// **'Reminders disabled'**
  String get remindersDisabled;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @mobility.
  ///
  /// In en, this message translates to:
  /// **'Mobility'**
  String get mobility;

  /// No description provided for @strength.
  ///
  /// In en, this message translates to:
  /// **'Strength'**
  String get strength;

  /// No description provided for @cardio.
  ///
  /// In en, this message translates to:
  /// **'Cardio'**
  String get cardio;

  /// No description provided for @breathing.
  ///
  /// In en, this message translates to:
  /// **'Breathing'**
  String get breathing;

  /// No description provided for @timerExpired.
  ///
  /// In en, this message translates to:
  /// **'Timer expired'**
  String get timerExpired;

  /// No description provided for @settingsSaved.
  ///
  /// In en, this message translates to:
  /// **'Settings saved'**
  String get settingsSaved;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sunday;

  /// No description provided for @timeToMoveTitle.
  ///
  /// In en, this message translates to:
  /// **'Time to move'**
  String get timeToMoveTitle;

  /// No description provided for @movementRemindersChannelName.
  ///
  /// In en, this message translates to:
  /// **'Movement reminders'**
  String get movementRemindersChannelName;

  /// No description provided for @movementRemindersChannelDescription.
  ///
  /// In en, this message translates to:
  /// **'ActiveNudge movement reminder notifications'**
  String get movementRemindersChannelDescription;

  /// No description provided for @timeToMoveMessage.
  ///
  /// In en, this message translates to:
  /// **'Try: {activityTitle} · {minutes} min'**
  String timeToMoveMessage(String activityTitle, int minutes);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
