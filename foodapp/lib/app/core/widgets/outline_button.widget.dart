// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../core/values/app_colors.dart';

// class OutlinedButtonWidget extends StatelessWidget {
//   const OutlinedButtonWidget(
//       {Key? key, required this.text, this.color, this.icon})
//       : super(key: key);
//   final String text;
//   final Color? color;
//   final String? icon;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 47,
//       width: double.infinity,
//       child: icon != null
//           ? OutlinedButton.icon(
//               label: Text(text),
//               icon: SvgPicture.asset("assets/icons/$icon.svg"),
//               onPressed: () {},
//               style: OutlinedButton.styleFrom(
//                 backgroundColor: color ?? Colors.transparent,
//                 side: const BorderSide(
//                   width: 1.0,
//                   color: AppColors.border,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             )
//           : OutlinedButton(
//               child: Text(text),
//               onPressed: () {},
//               style: OutlinedButton.styleFrom(
//                 backgroundColor: color ?? Colors.transparent,
//                 side: const BorderSide(
//                   width: 1.0,
//                   color: AppColors.border,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//     );
//   }
// }
