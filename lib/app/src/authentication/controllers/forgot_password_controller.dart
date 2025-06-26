import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/auth_repository.dart';

enum Status {
  inital,
  loading,
  error,
  success,
}

class ResendForgotpasswordCodeState {
  final Status status;
  final String message;

  ResendForgotpasswordCodeState({
    required this.status,
    this.message = '',
  });

  factory ResendForgotpasswordCodeState.initial() {
    return ResendForgotpasswordCodeState(
      status: Status.inital,
      message: '',
    );
  }

  factory ResendForgotpasswordCodeState.loading() {
    return ResendForgotpasswordCodeState(
      status: Status.loading,
      message: '',
    );
  }
  factory ResendForgotpasswordCodeState.error(String message) {
    return ResendForgotpasswordCodeState(
      status: Status.error,
      message: message,
    );
  }
  factory ResendForgotpasswordCodeState.success(String message) {
    return ResendForgotpasswordCodeState(
      status: Status.success,
      message: message,
    );
  }
}

final resendForgotpasswordCodeProvider = StateNotifierProvider<
    ResendForgotpasswordCodeController, ResendForgotpasswordCodeState>(
  (ref) =>
      ResendForgotpasswordCodeController(ref.watch(authrepositoryProvider)),
);

class ResendForgotpasswordCodeController
    extends StateNotifier<ResendForgotpasswordCodeState> {
  final AuthRepository _authRepository;
  ResendForgotpasswordCodeController(this._authRepository)
      : super(ResendForgotpasswordCodeState.initial());

  Future<void> resendVerificationOtp(String email) async {
    state = ResendForgotpasswordCodeState.loading();
    try {
      final response = await _authRepository.forgotPassword(email);
      state = ResendForgotpasswordCodeState.success(response.data);
    } catch (e) {
      state = ResendForgotpasswordCodeState.error(e.toString());
    }
  }
}
