import 'app_regexs.dart';

class AppValidations {
  static String email({
    required String email,
    bool isCheckField = true,
  }) {
    if (isCheckField) {
      if (email.isEmpty) {
        return "Email field is required";
      }
    }
    if (email.isNotEmpty) {
      if (!email.contains("@")) {
        return "Email must have an @ character";
      } else if (!AppRegexs.email(email)) {
        return "Enter a valid email address";
      }
    }
    return "";
  }

  static String password({
    required String password,
    bool isCheckField = true,
  }) {
    if (isCheckField) {
      if (password.isEmpty) {
        return "Password field is required";
      }
    }
    if (password.isNotEmpty) {
      if (!AppRegexs.password(password)) {
        return "Password must be at least 6 characters long";
      }
    }
    return "";
  }

  static String confirmPassword(
    String confirmPwd,
    String password,
    bool isCheckField,
  ) {
    if (isCheckField) {
      if (confirmPwd.isEmpty) {
        return "Confirm password field is required";
      }
    }
    if (confirmPwd.isNotEmpty) {
      if (!AppRegexs.password(confirmPwd)) {
        return "Password must be at least 6 characters long";
      }
    }
    if (confirmPwd != password) {
      return "Confirm password does not match password";
    }
    return "";
  }

  static String name(String name, bool isCheckField) {
    if (isCheckField) {
      if (name.isEmpty) {
        return "Your name field is required";
      }
    }
    if (name.isNotEmpty) {
      if (name.contains("@")) {
        return "Your name cannot contain the @ symbol.";
      } else if (name.contains("#")) {
        return "Your name cannot contain the # symbol.";
      } else if (!AppRegexs.name(name)) {
        return "Enter a valid your name";
      }
    }
    return "";
  }
}
