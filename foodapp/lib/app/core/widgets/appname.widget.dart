import 'package:flutter/material.dart';
import 'package:foodapp/app/core/themes/app_colors.dart';

import '../values/app_data.dart';

class AppName extends StatelessWidget {
  const AppName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppData.name.toUpperCase(),
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 25,
        letterSpacing: 7,
        color: AppColorStyles.black10,
      ),
    );
  }
}
