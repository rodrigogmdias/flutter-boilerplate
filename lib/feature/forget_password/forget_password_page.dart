import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import AppLocalizations

import '../../shared/components/custom_buttons.dart';
import '../../shared/components/custom_text_field.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!
            .forgotPassword), // Use AppLocalizations
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!
                    .enterEmailToResetPassword, // Use AppLocalizations
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: emailController,
                hintText:
                    AppLocalizations.of(context)!.email, // Use AppLocalizations
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              CustomButton(
                label: AppLocalizations.of(context)!
                    .resetPassword, // Use AppLocalizations
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context)!
                    .backToLogin), // Use AppLocalizations
              ),
            ],
          ),
        ),
      ),
    );
  }
}
