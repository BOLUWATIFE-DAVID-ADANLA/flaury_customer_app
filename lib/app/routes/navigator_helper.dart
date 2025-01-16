import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final navigatorhelperProvider = Provider<NavigatorHelper>((ref) {
  return NavigatorHelper();
});

class NavigatorHelper {
  GlobalKey<ScaffoldMessengerState> scafflodMessangerKey =
      GlobalKey<ScaffoldMessengerState>();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // static dynamic pushTo({
  //   dynamic arguments,
  //   Widget? page,
  //   String? route,
  // }) {
  //   if (route != null) {
  //     navigatorKey.currentState
  //         ?.pushReplacementNamed(route, arguments: arguments);
  //   } else if (page != null) {
  //     navigatorKey.currentState?.pushReplacement(
  //       MaterialPageRoute(builder: (_) => page),
  //     );
  //   } else {
  //     throw ArgumentError('Either routeName or page must be provided.');
  //   }
  // }

  // static dynamic pop() {
  //   navigatorKey.currentState?.pop();
  // }
}
