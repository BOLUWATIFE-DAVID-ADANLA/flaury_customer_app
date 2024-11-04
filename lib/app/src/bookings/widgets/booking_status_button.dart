import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flutter/material.dart';

class BookingButton extends StatelessWidget {
  final String label;
  final Color color, textcolor;
  final VoidCallback? ontap;
  const BookingButton(
      {super.key,
      this.label = '',
      this.color = AppColors.primary,
      this.ontap,
      this.textcolor = AppColors.white});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            color: color),
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.fromDesignHeight(context, 10),
            horizontal: SizeConfig.fromDesignWidth(context, 15)),
        child: AppTextSemiBold(
          text: label,
          fontSize: 14,
          color: textcolor,
        ),
      ),
    );
  }
}
