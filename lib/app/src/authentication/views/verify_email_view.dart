import 'package:flaury_mobile/app/routes/app_routes.dart';
import 'package:flaury_mobile/app/src/authentication/controllers/auth_controller.dart';
import 'package:flaury_mobile/app/src/authentication/controllers/resend_otp_timer_controller.dart';
import 'package:flaury_mobile/app/src/authentication/controllers/resend_verification_controller.dart';
import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final timer = ref.watch(resendTimerProvider);
    final resendTimer = ref.read(resendTimerProvider.notifier);

    ref.listen<AuthState>(authControllerProvider, (prev, next) {
      if (next.status == AuthStatus.success) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.signInView,
        );
      } else if (next.status == AuthStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message)),
        );
      }
    });

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
                        text: 'Code has been sent to ${widget.email}',
                        fontSize: 14)),
                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 30),
                ),
                //otp digit boxes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      6,
                      (index) => OtpTextfield(
                            controller: _otpControllers[index],
                            onChanged: (value) {
                              if (value.isEmpty && index > 0) {
                                FocusScope.of(context).previousFocus();
                              } else if (value.isNotEmpty &&
                                  index < _otpControllers.length - 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                          )),
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
                                              .read(resendverificationProvider
                                                  .notifier)
                                              .resendVerificationOtp(
                                                  widget.email);

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
                    isloading: ref.watch(authControllerProvider).status ==
                        AuthStatus.loading,
                    ontap: () {
                      String otp = _otpControllers.map((e) => e.text).join();

                      if (otp.length == 6) {
                        ref
                            .read(authControllerProvider.notifier)
                            .verifyEmail(widget.email, otp);
                      }
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
