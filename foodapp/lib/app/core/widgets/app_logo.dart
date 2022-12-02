import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../values/app_data.dart';

class AppLogo extends StatelessWidget {
  final double? size;
  const AppLogo({
    Key? key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: size ?? 203,
      width: size ?? 188,
      child: Center(
        child: SvgPicture.asset(
          AppData.logo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
