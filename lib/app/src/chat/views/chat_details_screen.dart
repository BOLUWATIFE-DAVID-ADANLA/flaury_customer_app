import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_spacing.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/custom_padding.dart';
import 'package:flaury_mobile/app/shared/shared_widgets/textfield.dart';
import 'package:flaury_mobile/app/shared/util/dateformatter.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flaury_mobile/app/src/chat/models/chat_messages.dart';
import 'package:flaury_mobile/app/src/chat/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatDetailsView extends ConsumerWidget {
  const ChatDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController chatTextController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SymetricPadding(
          v: 0,
          h: 20,
          child: Column(
            children: [
              // app bar that diplays name of service provider
              const AppSpacing(v: 20),
              Row(
                children: [
                  SvgAssetsicons(
                    svg: back,
                    height: SizeConfig.fromDesignHeight(context, 20),
                    ontap: () => Navigator.pop(context),
                  ),
                  const AppSpacing(h: 6),
                  AppTextBold(text: 'Timeless salon', fontSize: 18),
                  const AppSpacing(v: 20),
                ],
              ),
              const AppSpacing(v: 20),

              // scroolable list of messages
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  reverse: false,
                  itemBuilder: (_, index) {
                    if (messages[index].isMessageSentByUser == true) {
                      return SentChatBubble(
                        message: messages[index].message,
                        time:
                            Dateformatter.formatdate(messages[index].timeStamp),
                      );
                    } else {
                      return ReceivedChatBubble(
                        message: messages[index].message,
                        time:
                            Dateformatter.formatdate(messages[index].timeStamp),
                      );
                    }
                  },
                  itemCount: messages.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const AppSpacing(v: 10);
                  },
                ),
              ),

              // text input
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    // texfield
                    Expanded(
                      child: ChatTextField(
                        hintText: 'Type message',
                        controller: chatTextController,
                      ),
                    ),

                    IconButton(
                      icon: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.primary, // Background color
                          shape: BoxShape.circle, // Circular shape
                        ),
                        padding:
                            const EdgeInsets.all(10.0), // Padding for spacing
                        child: const Icon(
                          size: 26,
                          Icons.send_sharp,
                          color: Colors.white, // Icon color
                        ),
                      ),
                      onPressed: () {
                        // send messages
                        debugPrint('you have sent a message');
                      },
                      color: AppColors.white,
                    )
                    // send button
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final List<ChatMessages> messages = [
  ChatMessages(
      message: "Hello! How can I help you?",
      isMessageSentByUser: false,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "I need some information about your services.",
      isMessageSentByUser: true,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "Sure! What do you need to know?",
      isMessageSentByUser: false,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "What are your operating hours?",
      isMessageSentByUser: true,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "We operate from 9 AM to 5 PM, Monday to Friday.",
      isMessageSentByUser: false,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "Do you offer online consultations?",
      isMessageSentByUser: true,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "Yes, we do. You can book an appointment online.",
      isMessageSentByUser: false,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "Great! How do I make a booking?",
      isMessageSentByUser: true,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "Visit our website and click on the 'Book Now' button.",
      isMessageSentByUser: false,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "Can I reschedule if needed?",
      isMessageSentByUser: true,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "Yes, you can reschedule up to 24 hours before the appointment.",
      isMessageSentByUser: false,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "Thank you for the information.",
      isMessageSentByUser: true,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "You're welcome! Let me know if you have more questions.",
      isMessageSentByUser: false,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "Do you offer discounts for group bookings?",
      isMessageSentByUser: true,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "Yes, we have discounts for groups of 5 or more.",
      isMessageSentByUser: false,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "That's good to know. I'll inform my team.",
      isMessageSentByUser: true,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "Sounds great! Let us know if you need assistance.",
      isMessageSentByUser: false,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "I will. Thanks for your help.",
      isMessageSentByUser: true,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "Anytime! Have a wonderful day.",
      isMessageSentByUser: false,
      timeStamp: DateTime.now()),
  ChatMessages(
      message: "You too. Bye!",
      isMessageSentByUser: true,
      timeStamp: DateTime.now()),
];
