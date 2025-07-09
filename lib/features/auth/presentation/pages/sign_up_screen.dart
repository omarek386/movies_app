import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movies_app/core/extensions/navigation_extensions.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/widgets/named_text_form_field.dart';
import 'package:movies_app/features/auth/presentation/widgets/secure_named_text_form_field.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

import '../../../../core/extensions/sizedbox_extensions.dart';
import '../../../../core/routing/routes.dart';
import '../cubit/auth_state.dart';
import '../widgets/auth_title_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthRegisterSuccess) {
            StylishDialog(
              context: context,
              alertType: StylishDialogType.INFO,
              title: const Text('Success'),
              content: const Text(
                  'Registration successful! Please Verify your email before logging in.'),
            ).show();
            Future.delayed(const Duration(seconds: 2), () {
              // ignore: use_build_context_synchronously
              context.pushNamed(Routes.loginScreen);
            });
          } else if (state is AuthFailure) {
            StylishDialog(
              context: context,
              alertType: StylishDialogType.ERROR,
              title: const Text('Error'),
              content: Text(state.error),
            ).show();
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AuthLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      verticalSpace(100),
                      const AuthTitleWidget(
                        title: 'SIGN UP',
                        subtitle: 'CREATE AN ACCOUNT TO MAKE SDFSDF',
                      ),
                      verticalSpace(50),
                      NamedTextFormField(
                        emailController: _usernameController,
                        label: 'Username',
                        keyboardType: TextInputType.text,
                        validator: nameValidator,
                      ),
                      verticalSpace(8),
                      NamedTextFormField(
                        emailController: _emailController,
                      ),
                      verticalSpace(20),
                      SecureNamedTextFormField(
                          passwordController: _passwordController),
                      verticalSpace(50),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.read<AuthCubit>().register(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                  _usernameController.text.trim(),
                                );
                          }
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      verticalSpace(20),
                      TextButton(
                        onPressed: () {
                          context.pushNamed(Routes.loginScreen);
                        },
                        child: Text(
                          "ALREADY HAVE AN ACCOUNT?",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String? nameValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }
}
