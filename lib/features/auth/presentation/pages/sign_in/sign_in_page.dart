import 'package:blog_app/constants/app_colors.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:blog_app/utils/app_gradient_button.dart';
import 'package:blog_app/utils/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  static const routeName = '/sign-in';
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign In.',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            AppTextField(hintString: 'Email', controller: _emailController),
            const SizedBox(height: 15),
            AppTextField(
              hintString: 'Password',
              controller: _passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 20),
             AppGradientButton(
              onPressed: () {},
              label: 'Sign In',
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () =>
                  context.read<SignInBloc>().add(NavigateToSignUpPage()),
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Dont have an account? ',
                    style: Theme.of(context).textTheme.titleMedium),
                TextSpan(
                    text: 'Sign Up',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.gradient2,
                        fontWeight: FontWeight.bold))
              ])),
            )
          ],
        ),
      ),
    ));
  }
}
