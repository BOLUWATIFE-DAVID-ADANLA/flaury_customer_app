import 'package:flaury_mobile/app/src/authentication/models/login_response_model.dart';
import 'package:flaury_mobile/app/src/authentication/models/register_user_model.dart';
import 'package:flaury_mobile/app/src/authentication/models/auth_ckeck_response.dart';
import 'package:flaury_mobile/app/util/api_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/dio.dart';
import '../../../services/secure_storage.dart';

final authrepositoryProvider = Provider<AuthRepository>((ref) =>
    AuthRepositoryImpl(
        ref.read(dioServiceProvider), ref.read(authTokenManagerProvider)));

class AuthRepositoryImpl implements AuthRepository {
  final DioService _dioService;
  final AuthTokenManager _authTokenManager;
  AuthRepositoryImpl(this._dioService, this._authTokenManager);

  @override
  Future<RegisterResponse> signUp({
    required String email,
    required String password,
    required String name,
    required String userName,
    required String phonenumber,
    required String gender,
  }) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
        "name": name,
        "password": password,
        'phone_number': phonenumber,
        "role": "client",
        "type_of_service": "basic",
        'username': userName,
        "gender": gender,
      };

      final response = await _dioService.post(ApiRoutes.signUp, data: data);

      final registerResponse = RegisterResponse.fromJson(response);

      return registerResponse;
    } catch (e, s) {
      debugPrint("❗ Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException(e.toString());
    }
  }

// Helper method to handle Dio network errors

  @override
  Future<ApiResponseModel> forgotPassword(String email) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
      };

      final response =
          await _dioService.post(ApiRoutes.forgotPassword, data: data);

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "Forgot password failed");
      }

      return ApiResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException(e.toString());
    }
  }

  @override
  Future<LoginResponse> login(
      {required String email, required String password}) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
        "password": password,
      };

      final response = await _dioService.post(ApiRoutes.login, data: data);

      return LoginResponse.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException(e.toString());
    }
  }

  @override
  Future<LogoutResponseModel> logout() async {
    try {
      final response = await _dioService.post(
        ApiRoutes.logout,
      );

      return LogoutResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException(e.toString());
    }
  }

  @override
  Future<ApiResponseModel> refreshAccessToken() async {
    // you have to pass the refresh token in the header
    // and the refresh token is stored in the local storage
    try {
      final response = await _dioService.post(
        ApiRoutes.refreshAccessToken,
      );

      return ApiResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException(e.toString());
    }
  }

  @override
  Future<ApiResponseModel> resendVerifcationCode(String email) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
      };
      final response = await _dioService.post(
        ApiRoutes.resendVerifcationCode,
        data: data,
      );

      return ApiResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException(e.toString());
    }
  }

  @override
  Future<ApiResponseModel> resetPassword(
      {required String email,
      required String newPassword,
      required String verificationCode}) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
        "new_password": newPassword,
        "verification_code": verificationCode,
      };
      final response = await _dioService.post(
        ApiRoutes.resetPassword,
        data: data,
      );

      return ApiResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException(e.toString());
    }
  }

  @override
  Future<ApiResponseModel> verifyEmail(String email, String code) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
        "code": code,
      };
      final response = await _dioService.post(
        ApiRoutes.verifyEmail,
        data: data,
      );

      return ApiResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException(e.toString());
    }
  }

  @override
  Future<AuthCheckResponse> verifyUserIsAuthenticated() async {
    final accessToken = await _authTokenManager.getAuthToken();
    debugPrint('Token: $accessToken');
    try {
      final response = await _dioService.get(
        ApiRoutes.verifyUserAuth,
        sessionToken: accessToken,
      );

      return AuthCheckResponse.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException(e.toString());
    }
  }
}

// Helper method to translate server errors to user-friendly messages

abstract class AuthRepository {
  Future<RegisterResponse> signUp(
      {required String email,
      required String password,
      required String name,
      required String userName,
      required String phonenumber,
      required String gender});
  Future<LogoutResponseModel> logout();
  Future<LoginResponse> login(
      {required String email, required String password});

  Future<ApiResponseModel> refreshAccessToken();
  Future<ApiResponseModel> forgotPassword(String email);
  Future<ApiResponseModel> resendVerifcationCode(String email);
  Future<ApiResponseModel> resetPassword(
      {required String email,
      required String newPassword,
      required String verificationCode});
  Future<ApiResponseModel> verifyEmail(String email, String code);
  Future<AuthCheckResponse> verifyUserIsAuthenticated();
}
