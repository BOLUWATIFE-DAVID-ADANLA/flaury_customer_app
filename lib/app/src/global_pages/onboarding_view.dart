import 'dart:async';

import 'package:flaury_mobile/app/services/secure_storage.dart';
import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flaury_mobile/app/util/app_text_style.dart';
import 'package:flaury_mobile/app/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flaury_mobile/app/shared/onboarding_pages.dart';
import 'package:flaury_mobile/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends ConsumerStatefulWidget {
  const OnboardingView({super.key});

  @override
  ConsumerState<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<OnboardingView> {
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
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            children: const [
              OnboardingPage(
                  image: onboard1,
                  title: "Great Look Isn't By Accident But by Appointment"),
              OnboardingPage(
                image: onboard2,
                title:
                    'Hire Your preferred Beauty Service Provider in Minutes!',
              ),
              OnboardingPage(
                image: onboard3,
                title: 'Discover, Book, and Pay for Your Favorite Services.',
              ),
            ],
          ),
          //
          // scroll indicator
          //
          Positioned(
            top: SizeConfig.fromDesignHeight(context, 695),
            left: SizeConfig.fromDesignWidth(context, 160),
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
            top: SizeConfig.fromDesignHeight(context, 720),
            left: SizeConfig.fromDesignWidth(context, 30),
            right: SizeConfig.fromDesignWidth(context, 30),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.registerCustomerView);
                ref
                    .read(sharedprefrenceProvider)
                    .setBool('hasViewdOnboarding', true);
              },
              child: Container(
                width: SizeConfig.fromDesignWidth(context, 320),
                height: SizeConfig.fromDesignWidth(context, 52),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Center(
                    child: AppTextBold(
                  text: 'Continue',
                  fontSize: 16,
                  color: AppColors.white,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
