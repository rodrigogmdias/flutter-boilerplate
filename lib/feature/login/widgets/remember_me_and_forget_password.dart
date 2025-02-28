import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RememberMeAndForgotPassword extends StatelessWidget {
  const RememberMeAndForgotPassword({
    super.key,
    required this.rememberChecked,
    required this.onChanged,
  });

  final bool rememberChecked;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberChecked,
              onChanged: onChanged,
            ),
            const Text("Remember me"),
          ],
        ),
        GestureDetector(
          onTap: () => context.push("/forget-password"),
          child: Text(
            "Forgot password?",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
