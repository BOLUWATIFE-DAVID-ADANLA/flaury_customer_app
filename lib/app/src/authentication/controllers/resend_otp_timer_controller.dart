import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResendTimerState {
  final int secondsLeft;
  final bool canResend;

  const ResendTimerState({
    required this.secondsLeft,
    required this.canResend,
  });

  factory ResendTimerState.initial() =>
      const ResendTimerState(secondsLeft: 0, canResend: true);

  ResendTimerState copyWith({int? secondsLeft, bool? canResend}) {
    return ResendTimerState(
      secondsLeft: secondsLeft ?? this.secondsLeft,
      canResend: canResend ?? this.canResend,
    );
  }
}

// provider
final resendTimerProvider =
    StateNotifierProvider<ResendTimerController, ResendTimerState>(
  (ref) => ResendTimerController(),
);

class ResendTimerController extends StateNotifier<ResendTimerState> {
  Timer? _timer;
  static const int cooldown = 30;

  ResendTimerController() : super(ResendTimerState.initial());

  void start() {
    if (!state.canResend) return;

    state = const ResendTimerState(secondsLeft: cooldown, canResend: false);

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final timeLeft = state.secondsLeft - 1;

      if (timeLeft <= 0) {
        timer.cancel();
        state = state.copyWith(secondsLeft: 0, canResend: true);
      } else {
        state = state.copyWith(secondsLeft: timeLeft);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
