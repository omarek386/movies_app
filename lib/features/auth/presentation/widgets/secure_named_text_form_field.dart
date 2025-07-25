import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/extensions/sizedbox_extensions.dart';
import 'package:weather_app/features/auth/presentation/validators/password_validator.dart';

class SecureNamedTextFormField extends StatefulWidget {
  const SecureNamedTextFormField({
    super.key,
    required TextEditingController passwordController,
    String passwordLabel = 'Password',
    String? Function(String?) validator = passwordValidator,
  })  : _passwordController = passwordController,
        _passwordLabel = passwordLabel,
        _validator = validator;

  final TextEditingController _passwordController;
  final String _passwordLabel;
  final String? Function(String?) _validator;

  @override
  State<SecureNamedTextFormField> createState() =>
      _SecureNamedTextFormFieldState();
}

class _SecureNamedTextFormFieldState extends State<SecureNamedTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget._passwordLabel,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
        ),
        verticalSpace(8),
        TextFormField(
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
          obscureText: _obscureText,
          style: const TextStyle(color: Colors.white),
          keyboardType: TextInputType.visiblePassword,
          controller: widget._passwordController,
          validator: widget._validator,
        ),
      ],
    );
  }
}
