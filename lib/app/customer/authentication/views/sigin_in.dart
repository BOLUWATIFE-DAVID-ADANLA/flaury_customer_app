import 'package:flaury_mobile/app/customer/authentication/views/register_customer_view.dart';
import 'package:flaury_mobile/routes/app_routes.dart';
import 'package:flaury_mobile/shared/app_spacing.dart';
import 'package:flaury_mobile/shared/app_text_style.dart';
import 'package:flaury_mobile/util/images_icons_illustration.dart';
import 'package:flaury_mobile/util/validator.dart';
import 'package:flaury_mobile/widgets/textfield.dart';
import 'package:flaury_mobile/widgets/custom_button.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppSpacing(h: 30),
                // header text
                Row(
                  children: [
                    Text(
                      'Hi, Welcome Back',
                      style: AppText.bold24,
                    ),
                    Image.asset(hello),
                  ],
                ),

                AppSpacing.h12(),

                Text(
                  'Hello, check out what you missed!',
                  style: AppText.bold14,
                ),

                AppSpacing.h30(),

                //email field
                AuthTextfield(
                  hintext: 'enter your email',
                  obscureText: false,
                  controller: _emailcontroller,
                  label: 'Email Address',
                  validator: Validator.emailValidator,
                ),

                AppSpacing.h14(),

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

                // remember me & forgot password

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //checkbox
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: null),
                        Text(
                          'Remember Me',
                          style: AppText.bold12,
                        ),
                      ],
                    ),

                    //forgot password text
                    Text(
                      'Forgot Password?',
                      style: AppText.pbold12,
                    )
                  ],
                ),
                //sign in button
                ListenableBuilder(
                  listenable:
                      Listenable.merge([_passwordController, _emailcontroller]),
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

                AppSpacing.h20(),

                //dont have an account create account
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: AppText.bold16,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.registerCustomerView);
                        },
                        child: Text(
                          'Sign Up',
                          style: AppText.pbold16,
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
    );
  }
}
