
import 'package:flaury_mobile/shared/app_spacing.dart';
import 'package:flaury_mobile/shared/app_text_style.dart';
import 'package:flutter/material.dart';

Widget onboardingPage({String image = '', String title = ''}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 2,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      AppSpacing.h30(),
      AppSpacing.h20(),
      Expanded(
        flex: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Text(
            title,
            style: AppText.bold24,
            textAlign: TextAlign.start,
          ),
        ),
      ),
    ],
  );
}
