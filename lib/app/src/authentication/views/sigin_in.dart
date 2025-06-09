import 'package:flaury_mobile/app/services/secure_storage.dart';
import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flaury_mobile/app/util/app_spacing.dart';
import 'package:flaury_mobile/app/util/app_text_style.dart';
import 'package:flaury_mobile/app/util/custom_padding.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flaury_mobile/app/src/authentication/providers/provider.dart';
import 'package:flaury_mobile/app/util/images_icons_illustration.dart';
import 'package:flaury_mobile/app/util/validator.dart';
import 'package:flaury_mobile/app/shared/textfield.dart';
import 'package:flaury_mobile/app/shared/custom_button.dart';
import 'package:flaury_mobile/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/auth_controller.dart';

class SignInView extends StatefulHookConsumerWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  bool doYouWantToRemember = false;
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _fomKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadRememberedEmail();
    });
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> loadRememberedEmail() async {
    try {
      // 1. Check if we should remember
      final shouldRemember =
          await ref.read(sharedprefrenceProvider).getBool('rememberMe') ??
              false;
      debugPrint('Remember me flag: $shouldRemember');

      if (!shouldRemember) return;

      // 2. Get stored email
      final storedEmail =
          await ref.read(sharedprefrenceProvider).getString('storedUserEmail');
      debugPrint('Retrieved stored email: $storedEmail');

      // 3. Update UI if widget is still mounted
      if (storedEmail != null && mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            setState(() {
              _emailcontroller.text = storedEmail;
              // Also update the checkbox state
              doYouWantToRemember = true;
            });
          }
        });
      }
    } catch (e) {
      debugPrint('Error loading remembered email: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final visible = ref.watch(passwordvisible);
    // manges the authentication state of the app
    ref.listen<AuthState>(authControllerProvider, (prev, next) {
      if (next.status == AuthStatus.success) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.dashboard,
        );
      } else if (next.status == AuthStatus.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message)),
        );
      }
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SymetricPadding(
            h: 24,
            v: 0,
            child: Form(
              key: _fomKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 18),
                  ), //a
                  // header text
                  Row(
                    children: [
                      AppTextBold(
                        text: 'Hi, Welcome Back',
                        fontSize: 20,
                      ),
                      Image.asset(hello),
                    ],
                  ),

                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 7),
                  ), //a

                  AppTextBold(
                      text: 'Connect with your glow with Flaury', fontSize: 12),

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
                    onChanged: (v) {},
                  ),

                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 14),
                  ), //a

                  //password field
                  AuthTextfield(
                    hintext: 'Enter your password',
                    obscureText: visible.isPasswordVisible,
                    controller: _passwordController,
                    label: 'Password',
                    validator: Validator.passwordValidator,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        visible.visiblePassword();
                      },
                      child: Icon(visible.isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),

                  SizedBox(
                    height: SizeConfig.fromDesignHeight(context, 10),
                  ), //a
                  // remember me & forgot password

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //checkbox
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: SizeConfig.fromDesignHeight(context, 24),
                            width: SizeConfig.fromDesignWidth(context, 24),
                            child: Checkbox(
                              checkColor: AppColors.white,
                              fillColor: WidgetStateProperty.resolveWith<Color>(
                                  (Set<WidgetState> states) {
                                if (states.contains(WidgetState.selected)) {
                                  return AppColors.primary;
                                }
                                return Colors.transparent;
                              }),
                              value: doYouWantToRemember,
                              onChanged: (value) async {
                                setState(() {
                                  doYouWantToRemember = value!;
                                  print('value $doYouWantToRemember');
                                });
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                          const AppSpacing(h: 10),
                          AppTextBold(text: 'Remember Me', fontSize: 12)
                        ],
                      ),
                      const Spacer(),
                      //forgot password text
                      InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, AppRoutes.forgotPassword),
                          child: AppTextBold(
                            text: 'Forgot Password?',
                            fontSize: 14,
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
                              isloading:
                                  ref.watch(authControllerProvider).status ==
                                      AuthStatus.loading,
                              label: 'Log in',
                              ontap: () async {
                                if (_fomKey.currentState!.validate()) {
                                  ref
                                      .read(authControllerProvider.notifier)
                                      .login(
                                          email: _emailcontroller.text,
                                          password: _passwordController.text);

                                  ref.read(sharedprefrenceProvider).setBool(
                                      'rememberMe', doYouWantToRemember);
                                  if (doYouWantToRemember) {
                                    await ref
                                        .read(sharedprefrenceProvider)
                                        .setString('storedUserEmail',
                                            _emailcontroller.text);

                                    // Verify it was saved
                                  }
                                }
                              })
                          : const LargeButonDisabled(
                              label: 'Log in', ontap: null);
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
                          fontSize: 12,
                          color: AppColors.grey,
                        ),
                        SizedBox(
                          width: SizeConfig.fromDesignWidth(context, 6),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.registerCustomerView);
                          },
                          child: AppTextBold(
                            text: 'Sign Up',
                            fontSize: 14,
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
