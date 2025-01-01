// Email and Phone number validation
bool isEmail(String input) {
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return emailRegex.hasMatch(input);
}

bool isPhoneNumber(String input) {
  final phoneRegex = RegExp(r"^(?:[+0]9)?[0-9]{10,12}$");
  return phoneRegex.hasMatch(input);
}

String? validateEmailOrPhone(String? input) {
  if (input!.isEmpty) {
    return 'Field cannot be empty';
  } else if (!isEmail(input) && !isPhoneNumber(input)) {
    return 'Enter a valid email or phone number';
  }
  return null;
}

// Password validation
String? validatePassword(String? password) {
  if (password!.isEmpty) {
    return 'Password cannot be empty';
  } else if (password.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  return null;
}

// Confirm Password validation
String? validateConfirmPassword(String password, String confirmPassword) {
  if (confirmPassword.isEmpty) {
    return 'Confirm Password cannot be empty';
  } else if (password != confirmPassword) {
    return 'Passwords do not match';
  }
  return null;
}

// Username validation
String? validateUsername(String? username) {
  if (username!.isEmpty) {
    return 'Username cannot be empty';
  } else if (username.length < 3) {
    return 'Username must be at least 3 characters long';
  } else if (username.length > 20) {
    return 'Username must be less than 20 characters long';
  }
  return null;
}

// Hide email
String obfuscateEmail(String email) {
  final emailParts = email.split('@');

  if (emailParts.length != 2) {
    throw ArgumentError('Invalid email format');
  }

  final localPart = emailParts[0];
  final domainPart = emailParts[1];
  final obfuscatedLocalPart = localPart.length <= 3
      ? localPart.padRight(4, '*')
      : '${localPart.substring(0, 3)}****';

  return '$obfuscatedLocalPart@$domainPart';
}

// Hide mobile number
String obfuscatePhoneNumber(String phoneNumber) {
  if (phoneNumber.length != 10) {
    throw ArgumentError('Phone number must be 10 digits');
  }

  final start = phoneNumber.substring(0, 3);
  final end = phoneNumber.substring(7, 10);

  return '$start****$end';
}
