import 'package:flaury_mobile/shared/app_colors.dart';
import 'package:flaury_mobile/shared/app_spacing.dart';
import 'package:flaury_mobile/shared/app_text_style.dart';
import 'package:flaury_mobile/util/images_icons_illustration.dart';
import 'package:flaury_mobile/util/validator.dart';
import 'package:flaury_mobile/shared/widgets/textfield.dart';
import 'package:flaury_mobile/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterCustomerView extends StatefulHookConsumerWidget {
  const RegisterCustomerView({super.key});

  @override
  ConsumerState<RegisterCustomerView> createState() =>
      _RegisterCustomerViewState();
}

class _RegisterCustomerViewState extends ConsumerState<RegisterCustomerView> {
  final GlobalKey _formkey = GlobalKey<FormState>();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _namecontroller.dispose();
    _passwordcontroller.dispose();
    _phonecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final obscurePassword = ref.watch(passwordvisible);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // appbar
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const ImageIcon(AssetImage(back), size: 20),
                        ),
                        const AppSpacing(v: 4),
                        Text(
                          'Create your account',
                          style: AppText.bold24,
                        ),
                      ],
                    ),
                    const AppSpacing(h: 40),
                    //name textfield
                    AuthTextfield(
                      hintext: 'Becca Braunch',
                      obscureText: false,
                      validator: Validator.nameValidator,
                      controller: _namecontroller,
                      label: 'Name',
                    ),
                    AppSpacing.h20(),
                    //email textfield
                    AuthTextfield(
                      hintext: 'info@flaury.email.com',
                      obscureText: false,
                      validator: Validator.emailValidator,
                      controller: _emailcontroller,
                      label: 'Email Address',
                    ),
                    const AppSpacing(h: 10),

                    //password field

                    AuthTextfield(
                        hintext: 'Enter Your Password',
                        obscureText: obscurePassword.isPasswordVisible,
                        validator: Validator.passwordValidator,
                        controller: _passwordcontroller,
                        label: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            obscurePassword.visiblePassword();
                          },
                          child: Icon(obscurePassword.isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                        )),

                    AppSpacing.h20(),

                    //phone number textfield
                    AuthTextfield(
                      hintext: '08012345678',
                      obscureText: false,
                      validator: Validator.validatePhoneNumber,
                      controller: _phonecontroller,
                      label: 'Phone Number',
                    ),
                    const AppSpacing(h: 32),

                    //terms and condition text
                    Text(
                      'Clicking the “continue” button means I agree to the Terms & Conditions and Privacy Policy of FLAURY',
                      style: AppText.pbold10,
                      textAlign: TextAlign.center,
                    ),

                    const AppSpacing(h: 15),

                    //sign up button
                    ListenableBuilder(
                        listenable: Listenable.merge([
                          _emailcontroller,
                          _namecontroller,
                          _phonecontroller,
                          _passwordcontroller,
                        ]),
                        builder: (context, child) {
                          final enable = _emailcontroller.text.isNotEmpty &&
                              _namecontroller.text.isNotEmpty &&
                              _passwordcontroller.text.isNotEmpty &&
                              _phonecontroller.text.isNotEmpty;

                          return enable
                              ? LargeButon(
                                  label: "Sign up",
                                  ontap: () {
                                    // sign in logic
                                  },
                                )
                              : const LargeButonDisabled(
                                  label: 'Sign up', ontap: null);
                        }),

                    const AppSpacing(h: 27),

                    //this routes to the sign in page

                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already Have an account? ',
                            style: AppText.gsemibold16,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Login',
                              style: AppText.pbold16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final passwordvisible = ChangeNotifierProvider((ref) => Passwordvisible());

class Passwordvisible extends ChangeNotifier {
  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void visiblePassword() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}
