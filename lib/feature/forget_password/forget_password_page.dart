import 'package:boilerplate/feature/forget_password/cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import AppLocalizations

import '../../shared/components/custom_buttons.dart';
import '../../shared/components/custom_text_field.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        buildWhen: (previous, current) {
          if (current is ForgetPasswordSuccess) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  AppLocalizations.of(context)!.resetPasswordEmailSent,
                ), // Use AppLocalizations
              ),
            );
            return false;
          }
          if (current is ForgetPasswordFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(current.error),
              ),
            );
            return false;
          }

          return true;
        },
        builder: (context, state) {
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
                      hintText: AppLocalizations.of(context)!
                          .email, // Use AppLocalizations
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      label: AppLocalizations.of(context)!
                          .resetPassword, // Use AppLocalizations
                      onPressed: () {
                        context.read<ForgetPasswordCubit>().resetPassword(
                              emailController.text,
                            );
                      },
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
        },
      ),
    );
  }
}
