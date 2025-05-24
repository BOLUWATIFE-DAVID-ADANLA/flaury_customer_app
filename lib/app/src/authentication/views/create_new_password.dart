import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flaury_mobile/app/util/app_text_style.dart';
import 'package:flaury_mobile/app/util/custom_padding.dart';
import 'package:flaury_mobile/app/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flaury_mobile/app/shared/custom_button.dart';
import 'package:flaury_mobile/app/shared/dialouges.dart';
import 'package:flaury_mobile/app/shared/textfield.dart';
import 'package:flaury_mobile/app/src/authentication/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangePasswordView extends StatefulHookConsumerWidget {
  const ChangePasswordView({super.key});

  @override
  ConsumerState<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends ConsumerState<ChangePasswordView> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  @override
  void dispose() {
    super.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final obscurePassword = ref.watch(passwordsvisible);
    final obscurePasswords = ref.watch(confirmvisible);

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
                ), //ap
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
                    ), //ap
                    AppTextBold(
                      text: 'Create New Password',
                      fontSize: 20,
                      color: AppColors.black,
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 35),
                ), //ap

                //image
                const Center(
                    child: SvgAssets(
                  svg: newpassword,
                  height: 240,
                )),

                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 40),
                ), //ap

                AppTextBold(text: 'Create Your New Password', fontSize: 18),
                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 20),
                ), //ap

                // password input texfield
                CustomTextfield(
                    label: 'New Password',
                    hintext: 'Enter New Password ',
                    obscureText: obscurePassword.isPasswordVisible,
                    prefixIcon: const Icon(
                      Icons.lock_rounded,
                      color: AppColors.black,
                    ),
                    controller: newPasswordController,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        obscurePassword.visiblePassword();
                      },
                      child: Icon(obscurePassword.isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                    )),

                SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 16),
                ), //ap
                CustomTextfield(
                  label: 'Confirm Password',
                  hintext: 'Confirm New Password',
                  obscureText: obscurePasswords.isPasswordVisible,
                  controller: confirmNewPasswordController,
                  prefixIcon: const Icon(
                    Icons.lock_rounded,
                    color: AppColors.black,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      obscurePasswords.visiblePassword();
                    },
                    child: Icon(obscurePasswords.isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
                //ap

                //ap
                Expanded(
                  child: LargeButon(
                      label: 'Continue',
                      ontap: () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                CustomAlertDialouge(children: [
                                  const SvgAssets(
                                    svg: newPasswordPop,
                                    height: 115,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.fromDesignHeight(
                                        context, 24),
                                  ), //ap
                                  Center(
                                    child: AppTextBold(
                                      text: 'Successful!',
                                      fontSize: 18,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.fromDesignHeight(
                                        context, 18),
                                  ), //ap

                                  AppTextRegular(
                                      text:
                                          'Your password has been successfully updated.',
                                      textAlign: TextAlign.center,
                                      fontSize: 14)
                                ]));
                        //add email verification logic here

                        // then navigate to otp screen

                        // Navigator.pushNamed(context, '/otpscreen');
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
