import 'package:flutter/material.dart';
import 'package:foodapp/app/core/themes/app_colors.dart';


class DotForListView extends StatelessWidget {
  const DotForListView({
    Key? key,
    required this.currentPage,
    required this.index,
    this.isHorizontal = false,
  }) : super(key: key);

  final int currentPage;
  final int index;
  final bool isHorizontal;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.only(bottom: 5),
      height: isHorizontal
          ? 7
          : currentPage == index
              ? 30
              : 7,
      width: isHorizontal
          ? currentPage == index
              ? 30
              : 7
          : 7,
      decoration: BoxDecoration(
        color: currentPage == index
            ? AppColorStyles.red
            : Theme.of(context).iconTheme.color,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
