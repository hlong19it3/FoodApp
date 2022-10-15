import 'package:flutter/material.dart';

import '../values/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  const AppButton({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          color: AppColors.iconColor,
        ),
        color: Colors.transparent,
      ),
      child: InkWell(
        onTap: onPress,
        // splashColor: Colors.green.withOpacity(0.5),
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
              color: AppColors.text,
              fontWeight: FontWeight.w500,
              letterSpacing: 3,
            ),
          ),
        ),
      ),
    );
  }
}
