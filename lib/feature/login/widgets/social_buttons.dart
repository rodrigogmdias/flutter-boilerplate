import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import AppLocalizations

import '../../../shared/components/custom_buttons.dart';
import '../cubit/login_cubit.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations =
        AppLocalizations.of(context)!; // Get AppLocalizations instance

    return Column(
      children: [
        Text(localizations.or), // Use localized text
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomButton(
                icon: Icons.g_mobiledata,
                label: localizations.google, // Use localized text
                onPressed: () {
                  context.read<LoginCubit>().loginWithGoogle();
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomButton(
                icon: Icons.apple,
                label: localizations.apple, // Use localized text
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
