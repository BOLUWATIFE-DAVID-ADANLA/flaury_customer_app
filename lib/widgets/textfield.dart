import 'package:flaury_mobile/shared/app_colors.dart';
import 'package:flaury_mobile/shared/app_spacing.dart';
import 'package:flaury_mobile/shared/app_text_style.dart';
import 'package:flutter/material.dart';

class AuthTextfield extends StatelessWidget {
  const AuthTextfield(
      {super.key,
      this.validator,
      required this.hintext,
      required this.obscureText,
      required this.controller,
      this.onChanged,
      this.suffixIcon,
      required this.label});
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String label;
  final bool obscureText;
  final String hintext;
  final Function(String)? onChanged;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppText.bold16,
          ),
          const AppSpacing(
            h: 5,
          ),
          TextFormField(
            style: const TextStyle(
              decoration: TextDecoration.none,
              decorationThickness: 0,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            obscureText: obscureText,
            onChanged: onChanged,
            validator: validator,
            cursorColor: AppColors.primary,
            decoration: InputDecoration(
              constraints: const BoxConstraints(maxHeight: 70, minHeight: 42),
              hintText: hintext,
              suffixIcon: suffixIcon,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: AppColors.grey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: AppColors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: AppColors.black,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ]);
  }
}

class RegularTextField extends StatelessWidget {
  const RegularTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 70, minHeight: 42),
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.primary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
