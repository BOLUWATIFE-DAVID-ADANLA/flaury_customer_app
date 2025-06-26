import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flaury_mobile/app/util/app_spacing.dart';
import 'package:flaury_mobile/app/util/app_text_style.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatTiles extends ConsumerWidget {
  final VoidCallback? ontap;
  const ChatTiles({super.key, this.ontap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        onTap: ontap,
        child: Column(
          children: [
            const AppSpacing(v: 10),
            ListTile(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.fromDesignHeight(context, 5)),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(placeHolderimg, scale: 2),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextBold(
                      text: 'dumi fashon house',
                      fontSize: 14,
                    ),
                    const AppSpacing(
                      v: 4,
                    ),
                    AppTextRegular(
                        text:
                            'hello what service do you require ? How can we help you',
                        fontSize: 10)
                  ],
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Badge(
                      backgroundColor: AppColors.primary,
                      label: AppTextSemiBold(
                        text: '8',
                        fontSize: 10,
                      ),
                    ),
                    const AppSpacing(
                      v: 10,
                    ),
                    AppTextSemiBold(
                      text: '8:00',
                      fontSize: 12,
                    )
                  ],
                )),
            const AppSpacing(v: 10),

            const Divider(color: Colors.grey, height: 1), // Divider
          ],
        ));
  }
}

String placeHolderimg =
    'https://images.unsplash.com/photo-1666852327656-5e9fd213209b?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
// class SettingsTileV2 extends StatelessWidget {
//   const SettingsTileV2(
//       {super.key,
//       this.ontap,
//       required this.label,
//       required this.svgAssets,
//       required this.label2});
//   final Function()? ontap;
//   final String svgAssets;
//   final String label;
//   final String label2;

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }