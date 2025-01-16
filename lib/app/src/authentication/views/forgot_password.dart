import 'package:flaury_mobile/app/shared/app_spacing.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/custom_padding.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flaury_mobile/app/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/shared_widgets/custom_button.dart';
import 'package:flaury_mobile/app/shared/shared_widgets/textfield.dart';
import 'package:flaury_mobile/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgotPasswordView extends StatefulHookConsumerWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController =
        TextEditingController(text: '');
    return Scaffold(
        body: SafeArea(
      child: SymetricPadding(
        h: 20,
        v: 0,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.fromDesignHeight(context, 20),
              ),
              //app bar
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const ImageIcon(AssetImage(back), size: 20),
                  ),
                  SizedBox(
                    width: SizeConfig.fromDesignWidth(context, 5),
                  ),
                  AppTextBold(text: 'Forgot Password', fontSize: 20)
                ],
              ),

              SizedBox(
                height: SizeConfig.fromDesignHeight(context, 45),
              ),

              //image
              const Center(
                  child: SvgAssets(
                svg: forgotPassword,
                height: 200,
              )),

              SizedBox(
                height: SizeConfig.fromDesignHeight(context, 70),
              ),

              AppTextSemiBold(
                  text: 'Enter your registered email address', fontSize: 14),

              SizedBox(
                height: SizeConfig.fromDesignHeight(context, 30),
              ),
              RegularTextField(
                keyboardtype: TextInputType.emailAddress,
                controller: emailController,
                hintText: 'Email address',
              ),

              SizedBox(
                height: SizeConfig.fromDesignHeight(context, 217),
              ),

              LargeButon(
                  label: 'Continue',
                  ontap: () {
                    //add email verification logic here

                    // then navigate to otp screen

                    Navigator.pushNamed(context, AppRoutes.otpScreen);
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}

//
//

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({super.key});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  late TextEditingController pIn1controller;
  late TextEditingController pIn2controller;
  late TextEditingController pIn3controller;
  late TextEditingController pIn4controller;

  @override
  void initState() {
    super.initState();
    pIn1controller = TextEditingController();
    pIn2controller = TextEditingController();
    pIn3controller = TextEditingController();
    pIn4controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    pIn1controller.dispose();
    pIn2controller.dispose();
    pIn3controller.dispose();
    pIn4controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String getPinFromControllers(
      TextEditingController controller1,
      TextEditingController controller2,
      TextEditingController controller3,
      TextEditingController controller4,
    ) {
      // Concatenate text from each controller
      String pin = '';
      pin += controller1.text;
      pin += controller2.text;
      pin += controller3.text;
      pin += controller4.text;
      return pin;
    }

    return Scaffold(
      body: SafeArea(
        child: SymetricPadding(
          h: 17,
          v: 0,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 20),
                ), //app bar
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const ImageIcon(AssetImage(back), size: 20),
                    ),
                    const AppSpacing(v: 5),
                    AppTextBold(text: 'Forgot Password', fontSize: 20),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 30),
                ),
                Center(
                    child: AppTextSemiBold(
                        text: 'Code has been sent to flaury@mail.com',
                        fontSize: 14)),
                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 30),
                ),
                //otp digit boxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OtpTextfield(
                      controller: pIn1controller,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                    OtpTextfield(
                      controller: pIn2controller,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                    OtpTextfield(
                      controller: pIn3controller,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                    OtpTextfield(
                      controller: pIn4controller,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).unfocus();
                        }
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 30),
                ),
                //resend code
                Center(
                  child:
                      AppTextSemiBold(text: 'Resend code in 38s', fontSize: 14),
                ),
                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 427),
                ),
                //verify button

                LargeButon(
                    label: 'verify',
                    ontap: () {
                      String pin = getPinFromControllers(
                        pIn1controller,
                        pIn2controller,
                        pIn3controller,
                        pIn4controller,
                      );

                      print(pin);

                      //
                      Navigator.pushNamed(
                          context, AppRoutes.changePassowrdView);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
