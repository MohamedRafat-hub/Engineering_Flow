import 'package:flutter/material.dart';

import 'live_portal_indicator.dart';
import 'organization_badge_chip.dart';

class WelcomeBadgesRow extends StatelessWidget {
  const WelcomeBadgesRow({
    super.key,
    required this.organizationName,
  });

  final String organizationName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          OrganizationBadgeChip(
            organizationName: organizationName,
          ),
          const SizedBox(width: 8),
          const LivePortalIndicator(),
        ],
      ),
    );
  }
}