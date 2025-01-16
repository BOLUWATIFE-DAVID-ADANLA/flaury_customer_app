import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flaury_mobile/app/util/app_spacing.dart';
import 'package:flaury_mobile/app/util/app_text_style.dart';
import 'package:flaury_mobile/app/util/images_icons_illustration.dart';
import 'package:flutter/material.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key, this.ontap});
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        children: [
          const SvgAssets(svg: logout),
          const AppSpacing(h: 10),
          AppTextSemiBold(
            text: 'Log Out',
            fontSize: 14,
            color: AppColors.red,
          )
        ],
      ),
    );
  }
}
