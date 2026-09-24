import 'package:engineering_flow/features/auth/presentation/views/widgets/account_disabled_view_body.dart';
import 'package:flutter/material.dart';


class AccountDisabledView extends StatelessWidget {
  const AccountDisabledView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: AccountDisabledViewBody()),
    );
  }
}