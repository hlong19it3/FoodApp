import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/app/core/themes/app_colors.dart';
import 'package:foodapp/app/core/themes/constants.dart';

class IconBottomBar extends StatelessWidget {
  const IconBottomBar({
    super.key,
    required this.icon,
    this.isCurrentPage = false,
    this.onTap,
  });
  final String icon;
  final bool isCurrentPage;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: onTap,
        radius: 8,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 40,
          width: 40,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              icon,
              color: isCurrentPage ? kPrimaryColor : AppColorStyles.black10,
              width: 24,
            ),
          ),
        ),
      ),
    );
  }
}
