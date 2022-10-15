extension StringExtend on String? {
  String useCorrectEllipsis() {
    return this!.replaceAll('', '\u200B');
  }
}