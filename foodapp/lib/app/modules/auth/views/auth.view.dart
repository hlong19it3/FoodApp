import 'package:foodapp/app/core/widgets/spacer.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_data.dart';
import '../../../core/widgets/app_logo.dart';
import '../../../core/widgets/appname.widget.dart';
import '../../../core/widgets/dismis_keyboard.widget.dart';
import '../../../core/widgets/linner_process.widget.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const AppLogo(),
                      const VSpacer(10),
                      const AppName(),
                      const VSpacer(10),
                      Text(
                        AppData.sloganEn,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const LinearProcessWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
