import 'package:flutter/material.dart';

import 'app_svg_picture.widget.dart';

class AppInputIcon extends StatelessWidget {
  const AppInputIcon({
    Key? key,
    required this.icon,
    this.isPrefix = true,
  }) : super(key: key);
  final String icon;
  final bool isPrefix;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isPrefix
          ? const EdgeInsets.fromLTRB(10, 10, 10, 10)
          : const EdgeInsets.fromLTRB(0, 10, 10, 10),
      child: AppSvgPicture(
        icon: icon,
        size: 25,
      ),
    );
  }
}
