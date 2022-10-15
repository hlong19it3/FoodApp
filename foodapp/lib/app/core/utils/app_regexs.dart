class AppRegexs {
  static bool email(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool password(String pwd) {
    return pwd.length >= 6;
  }

  static bool name(String name) {
    return RegExp(r"^([a-zA-Zà-úÀ-Ú]{2,})+\s+([a-zA-Zà-úÀ-Ú\s]{2,})+$")
        .hasMatch(name);
  }
}
