import 'package:flutter/material.dart';

class Passwordvisible extends ChangeNotifier {
  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void visiblePassword() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}

class Visibilitynew extends ChangeNotifier {
  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void visiblePassword() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}

class Visibilityconfirm extends ChangeNotifier {
  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void visiblePassword() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}
