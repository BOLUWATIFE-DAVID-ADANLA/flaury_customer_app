import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/widgets/serchbox.dart';
import 'package:flutter/material.dart';

class HomepageHeaderSection extends StatelessWidget {
  const HomepageHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    String greeting;
    int currentTime = DateTime.now().hour;

    if (currentTime < 12) {
      greeting = 'Good Morning';
    } else if (currentTime == 12 || currentTime <= 17) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }
    return Stack(children: [
      Container(
        height: SizeConfig.fromDesignHeight(context, 126),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: AppColors.primary),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.fromDesignHeight(context, 24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextBold(
                  text: '$greeting, Becca! ',
                  fontSize: 18,
                  color: AppColors.white,
                ),
                Row(
                  children: [
                    SvgAssetsicons(
                      svg: notificationIcon,
                      ontap: () {},
                    ),
                    SizedBox(
                      width: SizeConfig.fromDesignWidth(context, 10),
                    ),
                    SvgAssetsicons(
                      svg: favourites,
                      ontap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),

          //what are you doing today text

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.fromDesignWidth(context, 24)),
            child: AppTextRegular(
              text: 'What are you looking for Today ?',
              fontSize: 14,
              color: AppColors.white,
            ),
          ),
          SizedBox(
            height: SizeConfig.fromDesignHeight(context, 10),
          ),
          //home page search box
          HomeSearchBox(
            ontap: () {},
          )
        ],
      )
    ]);
  }
}
