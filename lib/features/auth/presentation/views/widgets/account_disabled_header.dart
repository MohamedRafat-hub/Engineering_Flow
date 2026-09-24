import 'package:flutter/material.dart';

import 'auth_header.dart';
import 'disabled_icon_bage.dart';

class AccountDisabledHeader extends StatelessWidget {
  const AccountDisabledHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthHeader(
      leading: DisabledIconBadge(),
      title: 'Account disabled',
      subtitle:
      'Your account has been disabled. Please contact your administrator.',
    );
  }
}