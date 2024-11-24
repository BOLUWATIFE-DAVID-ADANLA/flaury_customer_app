import 'package:flaury_mobile/app/shared/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextBold extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final TextAlign? textAlign;

  AppTextBold(
      {super.key,
      required this.text,
      required this.fontSize,
      this.color,
      this.textAlign}) {
    // Runtime check to ensure fontSize is within the range of 10 to 24.
    if (fontSize < 6 || fontSize > 60) {
      throw ArgumentError('Font size must be between 6 and 60');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: GoogleFonts.montserrat(
          color: color,
          fontSize: SizeConfig.fontSize(context, fontSize),
          fontWeight: FontWeight.w700,
        ));
  }
}

class AppTextSemiBold extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign? textAlign;

  final Color? color;

  AppTextSemiBold(
      {super.key,
      required this.text,
      required this.fontSize,
      this.color,
      this.textAlign}) {
    // Runtime check to ensure fontSize is within the range of 10 to 24.
    if (fontSize < 6 || fontSize > 60) {
      throw ArgumentError('Font size must be between 8 and 60');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: SizeConfig.fontSize(context, fontSize),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class AppTextRegular extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  AppTextRegular(
      {super.key,
      required this.text,
      required this.fontSize,
      this.textAlign,
      this.overflow = TextOverflow.ellipsis,
      this.color}) {
    // Runtime check to ensure fontSize is within the range of 10 to 24.
    if (fontSize < 6 || fontSize > 60) {
      throw ArgumentError('Font size must be between 8 and 60');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: SizeConfig.fontSize(context, fontSize),
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
