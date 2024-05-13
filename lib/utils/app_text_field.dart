import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, required this.hintString,required this.controller,this.obscureText=false});

  final String hintString;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hintString is required';
        }
        return null;
      
      },
      decoration: InputDecoration(
        hintText: hintString,
      ),
    );
  }
}
