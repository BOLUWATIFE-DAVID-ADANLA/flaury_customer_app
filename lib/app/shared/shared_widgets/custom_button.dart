import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({super.key, required this.label, required this.ontap});
  final String label;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: SizeConfig.fromDesignHeight(context, 52),
        width: SizeConfig.fromDesignWidth(context, 315),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: AppColors.primary),
        child: Center(
            child: AppTextBold(
          text: label,
          fontSize: 16,
          color: AppColors.white,
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
        width: SizeConfig.fromDesignWidth(context, 360),
        height: SizeConfig.fromDesignHeight(context, 52),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: AppColors.primary),
        child: Center(
            child: AppTextBold(
          text: label,
          fontSize: 16,
          color: AppColors.white,
        )),
      ),
    );
  }
}

class LargeButonDisabled extends StatelessWidget {
  const LargeButonDisabled({
    super.key,
    required this.label,
    required this.ontap,
  });
  final String label;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: SizeConfig.fromDesignHeight(context, 52),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: AppColors.primarylight),
        child: Center(
            child: AppTextBold(
          text: label,
          fontSize: 16,
          color: AppColors.white,
        )),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton(
      {super.key,
      required this.label,
      required this.ontap,
      this.textcolor,
      this.color});
  final String label;
  final Function()? ontap;
  final Color? textcolor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: SizeConfig.fromDesignWidth(context, 111),
        height: SizeConfig.fromDesignHeight(context, 33),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: color),
        child: Center(
            child: AppTextBold(
          text: label,
          fontSize: 16,
          color: textcolor,
        )),
      ),
    );
  }
}
