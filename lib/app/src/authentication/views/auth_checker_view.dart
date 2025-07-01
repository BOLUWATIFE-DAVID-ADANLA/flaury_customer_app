import 'package:flaury_mobile/app/shared/circular_loading_widget.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/views/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/user_controller.dart';
import '../models/auth_ckeck_response.dart';
import 'sigin_in.dart';

class AuthCheckerView extends ConsumerWidget {
  const AuthCheckerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<AuthCheckResponse> authCheck = ref.watch(authcheckProvider);
    return authCheck.when(
      data: (data) {
        if (data.responseStatus == true) {
          return const DashboardView(); // User is authenticated, show nothing
        } else {
          return const SignInView();

          // User is not authenticated, show nothing
        }
      },
      loading: () => const Scaffold(body: CircularLoadingWidget()),
      error: (error, stack) => const SignInView(),
    );
  }
}
