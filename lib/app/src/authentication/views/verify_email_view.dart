import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/custom_button.dart';
import '../../../shared/textfield.dart';
import '../../../util/app_spacing.dart';
import '../../../util/app_text_style.dart';
import '../../../util/custom_padding.dart';
import '../../../util/size_config.dart';

class VerifyEmailView extends ConsumerStatefulWidget {
  final String email;
  const VerifyEmailView({super.key, required this.email});

  @override
  ConsumerState<VerifyEmailView> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<VerifyEmailView> {
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
                      child: const Icon(Icons.arrow_back_ios_new_outlined),
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
                        text: 'Code has been sent to ${widget.email}',
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
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
