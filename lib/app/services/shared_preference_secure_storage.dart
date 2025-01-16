import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final secureStorageProvider = Provider<SecureStorage>((ref) {
  return SecureStorage(strorage: const FlutterSecureStorage());
});

final sharedprefrenceProvider =
    Provider<SharedPreferenceHelper>((ref) => SharedPreferenceHelper._instance);

class SecureStorage {
  final FlutterSecureStorage strorage;

  SecureStorage({required this.strorage});

  read(String key) async {
    await strorage.read(key: key) ?? 'noting to read ';
    debugPrint(key);
  }

  write(String key, dynamic value) async {
    await strorage.write(key: key, value: value);
    debugPrint(value);
  }

  deleteAll() async {
    await strorage.deleteAll();
  }

  delete(String key) async {
    await strorage.delete(key: key);
  }
}

final sharedPreferenceHelperProvider = Provider<SharedPreferenceHelper>((ref) {
  return SharedPreferenceHelper();
});

class SharedPreferenceHelper {
  // Private constructor
  SharedPreferenceHelper._internal();

  // Single instance
  static final SharedPreferenceHelper _instance =
      SharedPreferenceHelper._internal();

  // Factory constructor to return the same instance
  factory SharedPreferenceHelper() {
    return _instance;
  }

  Future<void> setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}
