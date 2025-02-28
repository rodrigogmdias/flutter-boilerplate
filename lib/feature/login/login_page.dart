import 'package:boilerplate/feature/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../shared/components/custom_buttons.dart';
import '../../shared/components/custom_text_field.dart';
import 'widgets/remember_me_and_forget_password.dart';
import 'widgets/sign_up_text.dart';
import 'widgets/social_buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "My App",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 30),
                    const CustomTextField(
                      hintText: "Email",
                      icon: Icons.email,
                    ),
                    const SizedBox(height: 20),
                    const CustomTextField(
                      hintText: "Password",
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
                      label: "LOGIN",
                      onPressed: () => context.go("/home"),
                    ),
                    const SizedBox(height: 20),
                    const SocialLoginButtons(),
                    const SizedBox(height: 20),
                    const SignUpText(),
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
