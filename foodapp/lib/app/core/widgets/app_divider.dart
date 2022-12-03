import 'package:flutter/material.dart';
import 'package:foodapp/app/core/themes/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColorStyles.black.shade300,
      ),
    );
  }
}
