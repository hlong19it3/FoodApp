import 'package:flutter/material.dart';

import '../values/color_styles.dart';
import 'app_svg_picture.widget.dart';

class OutlineIconButton extends StatelessWidget {
  const OutlineIconButton({
    Key? key,
    required this.icon,
    this.name,
    required this.onPress,
  }) : super(key: key);
  final String icon;
  final String? name;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      onTap: onPress,
      child: Container(
        height: 45,
        constraints: const BoxConstraints(minWidth: 45),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            color: Theme.of(context).iconTheme.color ?? ColorStyles.border,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppSvgPicture(icon: icon),
              SizedBox(
                width: name != null ? 5 : 0,
              ),
              name != null
                  ? Text(
                      name!,
                      style: const TextStyle(
                        // color: Colors.black,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
