import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final passwordvisible = ChangeNotifierProvider((ref) => Passwordvisible());

class Passwordvisible extends ChangeNotifier {
  bool _isPasswordVisible = true;
  bool get isPasswordVisible => _isPasswordVisible;

  void visiblePassword() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}
