import 'package:flutter/material.dart';

import '../../../../../core/widgets/info_notice_card.dart';

class CorporateNoticeCard extends StatelessWidget {
  const CorporateNoticeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const InfoNoticeCard(
      icon: Icons.verified_user_outlined,
      iconSize: 20,
      title: 'Internal Corporate System',
      message: TextSpan(
        text: 'Operator credentials are automatically managed by IT '
            'Systems. Need provisioning? Contact your administrator.',
      ),
    );
  }
}