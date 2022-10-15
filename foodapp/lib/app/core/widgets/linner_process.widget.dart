import 'package:flutter/material.dart';

class LinearProcessWidget extends StatelessWidget {
  final double? width;
  const LinearProcessWidget({
    Key? key,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5,
      width: width ?? 100,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        child: LinearProgressIndicator(
          backgroundColor: Colors.grey.shade400,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey.shade300),
        ),
      ),
    );
  }
}
