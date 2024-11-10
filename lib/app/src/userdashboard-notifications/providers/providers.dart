import 'package:flaury_mobile/app/src/userdashboard-notifications/controllers/bottom_nav_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomNavProvider =
    StateNotifierProvider.autoDispose<BottomNavController, BottomNavState>(
  (ref) => BottomNavController(),
);
