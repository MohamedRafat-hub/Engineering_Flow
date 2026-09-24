import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SendResetLinkButton extends StatelessWidget {
  const SendResetLinkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.push('/reset_email_sent');
      }, // TODO(logic): send reset link
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Send Reset Link'),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward, size: 18),
        ],
      ),
    );
  }
}