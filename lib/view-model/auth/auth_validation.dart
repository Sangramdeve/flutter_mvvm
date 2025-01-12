import 'package:get/get.dart';

mixin AuthValidation on GetxController {
  final password = ''.obs;
  final passwordError = ''.obs;

  void validatePassword(String value) {
    password(value); // Update the password
    if (value.isEmpty) {
      passwordError('Password cannot be empty');
    } else if (value.length < 6) {
      passwordError('Password must be at least 6 characters long');
    } else {
      passwordError(''); // Clear error if valid
    }
  }
}
