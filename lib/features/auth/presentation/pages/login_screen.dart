import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movies_app/core/extensions/navigation_extensions.dart';
import 'package:movies_app/core/extensions/sizedbox_extensions.dart';
import 'package:movies_app/features/auth/presentation/widgets/auth_title_widget.dart';
import 'package:movies_app/features/auth/presentation/widgets/named_text_form_field.dart';
import 'package:movies_app/features/auth/presentation/widgets/secure_named_text_form_field.dart';

import '../../../../core/routing/routes.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
          if (state is AuthSignInSuccess) {
            context.pushReplacementNamed(Routes.homeScreen);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AuthLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      verticalSpace(100),
                      const AuthTitleWidget(
                        title: 'LOGIN',
                        subtitle: 'CREATE AN ACCOUNT TO MAKE SDFSDF',
                      ),
                      verticalSpace(100),
                      NamedTextFormField(emailController: _emailController),
                      verticalSpace(20),
                      SecureNamedTextFormField(
                        passwordController: _passwordController,
                      ),
                      verticalSpace(12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget your password?',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(30),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.read<AuthCubit>().logIn(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(300.w, 50.h),
                          backgroundColor: const Color(0xFF0D47A1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                        ),
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
                          context.pushNamed(Routes.signupScreen);
                        },
                        child: Text(
                          "DON'T HAVE AN ACCOUNT?",
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
}
