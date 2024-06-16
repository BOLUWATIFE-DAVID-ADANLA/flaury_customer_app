import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final passwordvisible = ChangeNotifierProvider((ref) => Passwordvisible());
final passwordsvisible = ChangeNotifierProvider((ref) => Visibilitynew());
final confirmvisible = ChangeNotifierProvider((ref) => Visibilityconfirm());

class Passwordvisible extends ChangeNotifier {
  bool _isPasswordVisible = true;
  bool get isPasswordVisible => _isPasswordVisible;

  void visiblePassword() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}

class Visibilitynew extends ChangeNotifier {
  bool _isPasswordVisible = true;
  bool get isPasswordVisible => _isPasswordVisible;

  void visiblePassword() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}

class Visibilityconfirm extends ChangeNotifier {
  bool _isPasswordVisible = true;
  bool get isPasswordVisible => _isPasswordVisible;

  void visiblePassword() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}
