import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key, required this.icon, this.ontap});
  final VoidCallback? ontap;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: SizeConfig.fromDesignWidth(context, 20),
          top: SizeConfig.fromDesignHeight(context, 5)),
      padding: EdgeInsets.all(SizeConfig.fromDesignHeight(context, 17)),
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
      child: SvgAssetsicons(
        svg: icon,
        ontap: ontap,
        height: SizeConfig.fromDesignHeight(context, 20),
      ),
    );
  }
}
