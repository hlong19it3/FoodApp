import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodapp/app/core/themes/app_colors.dart';

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
    this.onTap,
    this.focusNode,
  }) : super(key: key);
  final String? initialValue;
  final bool readOnly;
  final int minLines;
  final int? maxLines;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String) onChanged;
  final void Function()? onTap;
  final String prefixIconName;
  final Widget? suffixIcon;
  final String? errorText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? textLabel;
  final FocusNode? focusNode;
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
      onTap: onTap,
      focusNode: focusNode,
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
        suffixIconConstraints:
            const BoxConstraints(minWidth: 45, minHeight: 45),
        prefixIconConstraints:
            const BoxConstraints(minWidth: 45, minHeight: 45),
        prefixIcon: AppInputIcon(
          icon: prefixIconName,
        ),
        errorText: errorText != "" ? errorText : null,
        hintText: hintText,
        errorStyle: errorText == ""
            ? const TextStyle(height: 0)
            : const TextStyle(color: AppColorStyles.red),
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(
          color: AppColorStyles.black10,
        ),
      ),
      inputFormatters: inputFormatters ?? [],
    );
  }
}
