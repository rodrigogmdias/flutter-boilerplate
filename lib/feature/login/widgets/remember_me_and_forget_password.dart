import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final localizations = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberChecked,
              onChanged: onChanged,
            ),
            Text(localizations.rememberMe),
          ],
        ),
        GestureDetector(
          onTap: () => context.push("/forget-password"),
          child: Text(
            localizations.forgotPassword,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
