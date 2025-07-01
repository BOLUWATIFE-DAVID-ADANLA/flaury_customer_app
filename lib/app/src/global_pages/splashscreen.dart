import 'dart:async';

import 'package:flaury_mobile/app/services/secure_storage.dart';
import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flaury_mobile/app/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreenView extends ConsumerStatefulWidget {
  const SplashScreenView({super.key});

  @override
  ConsumerState<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends ConsumerState<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      bool? onboardingStatus =
          await ref.read(sharedprefrenceProvider).getBool('hasViewdOnboarding');
      bool hasSeenOnboarding = onboardingStatus == true;

      if (hasSeenOnboarding) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, AppRoutes.authchecker);
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, AppRoutes.onboardingView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SvgAssets(
            svg: logo,
            height: 131,
          ))
        ],
      ),
    );
  }
}
