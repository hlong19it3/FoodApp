import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../../../generated/locales.g.dart';
import '../../constants/config.enum.dart';

extension DoubleExtend on num {
  String formatCurrentUnit({
    String? displayFormat = '#,###',
    String? langCode = LanguageEnum.Vietnam,
    bool hasSymbol = false,
  }) {
    final prefix = hasSymbol ? "${LocaleKeys.CurrentUnit.tr} " : "";
    return prefix + NumberFormat(displayFormat, langCode).format(this);
  }
}
