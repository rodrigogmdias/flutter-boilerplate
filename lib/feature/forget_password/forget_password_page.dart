import 'package:flutter/material.dart';

import '../../shared/components/custom_buttons.dart';
import '../../shared/components/custom_text_field.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Enter your email to reset your password",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: emailController,
                hintText: "Email",
                icon: Icons.email,
              ),
              const SizedBox(height: 20),
              CustomButton(label: "RESET PASSWORD", onPressed: () {}),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Back to Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
