import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flutter/material.dart';

class CategoriesIcons extends StatelessWidget {
  final String label;
  final String svg;
  final Function()? ontap;
  const CategoriesIcons(
      {super.key, required this.label, required this.svg, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(21),
            height: SizeConfig.fromDesignHeight(context, 70),
            width: SizeConfig.fromDesignWidth(context, 70),
            decoration: BoxDecoration(
                color: AppColors.category,
                borderRadius: BorderRadius.circular(70)),
            child: SvgAssets(
              svg: svg,
              height: SizeConfig.fromDesignHeight(context, 30),
            ),
          ),
          SizedBox(
            height: SizeConfig.fromDesignHeight(context, 3),
          ),
          AppTextSemiBold(text: label, fontSize: 12)
        ],
      ),
    );
  }
}
