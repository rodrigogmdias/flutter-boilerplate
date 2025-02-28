import 'package:boilerplate/shared/components/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('Welcome to Home Page'),
            const SizedBox(height: 20),
            CustomButton(
              label: "Logout",
              onPressed: () => context.go('/'),
            ),
          ],
        ),
      ),
    );
  }
}
