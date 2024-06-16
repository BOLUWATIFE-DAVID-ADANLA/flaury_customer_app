import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flutter/material.dart';

class AuthTextfield extends StatelessWidget {
  const AuthTextfield(
      {super.key,
      this.validator,
      this.keyboardType,
      required this.hintext,
      required this.obscureText,
      required this.controller,
      this.prefixIcon,
      this.onChanged,
      this.suffixIcon,
      required this.label});
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String label;
  final bool obscureText;
  final String hintext;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextBold(text: label, fontSize: 14),
          SizedBox(
            height: SizeConfig.fromDesignHeight(context, 5),
          ),
          TextFormField(
            style: const TextStyle(
              decoration: TextDecoration.none,
              decorationThickness: 0,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // obscuringCharacter: '.',
            controller: controller,
            obscureText: obscureText,
            onChanged: onChanged,
            keyboardType: keyboardType,

            validator: validator,
            cursorColor: AppColors.primary,
            decoration: InputDecoration(
              constraints: BoxConstraints(
                  maxHeight: SizeConfig.fromDesignHeight(context, 90),
                  minHeight: SizeConfig.fromDesignHeight(context, 42)),
              hintText: hintext,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              contentPadding: EdgeInsets.symmetric(
                  vertical: SizeConfig.fromDesignHeight(context, 2),
                  horizontal: SizeConfig.fromDesignWidth(context, 15)),
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
                  color: AppColors.primary,
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
  const RegularTextField(
      {super.key, required this.hintText, this.controller, this.keyboardtype});
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardtype;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        hintText: hintText,
        constraints: BoxConstraints(
            maxHeight: SizeConfig.fromDesignHeight(context, 70),
            minHeight: SizeConfig.fromDesignHeight(context, 42)),
        contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.fromDesignHeight(context, 2),
            horizontal: SizeConfig.fromDesignWidth(context, 15)),
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

class NewTextfield extends StatelessWidget {
  final TextEditingController? controller;

  final bool obscureText;
  final String label;
  final String hintext;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  const NewTextfield({
    super.key,
    required this.label,
    this.controller,
    required this.hintext,
    this.keyboardType,
    required this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextSemiBold(text: label, fontSize: 16),
          SizedBox(
            height: SizeConfig.fromDesignHeight(context, 8),
          ),
          TextFormField(
            style: const TextStyle(
              decoration: TextDecoration.none,
              decorationThickness: 0,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // obscuringCharacter: '.',
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,

            cursorColor: AppColors.primary,
            decoration: InputDecoration(
              constraints: BoxConstraints(
                  maxHeight: SizeConfig.fromDesignHeight(context, 70),
                  minHeight: SizeConfig.fromDesignHeight(context, 42)),
              hintText: hintext,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              contentPadding: EdgeInsets.symmetric(
                  vertical: SizeConfig.fromDesignHeight(context, 2),
                  horizontal: SizeConfig.fromDesignWidth(context, 15)),
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
                  color: AppColors.primary,
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
