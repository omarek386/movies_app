import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/extensions/sizedbox_extensions.dart';
import 'package:movies_app/features/auth/presentation/validators/email_validator.dart';

class NamedTextFormField extends StatelessWidget {
  const NamedTextFormField({
    super.key,
    required TextEditingController emailController,
    String label = 'Email',
    String? Function(String?)? validator = emailValidator,
    TextInputType keyboardType = TextInputType.emailAddress,
  })  : _emailController = emailController,
        _validator = validator,
        _emailLabel = label,
        _keyboardType = keyboardType;

  final TextEditingController _emailController;
  final String? Function(String?)? _validator;
  final String _emailLabel;
  final TextInputType _keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            _emailLabel,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
        ),
        verticalSpace(8),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          keyboardType: _keyboardType,
          controller: _emailController,
          validator: _validator,
        ),
      ],
    );
  }
}
