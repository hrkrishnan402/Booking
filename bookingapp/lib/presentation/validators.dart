class AppValidators {
  static String? emailValidator(String? email) {
    if ((email ?? "").isEmpty) {
      return 'Please enter a text';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? phoneNumberValidator(String? phoneNumber) {
    if ((phoneNumber ?? "").isEmpty) {
      return 'Please enter a text';
    }
    if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(phoneNumber!)) {
      return 'Please enter a valid phonenumber';
    }
    return null;
  }

  static String? nameValidator(String? name) {
    if ((name ?? "").isEmpty) {
      return 'Please enter a text';
    }
    return null;
  }

  static String? passwordValidator(String password) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (password.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(password)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  static String? confirmPasswordValidator(String? confirmPassword) {
    if ((confirmPassword ?? "").isEmpty) {
      return 'Please enter a text';
    }
    return null;
  }
}
