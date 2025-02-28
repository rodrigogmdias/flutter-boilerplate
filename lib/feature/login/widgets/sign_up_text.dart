import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        AppLocalizations.of(context)!.signUpPrompt,
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
