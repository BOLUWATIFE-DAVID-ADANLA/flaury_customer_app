import 'package:flaury_mobile/app/src/authentication/views/create_new_password.dart';
import 'package:flaury_mobile/app/src/authentication/views/forgot_password.dart';
import 'package:flaury_mobile/app/src/authentication/views/register_customer_view.dart';
import 'package:flaury_mobile/app/src/authentication/views/sigin_in.dart';
import 'package:flaury_mobile/app/src/onboarding_view.dart';
import 'package:flaury_mobile/app/src/splashscreen.dart';
import 'package:flaury_mobile/app/routes/app_routes.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/views/dashboard.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/views/homepage.dart';
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
      case AppRoutes.otpScreen:
        return MaterialPageRoute(
          builder: (_) => const OtpScreen(),
          settings: settings,
        );

      case AppRoutes.changePassowrdView:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordView(),
          settings: settings,
        );
      case AppRoutes.homepage:
        return MaterialPageRoute(
          builder: (_) => const HomepageView(),
          settings: settings,
        );

      case AppRoutes.dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardView(),
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
