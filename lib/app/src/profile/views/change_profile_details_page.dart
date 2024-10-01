import 'package:flaury_mobile/app/shared/app_spacing.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/custom_padding.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flaury_mobile/app/src/profile/widgets/settings_tile.dart';
import 'package:flutter/material.dart';

class ChangeProfileDetailsView extends StatelessWidget {
  const ChangeProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SymetricPadding(
        h: 20,
        v: 0,
        child: Column(
          children: [
            // appbar
            const AppSpacing(v: 20),
            Row(
              children: [
                SvgAssetsicons(
                  svg: back,
                  height: SizeConfig.fromDesignHeight(context, 20),
                  ontap: () => Navigator.pop(context),
                ),
                const AppSpacing(h: 6),
                AppTextBold(text: 'Profile', fontSize: 18),
                const AppSpacing(v: 20),
              ],
            ),
            //edit profile
            ChangeProfileSettingTile(
              label: 'Edit Profile',
              ontap: () {},
            ),

            //change password
            ChangeProfileSettingTile(
              label: 'Change password',
              ontap: () {},
            ),

            ChangeProfileSettingTile(
              label: 'Update Phone number ',
              ontap: () {},
            )
          ],
        ),
      )),
    );
  }
}
