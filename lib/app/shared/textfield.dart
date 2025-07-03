import 'package:flaury_mobile/app/util/app_colors.dart';
import 'package:flaury_mobile/app/util/app_text_style.dart';
import 'package:flaury_mobile/app/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextfield extends StatelessWidget {
  const AuthTextfield({
    super.key,
    this.validator,
    this.keyboardType,
    required this.hintext,
    required this.obscureText,
    required this.controller,
    this.prefixIcon,
    this.onChanged,
    this.suffixIcon,
    required this.label,
  });

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBold(text: label, fontSize: 14),
        SizedBox(height: SizeConfig.fromDesignHeight(context, 5)),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller!,
          builder: (context, value, _) {
            final isFilled = value.text.isNotEmpty;

            return TextFormField(
              style: GoogleFonts.montserrat(
                decoration: TextDecoration.none,
                decorationThickness: 0,
                fontSize: 12,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              obscureText: obscureText,
              onChanged: onChanged,
              keyboardType: keyboardType,
              validator: validator,
              cursorColor: AppColors.primary,
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxHeight: SizeConfig.fromDesignHeight(context, 90),
                  minHeight: SizeConfig.fromDesignHeight(context, 42),
                ),
                hintText: hintext,
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                contentPadding: EdgeInsets.symmetric(
                  vertical: SizeConfig.fromDesignHeight(context, 2),
                  horizontal: SizeConfig.fromDesignWidth(context, 15),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: isFilled ? AppColors.primary : AppColors.grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: isFilled ? AppColors.primary : AppColors.grey,
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
                    color: AppColors.primary,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
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
      style: GoogleFonts.montserrat(
        decoration: TextDecoration.none,
        decorationThickness: 0,
        fontSize: SizeConfig.fontSize(context, 12),
      ),
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

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;

  final bool obscureText;
  final String label;
  final String hintext;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  const CustomTextfield({
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

class MainCustomTextfield extends StatelessWidget {
  final TextEditingController? controller;

  final bool obscureText;
  final String hintext;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final Function(String)? onchanged;
  const MainCustomTextfield({
    super.key,
    this.controller,
    required this.hintext,
    this.onchanged,
    this.keyboardType,
    required this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          decoration: TextDecoration.none,
          decorationThickness: 0,
          fontFamily: 'Figtree',
          fontSize: SizeConfig.fontSize(context, 16)),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // obscuringCharacter: '.',
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onchanged,

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
            color: AppColors.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.primary,
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
    );
  }
}

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key, this.items, this.onChanged, this.hint, this.isfilled = true});
  final List<DropdownMenuItem<String>>? items;
  final Function(dynamic)? onChanged;
  final String? hint;
  final bool isfilled;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        iconEnabledColor: AppColors.black,
        iconDisabledColor: AppColors.black,
        decoration: InputDecoration(
          filled: isfilled,
          fillColor: isfilled ? null : const Color(0xAAD9D9D9),
          isDense: true,
          iconColor: AppColors.black,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          constraints: BoxConstraints(
            maxHeight: SizeConfig.fromDesignHeight(context, 100),
            minHeight: SizeConfig.fromDesignHeight(context, 42),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xAAD9D9D9)),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xAAD9D9D9)),
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        hint: hint != null
            ? Text(
                hint!,
                textAlign: TextAlign.center, // Center the hint text
                style: GoogleFonts.montserrat(
                  color: AppColors.grey,
                  fontSize: SizeConfig.fontSize(context, 12),
                ),
              )
            : null,
        items: items,
        onChanged: onChanged);
  }
}

class OtpTextfield extends StatelessWidget {
  final String? hintText;
  final Function()? onTap;
  final Function(String?)? onSaved;
  final Color fillColor, activeFillColor;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final FocusNode focusNode;
  final VoidCallback? onBackspace;

