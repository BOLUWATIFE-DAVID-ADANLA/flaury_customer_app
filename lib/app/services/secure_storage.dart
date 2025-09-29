import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final secureStorageProvider = Provider<SecureStorage>((ref) {
  return SecureStorage(
      strorage: const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  ));
});


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


final sharedprefrenceProvider =
    Provider<SharedPreferenceHelper>((ref) => SharedPreferenceHelper._instance);

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

  Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool?> deleteString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}

final authTokenManagerProvider =
    Provider<AuthTokenManager>((ref) => AuthTokenManager(
        secureStorage: ref.read(
          secureStorageProvider,
        ),
        preferenceHelper: ref.read(sharedprefrenceProvider)));

class AuthTokenManager {
  final SecureStorage secureStorage;
  final SharedPreferenceHelper preferenceHelper;

  AuthTokenManager(
      {required this.secureStorage, required this.preferenceHelper});

  String get authToken => "auth_token";

  String get refreshToken => "Refresh_token";

  Future<void> saveAuthToken(String token) async {
    await preferenceHelper.setString('auth_token', token);
  }

  Future<String?> getAuthToken() async {
    return await preferenceHelper.getString('auth_token');
  }

  Future<void> deleteAuthToken() async {
    await preferenceHelper.deleteString('auth_token');
  }

  Future<void> saveRefreshAuthToken(String token) async {
    await preferenceHelper.setString('Refresh_token', token);
  }

  Future<String?> getRefreshAuthToken() async {
    return await preferenceHelper.getString('Refresh_token');
  }

  Future<void> deleteRefreshAuthToken() async {
    await preferenceHelper.deleteString('Refresh_token');
  }
}
