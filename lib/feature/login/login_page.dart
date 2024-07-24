import 'package:boilerplate/feature/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Login Page'),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => context.push('/home'),
                    child: const Text('Go to Home Page'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
