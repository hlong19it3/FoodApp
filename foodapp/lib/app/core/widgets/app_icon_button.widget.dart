import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import 'app_svg_picture.widget.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    Key? key,
    required this.onPress,
    required this.icon,
    this.height = 40,
    this.width = 40,
    this.iconSize = 20,
    this.padding = 8,
  }) : super(key: key);
  final VoidCallback onPress;
  final String icon;
  final double height;
  final double width;
  final double iconSize;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColorStyles.black10,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          customBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          onTap: onPress,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: AppSvgPicture(
              icon: icon,
              size: iconSize,
              color: AppColorStyles.black10,
            ),
          ),
        ),
      ),
    );
  }
}
