import 'package:flaury_mobile/app/config/size_config.dart';
import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/custom_padding.dart';
import 'package:flaury_mobile/app/src/authentication/providers/provider.dart';
import 'package:flaury_mobile/app/routes/app_routes.dart';
import 'package:flaury_mobile/app/shared/app_spacing.dart';
import 'package:flaury_mobile/app/shared/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/shared/util/validator.dart';
import 'package:flaury_mobile/app/shared/widgets/textfield.dart';
import 'package:flaury_mobile/app/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInView extends StatefulHookConsumerWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Visible = ref.watch(passwordvisible);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SymetricPadding(
            h: 24,
            v: 0,
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 20),
                  ), //a
                  // header text
                  Row(
                    children: [
                      AppTextBold(
                        text: 'Hi, Welcome Back',
                        fontSize: 24,
                      ),
                      Image.asset(hello),
                    ],
                  ),

                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 7),
                  ), //a

                  AppTextBold(
                      text: 'Connect with your glow with Flaury', fontSize: 14),

                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 24),
                  ), //a

                  //email field
                  AuthTextfield(
                    hintext: 'enter your email',
                    obscureText: false,
                    controller: _emailcontroller,
                    label: 'Email Address',
                    validator: Validator.emailValidator,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 14),
                  ), //a

                  //password field
                  AuthTextfield(
                    hintext: 'Enter your password',
                    obscureText: Visible.isPasswordVisible,
                    controller: _passwordController,
                    label: 'Password',
                    validator: Validator.passwordValidator,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        Visible.visiblePassword();
                      },
                      child: Icon(Visible.isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),

                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 10),
                  ), //a
                  // remember me & forgot password

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //checkbox
                      Row(
                        children: [
                          const Checkbox(value: false, onChanged: null),
                          AppTextBold(text: 'Remember Me', fontSize: 14)
                        ],
                      ),

                      //forgot password text
                      InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, AppRoutes.forgotPassword),
                          child: AppTextBold(
                            text: 'Forgot Password?',
                            fontSize: 16,
                            color: AppColors.primary,
                          ))
                    ],
                  ),

                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 30),
                  ),

                  //sign in button
                  ListenableBuilder(
                    listenable: Listenable.merge(
                        [_passwordController, _emailcontroller]),
                    builder: (context, child) {
                      final enable = _emailcontroller.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty;
                      return enable
                          ? LargeButon(
                              label: 'Log in',
                              ontap: () {
                                //implement sign in logic here
                              })
                          : LargeButonDisabled(label: 'Log in', ontap: () {});
                    },
                  ),

                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 20),
                  ), //a

                  //dont have an account create account
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppTextBold(
                          text: 'Don’t have an account?',
                          fontSize: 14,
                          color: AppColors.grey,
                        ),
                        const AppSpacing(
                          v: 6,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.registerCustomerView);
                          },
                          child: AppTextBold(
                            text: 'Sign Up',
                            fontSize: 16,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
