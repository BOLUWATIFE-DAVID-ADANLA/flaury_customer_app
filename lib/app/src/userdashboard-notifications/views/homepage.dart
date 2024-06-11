import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/custom_padding.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flaury_mobile/app/src/userdashboard-notifications/widgets/homepage_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: AppColors.primary,
          statusBarIconBrightness: Brightness.light),
    );

    //greeting

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header
            const HomepageHeaderSection(),

            Expanded(
              child: SymetricPadding(
                h: 20,
                v: 0,
                child: ListView(
                  children: [
                    SizedBox(height: SizeConfig.fromDesignHeight(context, 20)),
                    // categories
                    AppTextBold(text: 'Categories', fontSize: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
