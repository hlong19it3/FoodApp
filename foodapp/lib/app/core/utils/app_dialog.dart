import 'package:foodapp/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  static confirm({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onPressed,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        backgroundColor: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        buttonPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        actions: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Get.back(),
                  child: Text(LocaleKeys.Button_Cancel.tr),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: onPressed,
                  child: Text(LocaleKeys.Button_Yes.tr),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
