import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/sign-up');
      },
      child: Text(
        "Don't have an account? Sign Up",
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
