import 'package:flutter/material.dart';

class SmoothKeyboard extends StatelessWidget {
  const SmoothKeyboard({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: child,
    );
  }
}
