import '../../../../core/utils/app_utils.dart';

String? emailValidator(value) =>
    AppUtils.isEmailValid(value ?? '') ? null : 'Please enter a valid email';
