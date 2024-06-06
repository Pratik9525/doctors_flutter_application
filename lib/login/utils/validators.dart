// validators.dart
// lib/utils/validators.dart

class Validators {
  static String? validateEmail(String? value) {
    const emailPattern = r'^[a-z0-9._]+@[a-z]+\.[a-z]{2,3}$';
    final regExp = RegExp(emailPattern);

    if (value == null || value.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    const passwordPattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    final regExp = RegExp(passwordPattern);

    if (value == null || value.isEmpty) {
      return 'Password can\'t be empty';
    } else if (!regExp.hasMatch(value)) {
      return 'Password must be at least 8 characters long, include an uppercase letter, lowercase letter, digit, and special character';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm Password can\'t be empty';
    } else if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}
