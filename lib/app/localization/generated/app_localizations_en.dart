// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'ActiveNudge';

  @override
  String get reminders => 'Reminders';

  @override
  String get active => 'Active';

  @override
  String get inactive => 'Inactive';

  @override
  String get nextReminder => 'Next reminder';

  @override
  String get suggestedActivity => 'Suggested activity';

  @override
  String get startNow => 'Start now';

  @override
  String get settings => 'Settings';

  @override
  String get history => 'History';

  @override
  String get activities => 'Activities';

  @override
  String get newActivity => 'New activity';

  @override
  String get editActivity => 'Edit activity';

  @override
  String get createActivity => 'Create activity';

  @override
  String get updateActivity => 'Update activity';

  @override
  String get titleEnglish => 'Title in English';

  @override
  String get titlePortuguese => 'Title in Portuguese';

  @override
  String get descriptionEnglish => 'Description in English';

  @override
  String get descriptionPortuguese => 'Description in Portuguese';

  @override
  String get instructionsEnglish => 'Instructions in English';

  @override
  String get instructionsPortuguese => 'Instructions in Portuguese';

  @override
  String get category => 'Category';

  @override
  String get intensity => 'Intensity';

  @override
  String get contentType => 'Content type';

  @override
  String get textContent => 'Text';

  @override
  String get imageContent => 'Image';

  @override
  String get externalLinkContent => 'External link';

  @override
  String get externalVideoContent => 'External video';

  @override
  String get urlOptional => 'URL, optional';

  @override
  String get imageOptional => 'Image, optional';

  @override
  String get chooseImage => 'Choose image';

  @override
  String get removeImage => 'Remove image';

  @override
  String get isActive => 'Active';

  @override
  String get edit => 'Edit';

  @override
  String get titleEnRequired => 'English title is required.';

  @override
  String get titlePtRequired => 'Portuguese title is required.';

  @override
  String get urlInvalid => 'Enter a valid http or https URL.';

  @override
  String get imageRequired => 'Choose an image for image content.';

  @override
  String get language => 'Language';

  @override
  String get systemDefault => 'System default';

  @override
  String get english => 'English';

  @override
  String get portuguese => 'Português';

  @override
  String get reminderInterval => 'Reminder interval';

  @override
  String get defaultActivityDuration => 'Default activity duration';

  @override
  String get activeHours => 'Active hours';

  @override
  String get startTime => 'Start time';

  @override
  String get endTime => 'End time';

  @override
  String get activeDays => 'Active days';

  @override
  String get notifications => 'Notifications';

  @override
  String get sound => 'Sound';

  @override
  String get vibration => 'Vibration';

  @override
  String get autoOpenExternalContent => 'Auto-open external content';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String minutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count min',
      one: '1 min',
    );
    return '$_temp0';
  }

  @override
  String get intervalValidation =>
      'Reminder interval must be greater than zero.';

  @override
  String get durationValidation =>
      'Activity duration must be greater than zero.';

  @override
  String get timeValidation => 'Start and end time must be valid.';

  @override
  String get activeDaysValidation =>
      'Select at least one active day when reminders are enabled.';

  @override
  String get completedToday => 'Completed today';

  @override
  String get activeMinutesToday => 'Active minutes today';

  @override
  String get completionRate => 'Completion rate';

  @override
  String get completed => 'Completed';

  @override
  String get skipped => 'Skipped';

  @override
  String get expired => 'Expired';

  @override
  String get manual => 'Manual';

  @override
  String get reminder => 'Reminder';

  @override
  String get activityDuration => 'Duration';

  @override
  String get instructions => 'Instructions';

  @override
  String get start => 'Start';

  @override
  String get pause => 'Pause';

  @override
  String get resume => 'Resume';

  @override
  String get complete => 'Complete';

  @override
  String get skip => 'Skip';

  @override
  String get openContent => 'Open content';

  @override
  String get noActivitySelected => 'No activity selected';

  @override
  String get noHistoryYet => 'No sessions yet';

  @override
  String get noNextReminder => 'No reminder scheduled';

  @override
  String get remindersEnabled => 'Reminders enabled';

  @override
  String get remindersDisabled => 'Reminders disabled';

  @override
  String get low => 'Low';

  @override
  String get medium => 'Medium';

  @override
  String get high => 'High';

  @override
  String get mobility => 'Mobility';

  @override
  String get strength => 'Strength';

  @override
  String get cardio => 'Cardio';

  @override
  String get breathing => 'Breathing';

  @override
  String get timerExpired => 'Timer expired';

  @override
  String get settingsSaved => 'Settings saved';

  @override
  String get monday => 'Mon';

  @override
  String get tuesday => 'Tue';

  @override
  String get wednesday => 'Wed';

  @override
  String get thursday => 'Thu';

  @override
  String get friday => 'Fri';

  @override
  String get saturday => 'Sat';

  @override
  String get sunday => 'Sun';

  @override
  String get timeToMoveTitle => 'Time to move';

  @override
  String get movementRemindersChannelName => 'Movement reminders';

  @override
  String get movementRemindersChannelDescription =>
      'ActiveNudge movement reminder notifications';

  @override
  String timeToMoveMessage(String activityTitle, int minutes) {
    return 'Try: $activityTitle · $minutes min';
  }
}
