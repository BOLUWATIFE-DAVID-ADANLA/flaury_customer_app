import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flaury_mobile/app/util/app_text_style.dart';
import 'package:flaury_mobile/app/shared/custom_button.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookServiceCard extends ConsumerWidget {
  const BookServiceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.fromDesignHeight(context, 20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // service name and price
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextBold(text: 'Hair conditioning ', fontSize: 16),
              AppTextRegular(text: "from \$20", fontSize: 14),
            ],
          ),

          //book now button
          BookNowButton(
            ontap: () {},
            color: AppColors.primary,
          )
        ],
      ),
    );
  }
}
