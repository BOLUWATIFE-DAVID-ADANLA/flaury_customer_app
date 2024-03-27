import 'package:flaury_mobile/app/customer/authentication/views/forgot_password.dart';
import 'package:flaury_mobile/app/customer/authentication/views/register_customer_view.dart';
import 'package:flaury_mobile/app/customer/authentication/views/sigin_in.dart';
import 'package:flaury_mobile/app/onboarding/views/onboarding_view.dart';
import 'package:flaury_mobile/app/onboarding/views/splashscreen.dart';
import 'package:flaury_mobile/app/onboarding/views/welcome_screen.dart';
import 'package:flaury_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';

class AppPages {
  static const initial = AppRoutes.forgotPassword;

  static Route<dynamic> ongenerateRoute(RouteSettings settings) {
    //general routes....(this are the general routes pecuiar to both customers and service providers)
    //
    switch (settings.name) {
      case AppRoutes.splashScreenView:
        return MaterialPageRoute(
          builder: (_) => const SplashScreenView(),
          settings: settings,
        );
      case AppRoutes.welcomeView:
        return MaterialPageRoute(
          builder: (_) => const Welcomeview(),
          settings: settings,
        );

      case AppRoutes.onboardingView:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
          settings: settings,
        );

      case AppRoutes.signupView:
        return MaterialPageRoute(
          builder: (_) => const SignInView(),
          settings: settings,
        );

      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordView(),
          settings: settings,
        );
      //customer routes (all the routes that define customers view of the application )
      case AppRoutes.registerCustomerView:
        return MaterialPageRoute(
          builder: (_) => const RegisterCustomerView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
          settings: settings,
        );
    }
  }
}
