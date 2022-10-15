import 'un_supported_screen.dart';
import 'package:flutter/material.dart';

import 'app/core/constants/breakpoints.dart';

class AppResponsive extends StatelessWidget {
  final Widget? desktopScreen;
  final Widget? tableScreen;
  final Widget mobileScreen;
  final Widget? unsupportedScreen;

  const AppResponsive({
    this.desktopScreen,
    this.tableScreen,
    required this.mobileScreen,
    this.unsupportedScreen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              switch (Breakpoints(context: context).device()) {
                case Device.Desktop:
                  return desktopScreen ?? mobileScreen;
                case Device.Tablet:
                  return tableScreen ?? desktopScreen ?? mobileScreen;
                case Device.Mobile:
                  return mobileScreen;
                default:
                  return unsupportedScreen ?? const UnSupportedScreen();
              }
            },
          ),
        ),
      ],
    );
  }
}
