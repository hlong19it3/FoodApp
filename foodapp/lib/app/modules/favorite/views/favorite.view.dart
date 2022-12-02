import 'package:flutter/widgets.dart';
import 'package:foodapp/app/core/themes/app_texts.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Favoritee view",
        style: AppTextStyles.mobileBody,
      ),
    );
  }
}
