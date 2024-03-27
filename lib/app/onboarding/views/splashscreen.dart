
import 'package:flaury_mobile/routes/app_routes.dart';
import 'package:flaury_mobile/shared/app_colors.dart';
import 'package:flaury_mobile/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, AppRoutes.onboardingView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'FLAURY',
              style: AppText.splashbold60,
            ),
          )
        ],
      ),
    );
  }
}
