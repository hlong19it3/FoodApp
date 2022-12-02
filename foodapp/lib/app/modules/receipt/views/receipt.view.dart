import 'package:flutter/widgets.dart';
import 'package:foodapp/app/core/themes/app_texts.dart';

class ReceiptView extends StatelessWidget {
  const ReceiptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "ReceiptView view",
        style: AppTextStyles.mobileBody,
      ),
    );
  }
}
