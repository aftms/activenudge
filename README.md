# ActiveNudge

ActiveNudge is an offline-first Flutter application that helps people stay active during the day with small recurring movement breaks such as stretching, light squats, walking in place, mobility pauses, and breathing/posture resets.

The first version targets **Android** and **Windows desktop**. iOS, macOS, and Web are intentionally not implemented in v1, but the domain and application layers avoid platform-specific dependencies so future platform support can be added without a structural rewrite.

## Stack

- Flutter 3.41.8 / Dart 3.11.5
- Material 3
- Riverpod for state management
- GoRouter for named navigation
- Isar DB Community for local persistence
- flutter_local_notifications for local notifications
- flutter_localizations, intl, and ARB files for internationalization
- url_launcher for external links
- file_picker for user-selected activity images
- build_runner, Isar generator, freezed/json_serializable dependencies for code generation support

The selected packages are free/open-source and suitable for commercial use. `isar_community` is Apache-2.0 and was selected over the older official Isar package because it is actively maintained and compatible with current Flutter/Dart.

## Architecture

The app is organized by feature under `lib/features/`, with each major module split into:

- `domain/`: entities, enums, repository contracts, pure services
- `application/`: controllers and use-case orchestration
- `data/`: Isar models and repository implementations
- `presentation/`: screens and widgets

Shared cross-cutting code lives under `lib/core/` and `lib/shared/`. Platform and plugin concerns are behind interfaces such as `NotificationService`, `ReminderScheduler`, `ActivityRepository`, `HistoryRepository`, `SettingsRepository`, `LinkOpenerService`, `DateTimeProvider`, `PlatformInfoService`, and `PermissionService`.

## Local Data

ActiveNudge does not use a backend, cloud database, Firebase, Supabase, or paid service. All user data is stored locally in an Isar database:

- Android: private app storage
- Windows: local application support data directory

The app works offline and does not require a user account.

## Activity Seed

The initial bilingual activity catalog is inserted by `ActivitySeedService` on first startup. The seed is idempotent and checks repository state before inserting, so activities are not duplicated across launches. Seed data is not stored in widgets.

Included activities:

- Neck stretch / Alongamento cervical
- Light squats / Agachamentos leves
- Walk in place / Caminhada no lugar
- Shoulder mobility / Mobilidade dos ombros
- Back stretch / Alongamento das costas
- Low-impact jumping jacks / Polichinelos leves
- Breathing and posture / Respiração e postura
- Wrist stretch / Alongamento dos punhos

Users can also create and edit activities from the Activities screen. Custom activities currently expose English and Portuguese fields in the UI, but the underlying activity model stores translations by language code so more languages can be added without adding new database columns such as `titleEs` or `titleFr`. Custom activities support duration, category, intensity, content type, optional URLs for external links or videos, optional local images, and active/inactive status. Selected images are copied into the app support directory and referenced from the local database.

## Setup

Install Flutter stable, then run:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

In this workspace, Flutter was installed locally at:

```bash
C:\tmp\flutter\bin\flutter.bat
```

## Run

Android:

```bash
flutter run -d android
```

Windows:

```bash
flutter run -d windows
```

Windows plugin builds require Windows symlink support. Enable Developer Mode if Flutter reports a symlink error.

## Test

```bash
flutter analyze
flutter test
```

Current unit coverage includes:

- next reminder calculation
- settings validation
- daily history summary
- activity session state transitions
- suggested activity selection
- initial activity seed without duplication

## Platform Notes

Android supports local notifications and notification permission requests. ActiveNudge uses inexact scheduling in v1 to avoid exact-alarm permissions and store-policy friction.

Windows is an official v1 platform. `flutter_local_notifications` supports Windows notifications, but repeating notifications are limited; ActiveNudge calculates and schedules the next concrete reminder instead of relying on platform recurrence. Windows-specific notification limitations are contained in the notification adapter.

## Distribution Costs

The technical implementation has no recurring operating cost. Potential external distribution costs are separate from the app code:

- Google Play developer registration fee
- Microsoft Store registration or publishing-related fees if applicable
- Apple Developer Program fee if iOS/macOS are added later

## Next Technical Steps

- Add richer statistics through a separate `statistics` feature module.
- Add backup/export without changing domain entities.
- Add cloud sync later by introducing a remote data source behind existing repositories.
- Add iOS, macOS, or Web adapters only when those platforms become v1 targets.
