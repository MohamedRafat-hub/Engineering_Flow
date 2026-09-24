import 'package:flutter/material.dart';

import '../../../../../core/widgets/scrollable_centered_body.dart';
import 'access_profile_card.dart';
import 'account_disabled_action.dart';
import 'account_disabled_header.dart';
class AccountDisabledViewBody extends StatelessWidget {
  const AccountDisabledViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollableCenteredBody(
      children: [
        AccountDisabledHeader(),
        SizedBox(height: 24),
        AccessProfileCard(
          organization: 'Acme Engineering Corp',
          reason: 'Administrative hold or employment status update',
        ),
        SizedBox(height: 20),
        AccountDisabledActions(),
      ],
    );
  }
}