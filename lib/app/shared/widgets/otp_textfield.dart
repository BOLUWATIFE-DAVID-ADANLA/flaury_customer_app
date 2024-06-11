import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextfield extends StatelessWidget {
  final String? hintText;
  final Function()? onTap;
  final Function(String?)? onSaved;
  final Color fillColor, activeFillColor;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const OtpTextfield({
    super.key,
    this.hintText,
    this.onTap,
    this.onChanged,
    this.onSaved,
    this.controller,
    this.activeFillColor = AppColors.secondary,
    this.fillColor = AppColors.otpGrey,
  });

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return TextFormField(
      onTap: onTap,
      showCursor: false,
      style: const TextStyle(
          fontFamily: 'Figtree', fontWeight: FontWeight.w700, fontSize: 24),

      onChanged: onChanged,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
      onSaved: onSaved,
      textAlign: TextAlign.center,
      controller: controller,
      // showCursor: false,
      focusNode: focusNode,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: hintText,
          constraints: BoxConstraints(
            maxHeight: SizeConfig.fromDesignHeight(context, 70),
            maxWidth: SizeConfig.fromDesignHeight(context, 71),
          ),
          fillColor: fillColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fillColor),
            borderRadius: BorderRadius.circular(17),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: BorderSide(color: activeFillColor))),
    );
  }
}
