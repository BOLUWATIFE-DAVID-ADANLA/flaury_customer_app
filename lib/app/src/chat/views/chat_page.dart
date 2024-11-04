import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/custom_padding.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flaury_mobile/app/shared/shared_widgets/textfield.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SymetricPadding(
          v: 0,
          h: 20,
          child: Column(children: [
            SizedBox(height: SizeConfig.fromDesignHeight(context, 20)),
            Row(
              children: [
                SvgAssetsicons(
                  svg: back,
                  ontap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: SizeConfig.fromDesignHeight(context, 4),
                ),
                AppTextBold(text: 'Inbox', fontSize: 20)
              ],
            ),
            SizedBox(height: SizeConfig.fromDesignHeight(context, 20)),
            MainCustomTextfield(
              hintext: 'Serach',
              obscureText: false,
              onchanged: (String value) {},
            ),
          ]),
        ),
      ),
    );
  }
}

class NOChatPlacholder extends StatelessWidget {
  const NOChatPlacholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextSemiBold(
          text:
              "No open conversations yet..\nSearch for a service and start  a conversation\n now. ",
          textAlign: TextAlign.center,
          fontSize: 14,
          color: AppColors.grey,
        ),
        AppTextBold(text: 'Click here!', fontSize: 14),
      ],
    );
  }
}
