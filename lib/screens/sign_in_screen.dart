import 'package:flutter/material.dart';
import 'package:loyalty_app/themes/app_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Sign In Screen',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: AppColors.deepNavy),
      ),
    );
  }
}
