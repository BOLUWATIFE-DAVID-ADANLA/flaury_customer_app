import 'package:flaury_mobile/app/src/authentication/controllers/auth_controller.dart';
import 'package:flaury_mobile/app/src/authentication/controllers/forgot_password_controller.dart';
import 'package:flaury_mobile/app/util/app_spacing.dart';
import 'package:flaury_mobile/app/util/app_text_style.dart';
import 'package:flaury_mobile/app/util/custom_padding.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flaury_mobile/app/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/custom_button.dart';
import 'package:flaury_mobile/app/shared/textfield.dart';
import 'package:flaury_mobile/app/routes/app_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../util/app_colors.dart';
import '../controllers/resend_otp_timer_controller.dart';

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: SafeArea(
          child: SymetricPadding(
            h: 20,
            v: 0,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                          height: SizeConfig.fromDesignHeight(context, 20)),
                      // App bar
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child:
                                const Icon(Icons.arrow_back_ios_new_outlined),
                          ),
                          SizedBox(
                              width: SizeConfig.fromDesignWidth(context, 5)),
                          AppTextBold(text: 'Forgot Password', fontSize: 20),
                        ],
                      ),
                      SizedBox(
                          height: SizeConfig.fromDesignHeight(context, 45)),
                      const Center(
                          child: SvgAssets(svg: forgotPassword, height: 200)),
                      SizedBox(
                          height: SizeConfig.fromDesignHeight(context, 70)),
                      AppTextSemiBold(
                        text: 'Enter your registered email address',
                        fontSize: 14,
                      ),
                      SizedBox(
                          height: SizeConfig.fromDesignHeight(context, 30)),
                      RegularTextField(
                        keyboardtype: TextInputType.emailAddress,
                        controller: emailController,
                        hintText: 'Email address',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.fromDesignHeight(context, 20)),
                LargeButon(
                  label: 'Continue',
                  ontap: () {
                    ref.read(authControllerProvider.notifier).forgotPassword(
                          emailController.text.trim(),
                        );
                    Navigator.pushNamed(
                      context,
                      AppRoutes.otpScreen,
                      arguments: emailController.text.trim(),
                    );
                  },
                ),
                SizedBox(height: SizeConfig.fromDesignHeight(context, 20)),
              ],
            ),
          ),
        ),
      ),
    );
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
  final controllers = List.generate(6, (index) => TextEditingController());
  final _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in controllers) {
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final timer = ref.watch(resendTimerProvider);
    final resendTimer = ref.read(resendTimerProvider.notifier);
    final args = ModalRoute.of(context)?.settings.arguments as String;

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
                        textAlign: TextAlign.center,
                        text: 'Code has been sent to $args',
                        fontSize: 14)),
                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 30),
                ),
                //otp digit boxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return OtpTextfield(
                      controller: controllers[index],
                      focusNode: _focusNodes[index],
                      onChanged: (value) {
                        if (value.isNotEmpty &&
                            index < controllers.length - 1) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[index + 1]);
                        }
                      },
                      onBackspace: () {
                        if (index > 0) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[index - 1]);
                        }
                      },
                    );
                  }),
                ),
                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 30),
                ),
                //resend code
                timer.canResend
                    ? Center(
                        child: RichText(
                          text: TextSpan(
                            text: "Didn't get a code? ",
                            style: GoogleFonts.montserrat(
                              color: AppColors.black,
                              fontSize: SizeConfig.fontSize(context, 16),
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: 'Resend',
                                style: GoogleFonts.montserrat(
                                  color: AppColors.primary,
                                  fontSize: SizeConfig.fontSize(context, 16),
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = timer.canResend
                                      ? () {
                                          ref
                                              .read(
                                                  resendForgotpasswordCodeProvider
                                                      .notifier)
                                              .resendVerificationOtp(args);

                                          resendTimer.start();
                                        }
                                      : null,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Center(
                        child: AppTextSemiBold(
                            text: 'Resend code in ${timer.secondsLeft}s',
                            fontSize: 14),
                      ),
                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 427),
                ),
                //verify button

                LargeButon(
                    label: 'verify',
                    ontap: () {
                      String pin = controllers.map((e) => e.text).join();

                      Navigator.pushNamed(context, AppRoutes.changePassowrdView,
                          arguments: {'email': args, 'verificationCode': pin});
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
