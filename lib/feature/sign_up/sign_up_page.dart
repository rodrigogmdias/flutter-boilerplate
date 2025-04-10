import 'package:boilerplate/feature/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Import AppLocalizations

import '../../shared/components/custom_buttons.dart';
import '../../shared/components/custom_loading.dart';
import '../../shared/components/custom_text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController(); // Novo controlador

    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listenWhen: (previous, current) {
          return current is SignUpSuccess || current is SignUpFailed;
        },
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)!.signUpSuccess),
              ),
            );
          }
          if (state is SignUpFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          return CustomLoading(
            isLoading: state is SignUpLoading,
            child: Scaffold(
              appBar: AppBar(
                title: Text(AppLocalizations.of(context)!.signUp),
              ),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.createNewAccount,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: fullNameController,
                        hintText: AppLocalizations.of(context)!.fullName,
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: emailController,
                        hintText: AppLocalizations.of(context)!.email,
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: passwordController,
                        hintText: AppLocalizations.of(context)!.password,
                        icon: Icons.lock,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: confirmPasswordController, // Novo campo
                        hintText: AppLocalizations.of(context)!
                            .confirmPassword, // Novo texto de dica
                        icon: Icons.lock,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        label: AppLocalizations.of(context)!.signUp,
                        onPressed: () {
                          if (passwordController.text !=
                              confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(AppLocalizations.of(context)!
                                    .passwordsDoNotMatch),
                              ),
                            );
                          } else {
                            context.read<SignUpCubit>().signUp(
                                  emailController.text,
                                  passwordController.text,
                                  fullNameController.text,
                                );
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                            AppLocalizations.of(context)!.alreadyHaveAccount),
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
