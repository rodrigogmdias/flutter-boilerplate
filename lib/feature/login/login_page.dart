import 'package:boilerplate/feature/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../shared/components/custom_buttons.dart';
import '../../shared/components/custom_loading.dart';
import '../../shared/components/custom_text_field.dart';
import 'widgets/remember_me_and_forget_password.dart';
import 'widgets/sign_up_text.dart';
import 'widgets/social_buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listenWhen: (previous, current) {
          return current is LoginError || current is LoginSuccess;
        },
        listener: (context, state) {
          if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          } else if (state is LoginSuccess) {
            context.go('/home');
          }
        },
        builder: (context, state) {
          return CustomLoading(
            isLoading: state is LoginLoading,
            child: Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.myApp,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 30),
                      CustomTextField(
                        controller: emailController,
                        hintText: AppLocalizations.of(context)!.email,
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: passwordController,
                        hintText: AppLocalizations.of(context)!.password,
                        icon: Icons.lock,
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      RememberMeAndForgotPassword(
                        rememberChecked: state.rememberChecked,
                        onChanged: (value) {
                          context.read<LoginCubit>().rememberMe(value ?? false);
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        label: AppLocalizations.of(context)!.login,
                        onPressed: () => context.read<LoginCubit>().login(
                              emailController.text,
                              passwordController.text,
                            ),
                      ),
                      const SizedBox(height: 20),
                      const SocialLoginButtons(),
                      const SizedBox(height: 20),
                      const SignUpText(),
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
