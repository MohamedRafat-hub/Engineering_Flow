import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReturnToSignInButton extends StatelessWidget {
  const ReturnToSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.go('/login');
        }, // TODO(logic): navigate back to sign in
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Back to Sign In'),
            SizedBox(width: 8),
            Icon(Icons.login, size: 18),
          ],
        ),
      ),
    );
  }
}