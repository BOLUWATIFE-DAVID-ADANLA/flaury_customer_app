import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppTextBold(
          fontSize: 10,
          text: 'chatpage',
        ),
      ),
    );
  }
}
