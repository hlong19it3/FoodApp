class AppRegexs {
  static bool email(String? email) {
    return email != null
        ? RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email)
        : false;
  }

  static bool password(String? pwd) {
    return pwd != null ? pwd.length >= 6 : false;
  }

  static bool name(String? name) {
    return name != null ? name.length >= 3 : false;
  }

  static bool phone(String? phone) {
    return phone != null ? RegExp(r"^[0-9]{10}").hasMatch(phone) : false;
  }
}
