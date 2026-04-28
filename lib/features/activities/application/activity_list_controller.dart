import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../domain/entities/activity.dart';

final activityByIdProvider = FutureProvider.family<Activity?, String>((
  ref,
  stableId,
) async {
  final repository = await ref.watch(activityRepositoryProvider.future);
  return repository.getByStableId(stableId);
});
