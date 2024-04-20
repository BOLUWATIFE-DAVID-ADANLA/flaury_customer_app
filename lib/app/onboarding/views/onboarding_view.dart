import 'dart:async';

import 'package:flaury_mobile/routes/app_routes.dart';
import 'package:flaury_mobile/shared/app_colors.dart';
import 'package:flaury_mobile/shared/app_text_style.dart';
import 'package:flaury_mobile/util/images_icons_illustration.dart';
import 'package:flaury_mobile/shared/widgets/onboarding_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController controller;
  int _currentPage = 0;
  bool end = false;
  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: 0,
      viewportFraction: 1.0,
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer.periodic(const Duration(seconds: 2), (Timer timer) {
        if (_currentPage == 2) {
          end = true;
        } else if (_currentPage == 0) {
          end = false;
        }

        if (end == false) {
          _currentPage++;
        } else {
          _currentPage--;
        }

        controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeIn,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            children: [
              onboardingPage(
                  image: onboard1,
                  title: "Great Look Isn't By Accident but by Appointment"),
              onboardingPage(
                image: onboard2,
                title: 'Hire a Beauty Service \nProvider in Minutes!',
              ),
              onboardingPage(
                image: onboard3,
                title: 'Earn More Income by \nProviding your services',
              ),
            ],
          ),
          //
          // scroll indicator
          //
          Positioned(
            top: 680.h,
            left: 160.w,
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotHeight: 7,
                dotWidth: 7,
                dotColor: AppColors.primarylight,
                activeDotColor: AppColors.primary,
              ),
            ),
          ),
          //
          // continue button
          //
          Positioned(
            top: 700.h,
            left: 36.5.w,
            right: 36.5.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.welcomeView);
              },
              child: Container(
                width: 320.w,
                height: 52.h,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: AppText.wbold16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
