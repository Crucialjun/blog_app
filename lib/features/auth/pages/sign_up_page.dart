import 'package:blog_app/constants/app_colors.dart';
import 'package:blog_app/utils/app_gradient_button.dart';
import 'package:blog_app/utils/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sign Up',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          const AppTextField(hintString: 'Name'),
          const SizedBox(height: 15),
          const AppTextField(hintString: 'Email'),
          const SizedBox(height: 15),
          const AppTextField(hintString: 'Password'),
          const SizedBox(height: 20),
          const AppGradientButton(),
          const SizedBox(height: 20),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: 'Already have an account? ',
                style: Theme.of(context).textTheme.titleMedium),
            TextSpan(
                text: 'Sign In',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.gradient2, fontWeight: FontWeight.bold))
          ]))
        ],
      ),
    ));
  }
}