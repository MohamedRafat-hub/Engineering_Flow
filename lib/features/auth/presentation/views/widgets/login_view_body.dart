import 'package:flutter/material.dart';

import 'coorporate_notice_card.dart';
import 'login_form_card.dart';
import 'login_header.dart';



class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoginHeader(),
              SizedBox(height: 24),
              LoginFormCard(),
              SizedBox(height: 20),
              CorporateNoticeCard(),
            ],
          ),
        ),
      ),
    );
  }
}