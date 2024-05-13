import 'package:blog_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradientButton extends StatelessWidget {
  const AppGradientButton({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            AppColors.gradient1,
            AppColors.gradient2,
          ], begin: Alignment.bottomLeft, end: Alignment.topRight),
          borderRadius: BorderRadius.circular(7)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(395, 55),
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent),
          onPressed: () {},
          child: Text(label,
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.w600))),
    );
  }
}
