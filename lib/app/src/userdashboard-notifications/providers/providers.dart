import 'package:flaury_mobile/app/src/userdashboard-notifications/notifiers/bottom_nav_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomNavProvider =
    StateNotifierProvider.autoDispose<BottomNavNotifier, BottomNavState>(
  (ref) => BottomNavNotifier(),
);
