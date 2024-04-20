import 'package:flaury_mobile/routes/app_routes.dart';
import 'package:flaury_mobile/shared/app_colors.dart';
import 'package:flaury_mobile/shared/app_spacing.dart';
import 'package:flaury_mobile/shared/app_text_style.dart';
import 'package:flaury_mobile/util/images_icons_illustration.dart';
import 'package:flaury_mobile/shared/widgets/user_role_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcomeview extends StatelessWidget {
  const Welcomeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppSpacing(h: 44),
            //flaury logo
            Center(
                child: Image.asset(
              logo,
              height: 100.h,
            )),

            const AppSpacing(h: 30),

            //cta text
            //

            Text(
              'Welcome to Flaury',
              style: AppText.primarybold24,
            ),

            //Cta subtext
            //

            Text(
              'Enjoy Simplified Booking For Your  Convenience ',
              style: AppText.regular20,
              textAlign: TextAlign.center,
            ),

            const AppSpacing(h: 100),

            //role suggestion text
            //
            Text(
              'Are you ?',
              style: AppText.bold40,
            ),

            AppSpacing.h24(),

            //select user role buttons (coustomer/ serviceProvider)
            //

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelectUserRole(
                  ontap: () {},
                  image: welcome1,
                  subtitle: 'Beauty stylistor sallon owner',
                  title: 'Beautician',
                ),
                SelectUserRole(
                  ontap: () {
                    Navigator.pushNamed(
                        context, AppRoutes.registerCustomerView);
                  },
                  image: welcome2,
                  subtitle: 'Looking to hire a Service',
                  title: 'Customer',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
