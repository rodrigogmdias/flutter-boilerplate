import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import AppLocalizations

import '../../shared/components/custom_buttons.dart';
import '../../shared/components/custom_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context)!.signUp), // Use AppLocalizations
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
                    .createNewAccount, // Use AppLocalizations
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: fullNameController,
                hintText: AppLocalizations.of(context)!
                    .fullName, // Use AppLocalizations
                icon: Icons.person,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: emailController,
                hintText:
                    AppLocalizations.of(context)!.email, // Use AppLocalizations
                icon: Icons.email,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: passwordController,
                hintText: AppLocalizations.of(context)!
                    .password, // Use AppLocalizations
                icon: Icons.lock,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              CustomButton(
                label: AppLocalizations.of(context)!
                    .signUp, // Use AppLocalizations
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppLocalizations.of(context)!
                    .alreadyHaveAccount), // Use AppLocalizations
              ),
            ],
          ),
        ),
      ),
    );
  }
}
