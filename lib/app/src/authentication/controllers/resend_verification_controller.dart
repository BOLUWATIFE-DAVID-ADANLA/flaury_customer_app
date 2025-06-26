import 'package:flaury_mobile/app/src/authentication/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Status {
  inital,
  loading,
  error,
  success,
}

class ResendVerificationState {
  final Status status;
  final String message;

  ResendVerificationState({
    required this.status,
    this.message = '',
  });

  factory ResendVerificationState.initial() {
    return ResendVerificationState(
      status: Status.inital,
      message: '',
    );
  }

  factory ResendVerificationState.loading() {
    return ResendVerificationState(
      status: Status.loading,
      message: '',
    );
  }
  factory ResendVerificationState.error(String message) {
    return ResendVerificationState(
      status: Status.error,
      message: message,
    );
  }
  factory ResendVerificationState.success(String message) {
    return ResendVerificationState(
      status: Status.success,
      message: message,
    );
  }
}

final resendverificationProvider = StateNotifierProvider<
        ResendVerificationController, ResendVerificationState>(
    (ref) => ResendVerificationController(ref.watch(
          authrepositoryProvider,
        )));

class ResendVerificationController
    extends StateNotifier<ResendVerificationState> {
  final AuthRepository authRepository;
  ResendVerificationController(this.authRepository)
      : super(ResendVerificationState.initial());

  Future<void> resendVerificationOtp(String email) async {
    state = ResendVerificationState.loading();
    try {
      final response = await authRepository.resendVerifcationCode(email);
      state = ResendVerificationState.success(response.data);
    } catch (e) {
      state = ResendVerificationState.error(e.toString());
    }
  }
}
