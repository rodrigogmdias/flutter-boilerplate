import 'package:flutter/material.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        "Don't have an account? Sign Up",
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
