class AppConfig {
  static const APP_ID = '2db4d10abbba11449fd576aff1b824ae1';

  static bool isValidEmail(String emailId) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailId);
  }
}