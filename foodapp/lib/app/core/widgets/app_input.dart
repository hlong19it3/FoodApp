import '../values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_input_icon.dart';
import 'components/outline_input_border.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    Key? key,
    this.initialValue,
    this.readOnly = false,
    this.minLines = 1,
    this.maxLines,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType,
    required this.onChanged,
    required this.prefixIconName,
    this.suffixIcon,
    this.errorText,
    this.maxLength,
    this.inputFormatters,
    this.controller,
    this.textLabel,
  }) : super(key: key);
  final String? initialValue;
  final bool readOnly;
  final int minLines;
  final int? maxLines;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String) onChanged;
  final String prefixIconName;
  final Widget? suffixIcon;
  final String? errorText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? textLabel;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      initialValue: initialValue,
      minLines: minLines,
      maxLines: maxLines ?? minLines,
      maxLength: maxLength,
      obscureText: obscureText,
      keyboardType: keyboardType ?? TextInputType.text,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        label: textLabel != null ? Text(textLabel!) : null,
        counter: const Offstage(),
        focusedBorder: focusedOutlineInputBorder(),
        border: outlineInputBorder(context),
        contentPadding: EdgeInsets.only(
          top: 0,
          bottom: 0,
          left: 10,
          right: suffixIcon == null ? 10 : 0,
        ),
        suffixIconConstraints: const BoxConstraints(minWidth: 0, maxHeight: 45),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, maxHeight: 45),
        prefixIcon: AppInputIcon(
          icon: prefixIconName,
        ),
        errorText: errorText != "" ? errorText : null,
        hintText: hintText,
        errorStyle: errorText == ""
            ? const TextStyle(height: 0)
            : TextStyle(color: AppColors.error),
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
          color: AppColors.iconColor,
        ),
      ),
      inputFormatters: inputFormatters ?? [],
    );
  }
}
