import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.gen.dart';
import 'app_icon_button.widget.dart';

class AppBarWithIconBack extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarWithIconBack({Key? key})
      : preferredSize = const Size.fromHeight(56),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: AppIconButton(
        onPress: () => Get.back(),
        icon: Assets.icons.chevronBackOutline,
      ),
    );
  }
}
