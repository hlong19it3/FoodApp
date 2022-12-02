import 'app_regexs.dart';

class AppValidations {
  static String? email({
    String? email,
    bool isCheckField = true,
  }) {
    if (email != null && email.isNotEmpty) {
      if (!email.contains("@")) {
        return "Email must have an @ character";
      } else if (!AppRegexs.email(email)) {
        return "Enter a valid email address";
      }
    } else if (isCheckField) {
      return "Email field is required";
    }

    return null;
  }

  static String? password({
    String? password,
    bool isCheckField = true,
  }) {
    if (password != null) {
      if (password.isNotEmpty) {
        if (!AppRegexs.password(password)) {
          return "Password must be at least 6 characters long";
        }
      }
    } else {
      if (isCheckField) {
        if (password == null || password.isEmpty) {
          return "Password field is required";
        }
      }
    }

    return null;
  }

  static String? confirmPassword({
    String? confirmPwd,
    String? password,
    required bool isCheckField,
  }) {
    if (confirmPwd != null) {
      if (confirmPwd.isNotEmpty) {
        if (confirmPwd != password) {
          return "Password and confirm password must be the same";
        }
      }
    } else if (isCheckField) {
      if (confirmPwd == null || confirmPwd.isEmpty) {
        return "Confirm password field is required";
      }
    }
    return null;
  }

  static String? name({
    String? name,
    bool isCheckField = true,
  }) {
    if (name != null) {
      if (name.isNotEmpty) {
        if (!AppRegexs.name(name)) {
          return "Enter a valid name";
        }
      }
    } else if (isCheckField) {
      if (name == null || name.isEmpty) {
        return "Name field is required";
      }
    }

    return null;
  }

  static String? phone({
    String? phone,
    bool isCheckField = true,
  }) {
    if (phone != null) {
      if (phone.isNotEmpty) {
        if (!AppRegexs.phone(phone)) {
          return "Enter a valid phone number";
        }
      }
    } else if (isCheckField) {
      if (phone == null || phone.isEmpty) {
        return "Phone field is required";
      }
    }

    return null;
  }
}
