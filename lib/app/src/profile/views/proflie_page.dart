import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_spacing.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/custom_padding.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flaury_mobile/app/src/profile/widgets/log_out_button.dart';
import 'package:flaury_mobile/app/src/profile/widgets/settings_tile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: SymetricPadding(
              v: 0,
              h: 20,
              child: Column(
                children: [
                  const AppSpacing(v: 70),
                  //place holder image
                  Center(
                    child: SvgAssets(
                      svg: profilePlaceholder,
                      height: SizeConfig.fromDesignHeight(context, 50),
                      width: SizeConfig.fromDesignWidth(context, 50),
                    ),
                  ),
                  const AppSpacing(v: 20),

                  //user's name
                  AppTextBold(text: 'Becca Adom', fontSize: 16),

                  //user's email
                  AppTextSemiBold(text: 'baeccagold@gmail.com', fontSize: 14),

                  const AppSpacing(v: 34),
                  //settings icons
                  SettingsTile(
                    ontap: () {},
                    label: 'Profile',
                    svgAssets: profileOutline,
                  ),

                  //wallet
                  SettingsTile(
                    ontap: () {},
                    label: 'Wallet',
                    svgAssets: wallet,
                  ),
                  SettingsTileV2(
                    ontap: () {},
                    label: 'About',
                    svgAssets: info,
                    label2: ' FAQ, Privacy Policy, Terms & Conditions',
                  ),
                  SettingsTileV2(
                    ontap: () {},
                    label: 'Promotions',
                    svgAssets: promotions,
                    label2:
                        'Get promo codes and enjoy discount on your bookings.',
                  ),

                  const AppSpacing(v: 101),

                  LogOutButton(
                    ontap: () {},
                  ),
                  const AppSpacing(v: 38),

                  Container(
                    padding: EdgeInsets.all(
                        SizeConfig.fromDesignHeight(context, 15)),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(34, 22, 12, 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextBold(
                              text: 'Become a service provider',
                              fontSize: 14,
                              color: AppColors.white,
                            ),
                            AppTextRegular(
                              text: 'Earn money while offering your skills',
                              fontSize: 10,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              SizeConfig.fromDesignHeight(context, 15)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(300),
                              color: AppColors.white),
                          child: SvgAssets(
                            svg: rightArrow,
                            height: SizeConfig.fromDesignHeight(context, 15),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
