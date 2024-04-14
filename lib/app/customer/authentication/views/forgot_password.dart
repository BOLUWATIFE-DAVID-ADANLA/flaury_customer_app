import 'package:flaury_mobile/shared/app_spacing.dart';
import 'package:flaury_mobile/shared/app_text_style.dart';
import 'package:flaury_mobile/util/images_icons_illustration.dart';
import 'package:flaury_mobile/widgets/custom_button.dart';
import 'package:flaury_mobile/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppSpacing.h20(),
                //app bar
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const ImageIcon(AssetImage(back), size: 20),
                    ),
                    const AppSpacing(v: 5),
                    Text(
                      'Forgot Password',
                      style: AppText.bold24,
                    ),
                  ],
                ),
                const AppSpacing(h: 40),

                //image
                Center(child: Image.asset(forgotPassword, height: 200.h)),

                const AppSpacing(h: 70),

                Text(
                  'Enter your registered email address',
                  style: AppText.semibold16,
                ),
                AppSpacing.h30(),
                RegularTextField(
                  keyboardtype: TextInputType.emailAddress,
                  controller: _emailController,
                  hintText: 'Email address',
                ),

                const AppSpacing(h: 222),

                LargeButon(label: 'Continue', ontap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
