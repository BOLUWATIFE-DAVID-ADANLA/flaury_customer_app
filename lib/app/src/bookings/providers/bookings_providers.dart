import 'package:flaury_mobile/app/src/bookings/notifiers/booking_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remindMeToggleProvider =
    StateNotifierProvider<RemindMeToggleNotifier, RemindMeToggleState>(
  (ref) => RemindMeToggleNotifier(),
);
