import 'package:flutter/widgets.dart';
import 'package:foodapp/app/core/themes/app_texts.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "ProfileView view",
        style: AppTextStyles.mobileBody,
      ),
    );
  }
}
