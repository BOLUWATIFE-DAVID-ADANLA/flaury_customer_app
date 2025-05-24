import 'package:flaury_mobile/app/src/authentication/models/user_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repositories/auth_repository.dart';

class UserState {
  final UserModel? user;
  final bool isLoading;
  final String? error;

  const UserState({
    this.user,
    this.isLoading = false,
    this.error,
  });

  UserState copyWith({
    UserModel? user,
    bool? isLoading,
    String? error,
  }) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

final userControllerProvider =
    StateNotifierProvider<UserController, UserState>((ref) {
  return UserController(ref.read(authrepositoryProvider));
});

class UserController extends StateNotifier<UserState> {
  final AuthRepository _authRepository;

  UserController(this._authRepository) : super(const UserState());

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
    state = const UserState();
  }
}
