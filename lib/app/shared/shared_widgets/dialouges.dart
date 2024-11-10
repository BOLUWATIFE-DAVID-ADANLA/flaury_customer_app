import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flutter/material.dart';

class CustomAlertDialouge extends StatelessWidget {
  final List<Widget> children;
  const CustomAlertDialouge({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.fromDesignWidth(context, 14),
          vertical: SizeConfig.fromDesignHeight(context, 40),
        ),
        constraints: BoxConstraints.expand(
          height: SizeConfig.fromDesignHeight(context, 340),
        ),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: ListView(
          children: children,
        ),
      ),
    );
  }
}
