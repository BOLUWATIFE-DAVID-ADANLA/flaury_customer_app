import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flaury_mobile/app/util/app_text_style.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
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
  const LargeButon(
      {super.key,
      required this.label,
      required this.ontap,
      this.isWhitebutton = false,
      this.isloading = false});
  final String label;
  final bool isloading;
  final Function()? ontap;
  final bool isWhitebutton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: SizeConfig.fromDesignWidth(context, 360),
        height: SizeConfig.fromDesignHeight(context, 52),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: AppColors.primary),
            color: isWhitebutton ? AppColors.background : AppColors.primary),
        child: isloading
            ? Center(
                child: SizedBox(
                height: SizeConfig.fromDesignHeight(context, 20),
                width: SizeConfig.fromDesignWidth(context, 20),
                child: const CircularProgressIndicator(
                  color: AppColors.white,
                ),
              ))
            : Center(
                child: AppTextBold(
                text: label,
                fontSize: 16,
                color: isWhitebutton ? AppColors.primary : AppColors.white,
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

class BookNowButton extends StatelessWidget {
  const BookNowButton(
      {super.key,
      required this.ontap,
      this.textcolor = AppColors.white,
      this.color = AppColors.primary});
  final Function()? ontap;
  final Color? textcolor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.fromDesignWidth(context, 20),
            vertical: SizeConfig.fromDesignHeight(context, 7.5)),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: color),
        child: Center(
            child: AppTextBold(
          text: 'Book',
          fontSize: 12,
          color: textcolor,
        )),
      ),
    );
  }
}

class LargeButtoncustom extends StatelessWidget {
  const LargeButtoncustom(
      {super.key,
      required this.label,
      required this.ontap,
      this.bordercolor = AppColors.primary,
      this.buttoncolor = AppColors.background,
      this.textcolor = AppColors.grey});
  final String label;
  final Function()? ontap;
  final Color? buttoncolor;
  final Color? textcolor;
  final Color bordercolor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: SizeConfig.fromDesignWidth(context, 360),
        height: SizeConfig.fromDesignHeight(context, 52),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: bordercolor),
            color: buttoncolor),
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

class SmallButton extends StatelessWidget {
  const SmallButton(
      {super.key,
      required this.label,
      required this.ontap,
      this.buttonColor = AppColors.primary,
      this.isCancelButton = false});
  final String label;
  final bool isCancelButton;
  final Function()? ontap;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.fromDesignWidth(context, 15),
          vertical: SizeConfig.fromDesignWidth(context, 7),
        ),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: isCancelButton ? AppColors.primarylight : buttonColor),
        child: Center(
            child: AppTextBold(
          text: label,
          fontSize: 16,
          color: isCancelButton ? AppColors.primary : AppColors.white,
        )),
      ),
    );
  }
}
