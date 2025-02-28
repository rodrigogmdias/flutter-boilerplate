import 'package:flutter/material.dart';

import '../../../shared/components/custom_buttons.dart';

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
                onPressed: () {},
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
