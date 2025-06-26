import 'package:flaury_mobile/app/src/authentication/controllers/auth_controller.dart';
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
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangePasswordView extends ConsumerStatefulWidget {
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
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final obscurePassword = ref.watch(passwordsvisible);
    final obscurePasswords = ref.watch(confirmvisible);

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final email = args['email'];
    final verificationCode = args['verificationCode'];

    ref.listen(authControllerProvider, (previous, next) {
      if (next.status == AuthStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message)),
        );
      } else if (next.status == AuthStatus.success) {
        showDialog(
          context: context,
          builder: (context) => CustomAlertDialouge(children: [
            const SvgAssets(svg: newPasswordPop, height: 115),
            SizedBox(height: SizeConfig.fromDesignHeight(context, 24)),
            Center(
              child: AppTextBold(
                text: 'Successful!',
                fontSize: 18,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: SizeConfig.fromDesignHeight(context, 18)),
            AppTextRegular(
              text: 'Your password has been successfully updated.',
              textAlign: TextAlign.center,
              fontSize: 14,
            )
          ]),
        );
      }
    });

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
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.arrow_back_ios_new),
                          ),
                          SizedBox(
                              width: SizeConfig.fromDesignWidth(context, 5)),
                          AppTextBold(
                            text: 'Create New Password',
                            fontSize: 20,
                            color: AppColors.black,
                          )
                        ],
                      ),
                      SizedBox(
                          height: SizeConfig.fromDesignHeight(context, 35)),
                      const Center(
                          child: SvgAssets(svg: newpassword, height: 240)),
                      SizedBox(
                          height: SizeConfig.fromDesignHeight(context, 40)),
                      AppTextBold(
                          text: 'Create Your New Password', fontSize: 18),
                      SizedBox(
                          height: SizeConfig.fromDesignHeight(context, 20)),
                      CustomTextfield(
                        label: 'New Password',
                        hintext: 'Enter New Password',
                        obscureText: obscurePassword.isPasswordVisible,
                        prefixIcon: const Icon(Icons.lock_rounded,
                            color: AppColors.black),
                        controller: newPasswordController,
                        suffixIcon: GestureDetector(
                          onTap: () => obscurePassword.visiblePassword(),
                          child: Icon(
                            obscurePassword.isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: SizeConfig.fromDesignHeight(context, 16)),
                      CustomTextfield(
                        label: 'Confirm Password',
                        hintext: 'Confirm New Password',
                        obscureText: obscurePasswords.isPasswordVisible,
                        controller: confirmNewPasswordController,
                        prefixIcon: const Icon(Icons.lock_rounded,
                            color: AppColors.black),
                        suffixIcon: GestureDetector(
                          onTap: () => obscurePasswords.visiblePassword(),
                          child: Icon(
                            obscurePasswords.isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.fromDesignHeight(context, 20)),
                ListenableBuilder(
                  listenable: Listenable.merge(
                      [newPasswordController, confirmNewPasswordController]),
                  builder: (BuildContext context, Widget? child) {
                    final enable = newPasswordController.text.isNotEmpty &&
                        confirmNewPasswordController.text.isNotEmpty;

                    return enable
                        ? LargeButon(
                            isloading:
                                ref.watch(authControllerProvider).status ==
                                    AuthStatus.loading,
                            label: 'Continue',
                            ontap: () {
                              if (confirmNewPasswordController.text ==
                                  newPasswordController.text) {
                                ref
                                    .read(authControllerProvider.notifier)
                                    .resetPassword(
                                      email: email,
                                      newPassword: newPasswordController.text,
                                      verificationCode: verificationCode,
                                    );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Passwords do not match')),
                                );
                              }
                            },
                          )
                        : LargeButonDisabled(
                            label: 'Continue',
                            ontap: () {},
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
