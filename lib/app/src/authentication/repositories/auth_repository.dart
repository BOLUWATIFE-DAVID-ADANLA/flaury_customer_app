import 'package:dio/dio.dart';
import 'package:flaury_mobile/app/src/authentication/models/login_response_model.dart';
import 'package:flaury_mobile/app/src/authentication/models/register_user_model.dart';
import 'package:flaury_mobile/app/src/authentication/models/user_model.dart';
import 'package:flaury_mobile/app/util/api_routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/dio.dart';

final authrepositoryProvider = Provider<AuthRepository>(
    (ref) => AuthRepositoryImpl(ref.read(dioServiceProvider)));

class AuthRepositoryImpl implements AuthRepository {
  final DioService _dioService;
  AuthRepositoryImpl(this._dioService);

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
        "gender": gender
      };

      final response = await _dioService.post(ApiRoutes.signUp, data: data);

      print(response);
      print(response['response data']);

      if (response.isEmpty ||
          response['response status'] == null ||
          response['response description'] == null) {
        throw CustomException("Invalid server response format");
      }
      // Handle error response
      if (response["response status"] == "error") {
        final errorMessage = response["error details"] ?? "Registration failed";
        print(errorMessage);
        throw CustomException(_getUserFriendlyError(errorMessage));
      }

      return RegisterResponse.fromJson(response);
    } on DioException catch (e) {
      debugPrint("Network error: $e");
      throw CustomException(_getNetworkError(e));
    } on CustomException {
      rethrow;
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred during registration");
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
      throw CustomException("An unexpected error occurred");
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

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "Forgot password failed");
      }

      return LoginResponse.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
    }
  }

  @override
  Future<LogoutResponseModel> logout() async {
    try {
      final response = await _dioService.post(
        ApiRoutes.logout,
      );

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "logout failed");
      }

      return LogoutResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
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

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "refresh token failed");
      }

      return ApiResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
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

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "refresh token failed");
      }

      return ApiResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
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

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "reset password  failed");
      }

      return ApiResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
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

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "verify email failed");
      }

      return ApiResponseModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
    }
  }

  @override
  Future<UserModel> verifyUserIsAuthenticated() async {
    try {
      final response = await _dioService.post(
        ApiRoutes.verifyUserAuth,
      );

      if (response["response status"] != "success") {
        throw CustomException(
            response["response description"] ?? "verify user auth failed");
      }

      return UserModel.fromJson(response);
    } catch (e, s) {
      debugPrint("Unexpected error: $e");
      debugPrint(s.toString());
      throw CustomException("An unexpected error occurred");
    }
  }
}

String _getNetworkError(DioException e) {
  if (e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.sendTimeout) {
    return "Connection timeout. Please check your internet and try again";
  } else if (e.type == DioExceptionType.connectionError) {
    return "No internet connection. Please check your network";
  } else if (e.response?.statusCode == 500) {
    return "Server error. Please try again later";
  }
  return "Network error occurred. Please try again";
}

// Helper method to translate server errors to user-friendly messages
String _getUserFriendlyError(String serverError) {
  const errorMap = {
    "Email already registered": "This email is already in use",
    "Invalid email format": "Please enter a valid email address",
    "Password too weak": "Password must be at least 8 characters long",
    // Add more mappings as needed
  };

  return errorMap[serverError] ?? serverError;
}

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
  Future<UserModel> verifyUserIsAuthenticated();
}
