import 'package:flaury_mobile/app/routes/app_routes.dart';
import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_spacing.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/custom_padding.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flaury_mobile/app/shared/shared_widgets/textfield.dart';
import 'package:flaury_mobile/app/src/chat/widgets/chat_tiles.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SymetricPadding(
          v: 0,
          h: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppSpacing(v: 20),
              AppTextBold(text: 'Inbox', fontSize: 20),
              SizedBox(height: SizeConfig.fromDesignHeight(context, 20)),
              MainCustomTextfield(
                  hintext: 'Search',
                  obscureText: false,
                  onchanged: (String value) {},
                  prefixIcon: const Icon(Icons.search_rounded)),
              const AppSpacing(v: 20),
              // expanded to fit all of the chat tiles
              Expanded(
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (_, index) {
                      return ChatTiles(
                        ontap: () =>
                            Navigator.pushNamed(context, AppRoutes.chatdetails),
                      );
                    }),
              )
            ],
          ),
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
