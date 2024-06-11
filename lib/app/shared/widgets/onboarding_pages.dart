import 'package:flaury_mobile/app/shared/app_spacing.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.image, required this.title});
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppSpacing(h: 193),
              Container(
                alignment: Alignment.center,
                child: SvgAssets(
                  svg: image,
                  height: SizeConfig.fromDesignHeight(context, 300),
                  width: SizeConfig.fromDesignWidth(context, 300),
                ),
              ),
            ],
          ),
        ),
        Flexible(
            flex: 1,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.fromDesignWidth(context, 27)),
                child: AppTextBold(
                  text: title,
                  fontSize: 24,
                  textAlign: TextAlign.start,
                ))),
      ],
    );
  }
}
