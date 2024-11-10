import 'package:flaury_mobile/app/src/authentication/views/create_new_password.dart';
import 'package:flaury_mobile/app/src/authentication/views/forgot_password.dart';
import 'package:flaury_mobile/app/src/authentication/views/register_customer_view.dart';
import 'package:flaury_mobile/app/src/authentication/views/sigin_in.dart';
import 'package:flaury_mobile/app/src/global_pages/onboarding_view.dart';
import 'package:flaury_mobile/app/src/profile/views/about_page.dart';
import 'package:flaury_mobile/app/src/profile/views/change_profile_details_page.dart';
import 'package:flaury_mobile/app/src/global_pages/splashscreen.dart';
import 'package:flaury_mobile/app/routes/app_routes.dart';
import 'package:flaury_mobile/app/src/profile/views/faq_page.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/views/dashboard.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/views/homepage.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/views/notification_page.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/views/product_service_view.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/views/search_page.dart';
import 'package:flutter/material.dart';

class AppPages {
  static const initial = AppRoutes.splashScreenView;

  static Route<dynamic> ongenerateRoute(RouteSettings settings) {
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

      case AppRoutes.signInView:
        return MaterialPageRoute(
          builder: (_) => const SignInView(),
          settings: settings,
        );

      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordView(),
          settings: settings,
        );

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

      case AppRoutes.searchpage:
        return MaterialPageRoute(
          builder: (_) => const SearchPageView(),
          settings: settings,
        );

      case AppRoutes.notification:
        return MaterialPageRoute(
          builder: (_) => const NotificationPageView(),
          settings: settings,
        );

      case AppRoutes.changeProfiledetails:
        return MaterialPageRoute(
            builder: (_) => const ChangeProfileDetailsView(),
            settings: settings);

      case AppRoutes.faqPage:
        return MaterialPageRoute(
            builder: (_) => const FaqPage(), settings: settings);
      case AppRoutes.aboutPageView:
        return MaterialPageRoute(
            builder: (_) => const AboutPageView(), settings: settings);

      case AppRoutes.productServiceview:
        return MaterialPageRoute(
            builder: (_) => const ProductServiceView(), settings: settings);
      default:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
          settings: settings,
        );
    }
  }
}
