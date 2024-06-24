import 'package:blog_app/constants/app_colors.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_up/bloc/sign_up_bloc.dart';
import 'package:blog_app/utils/app_gradient_button.dart';
import 'package:blog_app/utils/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/sign-up';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: BlocConsumer<SignUpBloc, SignUpState>(
            listener: (context, state) {
              if (state is SignUpFailure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              if (state is SignUpLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      AppTextField(
                          hintString: 'Name', controller: _nameController),
                      const SizedBox(height: 15),
                      AppTextField(
                          hintString: 'Email', controller: _emailController),
                      const SizedBox(height: 15),
                      AppTextField(
                        hintString: 'Password',
                        controller: _passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      AppGradientButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<SignUpBloc>()
                                .add(SignUpUserWithEmailAndPassword(
                                  name: _nameController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text,
                                ));
                          }
                        },
                        label: 'Sign Up',
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () => context
                            .read<SignUpBloc>()
                            .add(NavigateToSignInPage()),
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: 'Already have an account? ',
                              style: Theme.of(context).textTheme.titleMedium),
                          TextSpan(
                              text: 'Sign In',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppColors.gradient2,
                                      fontWeight: FontWeight.bold))
                        ])),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
