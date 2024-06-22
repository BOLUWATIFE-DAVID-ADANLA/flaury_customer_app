import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationPageView extends StatelessWidget {
  const NotificationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
