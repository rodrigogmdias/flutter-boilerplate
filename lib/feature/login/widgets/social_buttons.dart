import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/custom_buttons.dart';
import '../cubit/login_cubit.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Or"),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomButton(
                icon: Icons.g_mobiledata,
                label: "GOOGLE",
                onPressed: () {
                  context.read<LoginCubit>().loginWithGoogle();
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomButton(
                icon: Icons.apple,
                label: "APPLE",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
