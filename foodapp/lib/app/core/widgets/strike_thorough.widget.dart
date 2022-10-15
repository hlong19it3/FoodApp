import 'package:flutter/material.dart';

class StrikeThrough extends StatelessWidget {
  const StrikeThrough({
    Key? key,
    this.width = double.infinity,
    this.height = 1,
  }) : super(key: key);
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).iconTheme.color,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      height: 2,
      width: width,
    );
  }
}
