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

final authTokenManagerProvider = Provider<AuthTokenManager>(
    (ref) => AuthTokenManager(secureStorage: ref.read(secureStorageProvider)));

class AuthTokenManager {
  final SecureStorage secureStorage;

  AuthTokenManager({required this.secureStorage});

  String get authToken => "auth_token";

  String get refreshToken => "Refresh_token";

  Future<void> saveAuthToken(String token) async {
    await secureStorage.write('auth_token', token);
  }

  Future<String?> getAuthToken() async {
    return await secureStorage.read('auth_token');
  }

  Future<void> deleteAuthToken() async {
    await secureStorage.delete('Refresh_token');
  }

  Future<void> saveRefreshAuthToken(String token) async {
    await secureStorage.write('Refresh_token', token);
  }

  Future<String?> getRefreshAuthToken() async {
    return await secureStorage.read('Refresh_token');
  }

  Future<void> deleteRefreshAuthToken() async {
    await secureStorage.delete('Refresh_token');
  }
}
