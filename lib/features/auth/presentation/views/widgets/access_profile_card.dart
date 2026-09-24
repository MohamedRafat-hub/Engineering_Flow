import 'package:engineering_flow/features/auth/presentation/views/widgets/suspention_info_box.dart';
import 'package:flutter/material.dart';

import 'access_profile_header.dart';
import 'auth_card.dart';
import 'profile_info_field.dart';

class AccessProfileCard extends StatelessWidget {
  const AccessProfileCard({
    super.key,
    required this.organization,
    required this.reason,
  });

  final String organization;
  final String reason;

  @override
  Widget build(BuildContext context) {
    return AuthCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AccessProfileHeader(),
          const SizedBox(height: 16),
          ProfileInfoField(label: 'Organization', value: organization),
          const SizedBox(height: 12),
          ProfileInfoField(label: 'Reason', value: reason),
          const SizedBox(height: 16),
          const SuspensionInfoBox(),
        ],
      ),
    );
  }
}