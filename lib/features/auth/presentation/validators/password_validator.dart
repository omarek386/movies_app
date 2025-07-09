import '../../../../core/utils/app_utils.dart';

String? passwordValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (!AppUtils.hasLowerCase(value)) {
    return 'Password must contain at least one lowercase letter';
  }
  if (!AppUtils.hasUpperCase(value)) {
    return 'Password must contain at least one uppercase letter';
  }
  if (!AppUtils.hasNumber(value)) {
    return 'Password must contain at least one number';
  }
  if (!AppUtils.hasMinLength(value)) {
    return 'Password must be at least 8 characters long';
  }
  return null;
}
