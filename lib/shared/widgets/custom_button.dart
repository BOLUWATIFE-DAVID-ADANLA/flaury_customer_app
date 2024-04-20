
import 'package:flaury_mobile/shared/app_colors.dart';
import 'package:flaury_mobile/shared/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({super.key, required this.label, required this.ontap});
  final String label;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 52.h,
        width: 315.w,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: AppColors.primary),
        child: Center(
            child: Text(
          label,
          style: AppText.wbold16,
        )),
      ),
    );
  }
}

class LargeButon extends StatelessWidget {
  const LargeButon({super.key, required this.label, required this.ontap});
  final String label;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 52.h,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: AppColors.primary),
        child: Center(
            child: Text(
          label,
          style: AppText.wbold16,
        )),
      ),
    );
  }
}

class LargeButonDisabled extends StatelessWidget {
  const LargeButonDisabled(
      {super.key, required this.label, required this.ontap});
  final String label;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 52.h,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: AppColors.primarylight),
        child: Center(
            child: Text(
          label,
          style: AppText.wbold16,
        )),
      ),
    );
  }
}
