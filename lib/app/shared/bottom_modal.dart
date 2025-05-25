import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flutter/material.dart';

class CustomModal extends StatelessWidget {
  final List<Widget> children;
  final double? height;
  final String size; // still optional, for backward compatibility
  final CrossAxisAlignment crossAxisAlignment;

  const CustomModal({
    super.key,
    required this.children,
    this.height,
    this.size = 'small',
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  static const double bigHeight = 550;
  static const double mediumHeight = 450;
  static const double smallHeight = 355;
  static const double ultraSmallHeight = 245;

  double getHeight(BuildContext context) {
    if (height != null) {
      return height!;
    }

    switch (size.toLowerCase()) {
      case 'big':
        return SizeConfig.fromDesignHeight(context, bigHeight);
      case 'medium':
        return SizeConfig.fromDesignHeight(context, mediumHeight);
      case 'ultra small':
        return SizeConfig.fromDesignHeight(context, ultraSmallHeight);
      case 'small':
      default:
        return SizeConfig.fromDesignHeight(context, smallHeight);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.fromDesignWidth(context, 20),
        ),
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      ),
    );
  }
}

class ModalToggle extends StatelessWidget {
  const ModalToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.fromDesignHeight(context, 5),
      width: SizeConfig.fromDesignWidth(context, 134),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.grey,
      ),
    );
  }
}
