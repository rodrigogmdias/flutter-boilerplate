import 'package:boilerplate/shared/components/custom_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
            Text(AppLocalizations.of(context)!.helloWorld),
            const SizedBox(height: 20),
            CustomButton(
              label: "Logout",
              onPressed: () {
                FirebaseAuth.instance.signOut();
                context.go('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
