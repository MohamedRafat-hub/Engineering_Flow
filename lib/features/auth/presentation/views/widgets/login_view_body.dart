import 'package:flutter/material.dart';

import '../../../../../core/widgets/scrollable_centered_body.dart';
import 'coorporate_notice_card.dart';
import 'login_form_card.dart';
import 'login_header.dart';
class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollableCenteredBody(
      children: [
        LoginHeader(),
        SizedBox(height: 24),
        LoginFormCard(),
        SizedBox(height: 20),
        CorporateNoticeCard(),
      ],
    );
  }
}