import 'package:flaury_mobile/app/routes/navigator_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationServiceProvider = Provider<NavigationService>((ref) {
  final helper = ref.watch(navigatorhelperProvider);
  return NavigationService(helper);
});

class NavigationService {
  final NavigatorHelper helper;
  NavigationService(this.helper);

  Future<dynamic> pushTo({
    String? route,
    Widget? page,
    dynamic arguments,
  }) {
    final context = helper.navigatorKey.currentState;
    if (context == null) {
      debugPrint('Error: Navigator context is null. Unable to show SnackBar.');
      throw Exception('there was an error here ');
    }
    if (route != null) {
      return context.pushNamed(route, arguments: arguments);
    } else if (page != null) {
      return context.push(
        MaterialPageRoute(builder: (_) => page),
      );
    } else {
      throw ArgumentError('Either route or page must be provided.');
    }
  }

  Future<dynamic> pushReplacement({
    String? route,
    Widget? page,
    dynamic arguments,
  }) {
    final context = helper.navigatorKey.currentState;
    if (context == null) {
      debugPrint('Error: Navigator context is null. Unable to show SnackBar.');
      throw Exception('there was an error here ');
    }
    if (route != null) {
      return context.pushReplacementNamed(route, arguments: arguments);
    } else if (page != null) {
      return context.pushReplacement(
        MaterialPageRoute(builder: (_) => page),
      );
    } else {
      throw ArgumentError('Either route or page must be provided.');
    }
  }

  dynamic pop() {
    final context = helper.navigatorKey.currentState;
    if (context == null) {
      debugPrint('Error: Navigator context is null. Unable to show SnackBar.');
      throw Exception('there was an error here ');
    }
    context.pop();
  }
}
