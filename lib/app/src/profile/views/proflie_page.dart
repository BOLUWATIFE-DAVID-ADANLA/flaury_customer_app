import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppTextBold(text: 'profile page', fontSize: 10),
      ),
    );
  }
}
