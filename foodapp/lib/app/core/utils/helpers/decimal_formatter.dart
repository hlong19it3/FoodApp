import 'dart:math';

import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class DecimalFormatter extends TextInputFormatter {
  final int maxNumbers;
  NumberFormat currencyFormat = NumberFormat.currency(
    locale: 'vi-VN',
    customPattern: '###,###',
    decimalDigits: 0,
  );

  DecimalFormatter({
    this.maxNumbers = 18,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newText = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    if (newText.trim() == '' || newText.trim() == '0') {
      return newValue.copyWith(text: '');
    } else if (int.parse(newText) < 1) {
      return newValue.copyWith(text: '');
    } else if (newText.length > maxNumbers) {
      return TextEditingValue(
        text: oldValue.text,
        selection: TextSelection.collapsed(
          offset: oldValue.selection.end,
        ),
      );
    }

    dynamic newInt = int.parse(newText);
    var selectionIndexFromTheRight =
        newValue.text.length - newValue.selection.end;
    if (currencyFormat.decimalDigits! > 0) {
      newInt /= pow(10, currencyFormat.decimalDigits!);
    }
    final newString = currencyFormat.format(newInt);
    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(
        offset: newString.length - selectionIndexFromTheRight,
      ),
    );
  }
}
