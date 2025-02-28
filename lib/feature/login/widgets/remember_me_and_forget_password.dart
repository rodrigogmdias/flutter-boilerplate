import 'package:flutter/material.dart';

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
        Text(
          "Forgot password?",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
