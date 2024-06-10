import 'package:flaury_mobile/app/shared/app_colors.dart';
import 'package:flaury_mobile/app/shared/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NumButton extends StatelessWidget {
  final String num;
  final Function()? onTap;
  const NumButton({super.key, required this.num, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 70.h,
        width: 89.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17.r),
            color: AppColors.otpGrey),
        child: AppTextBold(text: num, fontSize: 24),
      ),
    );
  }
}

// class Button extends StatelessWidget {
//   final String num;
//   final Function()? onTap;
//   const NumButton({super.key, required this.num, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         alignment: Alignment.center,
//         height: 70.h,
//         width: 89.w,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(17.r),
//             color: AppColors.otpGrey),
//         child: Text(
//           num,
//           style: AppText.primarybold24,
//         ),
//       ),
//     );
//   }
// }
