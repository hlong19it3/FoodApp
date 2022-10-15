import 'package:foodapp/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgPicture extends StatelessWidget {
  const AppSvgPicture({
    Key? key,
    required this.icon,
    this.size,
    this.color,
  }) : super(key: key);
  final String icon;
  final double? size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SvgPicture.asset(
        icon,
        color: color ?? AppColors.iconColor,
        height: size ?? 20,
        width: size ?? 20,
      ),
    );
  }
}
