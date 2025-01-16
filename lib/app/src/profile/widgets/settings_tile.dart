import 'package:flaury_mobile/app/util/app_spacing.dart';
import 'package:flaury_mobile/app/util/app_text_style.dart';
import 'package:flaury_mobile/app/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {super.key, this.ontap, required this.label, required this.svgAssets});
  final Function()? ontap;
  final String svgAssets;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
              horizontal: SizeConfig.fromDesignHeight(context, 5)),

          //icon and text
          leading: SvgAssets(
            svg: svgAssets,
            height: SizeConfig.fromDesignHeight(context, 24),
          ),
          title: AppTextSemiBold(text: label, fontSize: 14),
          trailing: SvgAssets(
            svg: rightarrow,
            height: SizeConfig.fromDesignHeight(context, 17),
          ),
          style: ListTileStyle.drawer,
        ));
  }
}

class SettingsTileV2 extends StatelessWidget {
  const SettingsTileV2(
      {super.key,
      this.ontap,
      required this.label,
      required this.svgAssets,
      required this.label2});
  final Function()? ontap;
  final String svgAssets;
  final String label;
  final String label2;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
              horizontal: SizeConfig.fromDesignHeight(context, 5)),
          leading: SvgAssets(
            svg: svgAssets,
            height: SizeConfig.fromDesignHeight(context, 24),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextRegular(
                text: label,
                fontSize: 14,
              ),
              const AppSpacing(
                v: 4,
              ),
              const Divider(color: Colors.grey, height: 1), // Divider
              const AppSpacing(
                v: 4,
              ),

              AppTextRegular(
                  text: ' FAQ, Privacy Policy, Terms & Conditions',
                  fontSize: 10)
            ],
          ),
          trailing: SvgAssets(
            svg: rightarrow,
            height: SizeConfig.fromDesignHeight(context, 17),
          ),
        ));
  }
}

class ChangeProfileSettingTile extends StatelessWidget {
  const ChangeProfileSettingTile({super.key, required this.label, this.ontap});
  final String label;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
            horizontal: SizeConfig.fromDesignHeight(context, 5)),
        title: AppTextRegular(text: label, fontSize: 16),
        trailing: SvgAssetsicons(
          svg: rightarrow,
          height: SizeConfig.fromDesignHeight(context, 17),
        ),
      ),
    );
  }
}
