// import 'package:flaury_mobile/app/shared/app_colors.dart';
// import 'package:flaury_mobile/app/shared/app_text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SelectUserRole extends StatelessWidget {
//   const SelectUserRole(
//       {super.key,
//       required this.image,
//       required this.subtitle,
//       required this.title,
//       required this.ontap});

//   final String image;
//   final String title;
//   final String subtitle;
//   final Function()? ontap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: ontap,
//       child: Container(
//         height: 260.h,
//         width: 160.w,
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColors.primary, width: 1),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               flex: 2, 
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         topRight: Radius.circular(10)),
//                     image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: AssetImage(
//                         image,
//                       ),
//                     )),
//               ),
//             ),
//             //
//             //
//             Expanded(
//                 child: Container(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 children: [
//                   Text(
//                     title,
//                     style: AppText.bold16,
//                   ),
//                   Text(
//                     subtitle,
//                     style: AppText.semibold14,
//                     textAlign: TextAlign.center,
//                   )
//                 ],
//               ),
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }
