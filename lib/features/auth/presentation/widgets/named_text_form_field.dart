import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/extensions/sizedbox_extensions.dart';
import 'package:movies_app/features/auth/presentation/validators/email_validator.dart';

class NamedTextFormField extends StatelessWidget {
  const NamedTextFormField({
    super.key,
    required TextEditingController emailController,
    String emailLabel = 'Email',
    String? Function(String?)? validator = emailValidator,
  })  : _emailController = emailController,
        _validator = validator,
        _emailLabel = emailLabel;

  final TextEditingController _emailController;
  final String? Function(String?)? _validator;
  final String _emailLabel;

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
          keyboardType: TextInputType.emailAddress,
          controller: _emailController,
          validator: _validator,
        ),
      ],
    );
  }
}
