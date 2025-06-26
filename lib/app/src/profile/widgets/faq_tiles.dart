import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flaury_mobile/app/util/app_spacing.dart';
import 'package:flaury_mobile/app/util/app_text_style.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FaqTiles extends ConsumerWidget {
  final String label;
  final String title;

  const FaqTiles({super.key, this.label = '', this.title = ''});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpansionTile(
      backgroundColor: AppColors.grey30,
      collapsedBackgroundColor: AppColors.grey30,
      childrenPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.fromDesignWidth(context, 14),
          vertical: SizeConfig.fromDesignHeight(context, 16)),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: AppColors.grey30, width: 2),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: AppColors.grey30, width: 2),
      ),
      title: AppTextRegular(text: title, fontSize: 16),
      children: [
        const Divider(color: AppColors.grey100),
        const AppSpacing(v: 5),
        AppTextRegular(
          text: label,
          fontSize: 14,
          overflow: TextOverflow.clip,
        ),
      ],
    );
  }
}
