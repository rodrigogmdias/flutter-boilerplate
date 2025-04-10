import 'package:boilerplate/feature/forget_password/cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import AppLocalizations

import '../../shared/components/custom_buttons.dart';
import '../../shared/components/custom_loading.dart';
import '../../shared/components/custom_text_field.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listenWhen: (previous, current) {
          return current is ForgetPasswordSuccess || current is ForgetPasswordFailed;
        },
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  AppLocalizations.of(context)!.resetPasswordEmailSent,
                ),
              ),
            );
          }
          if (state is ForgetPasswordFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          return CustomLoading(
            isLoading: state is ForgetPasswordLoading,
            child: Scaffold(
              appBar: AppBar(
                title: Text(AppLocalizations.of(context)!.forgotPassword),
              ),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.enterEmailToResetPassword,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: emailController,
                        hintText: AppLocalizations.of(context)!.email,
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        label: AppLocalizations.of(context)!.resetPassword,
                        onPressed: () {
                          context.read<ForgetPasswordCubit>().resetPassword(
                                emailController.text,
                              );
                        },
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(AppLocalizations.of(context)!.backToLogin),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
