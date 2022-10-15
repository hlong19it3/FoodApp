import 'package:flutter/material.dart';

import '../values/app_data.dart';

class AppLogo extends StatelessWidget {
  final double? size;
  const AppLogo({
    Key? key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 100,
      width: size ?? 100,
      child: Center(
        child: Image.asset(
          AppData.logo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
