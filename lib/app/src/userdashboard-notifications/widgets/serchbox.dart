import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flutter/material.dart';

class HomeSearchBox extends StatelessWidget {
  final Function()? ontap;
  const HomeSearchBox({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.fromDesignWidth(context, 24)),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.fromDesignWidth(context, 16)),
          height: SizeConfig.fromDesignHeight(context, 42),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: AppColors.white),
          child: Row(
            children: [
              const Icon(
                Icons.search_rounded,
                color: AppColors.black,
              ),
              SizedBox(
                width: SizeConfig.fromDesignWidth(context, 10),
              ),
              AppTextRegular(
                  text: 'Search', fontSize: 16, color: AppColors.black),
            ],
          ),
        ),
      ),
    );
  }
}
