import 'package:flaury_mobile/app/src/authentication/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/auth_repository.dart';

class AuthCheckState {
  final UserModel? user;
  final bool isLoading;
  final String? error;

  const AuthCheckState({
    this.user,
    this.isLoading = false,
    this.error,
  });

  AuthCheckState copyWith({
    UserModel? user,
    bool? isLoading,
    String? error,
  }) {
    return AuthCheckState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

final userControllerProvider =
    StateNotifierProvider<UserController, AuthCheckState>((ref) {
  return UserController(
    ref.read(authrepositoryProvider),
  );
});

class UserController extends StateNotifier<AuthCheckState> {
  final AuthRepository _authRepository;

  UserController(
    this._authRepository,
  ) : super(const AuthCheckState());

  Future<void> fetchUser() async {
    state = state.copyWith(isLoading: true);
    try {
      final user = await _authRepository.verifyUserIsAuthenticated();
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  void clearUser() {
    state = const AuthCheckState();
  }
}
