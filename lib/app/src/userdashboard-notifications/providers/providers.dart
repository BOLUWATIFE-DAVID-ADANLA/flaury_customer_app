import 'package:flaury_mobile/app/src/userdashboard-notifications/notifiers/bottom_nav_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavProvider =
    StateNotifierProvider.autoDispose<BottomNavNotifier, BottomNavState>(
  (ref) => BottomNavNotifier(),
);