  const OtpTextfield({
    super.key,
    this.hintText,
    this.onTap,
    this.onChanged,
    this.onSaved,
    this.controller,
    required this.focusNode,
    this.onBackspace,
    this.activeFillColor = AppColors.secondary,
    this.fillColor = AppColors.otpGrey,
  });

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: focusNode,
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.backspace) &&
            controller?.text.isEmpty == true &&
            onBackspace != null) {
          onBackspace!();
        }
      },
      child: TextFormField(
        onTap: onTap,
        showCursor: false,
        style: const TextStyle(
          fontFamily: 'Figtree',
          fontWeight: FontWeight.w900,
          fontSize: 12,
        ),
        onChanged: onChanged,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        onSaved: onSaved,
        textAlign: TextAlign.center,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          constraints: BoxConstraints(
            maxHeight: SizeConfig.fromDesignHeight(context, 50),
            maxWidth: SizeConfig.fromDesignHeight(context, 50),
          ),
          fillColor: fillColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fillColor),
            borderRadius: BorderRadius.circular(17),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
            borderSide: BorderSide(color: activeFillColor),
          ),
        ),
      ),
    );
  }
}

class OtpInputField extends StatefulWidget {
  final int otpLength;
  final String label;
  final bool autoFocus;
  final void Function(String)? onCompleted;

  // New optional styling parameters
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double borderRadius;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry contentPadding;
  final List<TextEditingController> controllers;
  const OtpInputField({
    super.key,
    this.otpLength = 6,
    this.controllers = const [],
    this.label = "",
    this.autoFocus = false,
    this.onCompleted,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.borderRadius = 12.0,
    this.textStyle,
    this.contentPadding = const EdgeInsets.symmetric(vertical: 14),
  });

  @override
  State<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();

    _focusNodes = List.generate(widget.otpLength, (_) => FocusNode());
    if (widget.autoFocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNodes.first.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onInputChanged(int index, String value) {
    if (value.isNotEmpty && index < widget.otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_focusNodes.length != widget.otpLength) {
      return const SizedBox();
    }

    final borderColor = widget.borderColor ?? AppColors.otpGrey;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.otpLength, (index) {
        return SizedBox(
          height: SizeConfig.fromDesignHeight(context, 60),
          width: SizeConfig.fromDesignHeight(context, 50),
          child: TextField(
            controller: widget.controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: TextStyle(
              fontSize: SizeConfig.fontSize(context, 16),
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              constraints: BoxConstraints(
                maxHeight: SizeConfig.fromDesignHeight(context, 60),
                maxWidth: SizeConfig.fromDesignHeight(context, 50),
              ),
              fillColor: widget.fillColor,
              filled: true,
              contentPadding: widget.contentPadding,
              border: _border(borderColor),
              focusedBorder: _border(AppColors.secondary),
              enabledBorder: _border(AppColors.otpGrey),
              counterText: '',
            ),
            onChanged: (value) => _onInputChanged(index, value),
          ),
        );
      }),
    );
  }
}

class RangeTextfield extends StatelessWidget {
  const RangeTextfield({super.key, this.controller, this.hinttext});
  final TextEditingController? controller;
  final String? hinttext;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(
            fontFamily: 'Figtree',
            fontSize: 14,
          ),
          constraints: BoxConstraints(
            maxHeight: SizeConfig.fromDesignHeight(context, 46),
            maxWidth: SizeConfig.fromDesignWidth(context, 119),
          ),
          filled: true,
          fillColor: const Color(0xAAD9D9D9),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color(0xAAD9D9D9))),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color(0xAAD9D9D9))),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Color(0xAAD9D9D9)))),
    );
  }
}

class ChatTextField extends StatelessWidget {
  const ChatTextField(
      {super.key, required this.hintText, this.controller, this.keyboardtype});
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardtype;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primary,
      controller: controller,
      keyboardType: keyboardtype,
      style: GoogleFonts.montserrat(
        color: AppColors.black,
        fontSize: SizeConfig.fontSize(context, 12),
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.image_outlined),
        suffixIconColor: AppColors.grey100,
        filled: true,
        fillColor: AppColors.greychattextfield,
        hintText: hintText,
        hintStyle: GoogleFonts.montserrat(
          color: AppColors.black,
          fontSize: SizeConfig.fontSize(context, 12),
          fontWeight: FontWeight.normal,
        ),
        constraints: BoxConstraints(
            maxHeight: SizeConfig.fromDesignHeight(context, 70),
            minHeight: SizeConfig.fromDesignHeight(context, 40)),
        contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.fromDesignHeight(context, 2),
            horizontal: SizeConfig.fromDesignWidth(context, 15)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.greychattextfield,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.greychattextfield,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.greychattextfield,
          ),
        ),
      ),
    );
  }
}
