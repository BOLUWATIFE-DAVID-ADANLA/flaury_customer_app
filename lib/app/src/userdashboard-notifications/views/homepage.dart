import 'package:flaury_mobile/app/config/size_config.dart';
import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: AppColors.primary,
          statusBarIconBrightness: Brightness.light),
    );

    //greeting
    String greeting;
    int currentTime = DateTime.now().hour;

    if (currentTime < 12) {
      greeting = 'Good Morning';
    } else if (currentTime == 12 || currentTime <= 17) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening ';
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(children: [
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
                        horizontal: SizeConfig.fromDesignHeight(context, 24)),
                    child: AppTextRegular(
                      text: 'What are you looking for  Today ?',
                      fontSize: 14,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 10),
                  ),
                  //home page search box
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.fromDesignHeight(context, 24)),
                    child: Container(
                      height: SizeConfig.fromDesignHeight(context, 42),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.white),
                    ),
                  )
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }
}
