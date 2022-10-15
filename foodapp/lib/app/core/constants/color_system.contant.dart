abstract class ColorSystem {
  static const int Auto = 1;
  static const int Dark = 2;
  static const int Light = 3;

  static String getColorSystemName(int type) {
    switch (type) {
      case Auto:
        return "System Interface";
      case Dark:
        return "Dark Mode";
      case Light:
        return "Light Mode";
      default:
        return "System Interface";
    }
  }
}
