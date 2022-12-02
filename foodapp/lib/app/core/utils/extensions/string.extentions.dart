extension StringExtend on String? {
  String useCorrectEllipsis() {
    return this!.replaceAll('', '\u200B');
  }

  bool get isAvailable => this != null && this?.trim() != "";

  String capitalizeFirstLetter() {
    return this != null && this!.isNotEmpty
        ? this![0].toUpperCase() + this!.substring(1)
        : "";
  }
}
