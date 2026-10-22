import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/detail_field.dart';
import '../../../../../core/widgets/section_card_header.dart';
import '../../../../../core/widgets/square_icon_button.dart';

class ContactInformationCard extends StatelessWidget {
  const ContactInformationCard({
    super.key,
    required this.workEmail,
    required this.mobilePhone,
  });

  final String workEmail;
  final String mobilePhone;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionCardHeader(
            icon: Icons.contact_page_outlined,
            title: 'Contact Information',
          ),
          const SizedBox(height: 18),
          DetailField(
            label: 'Work Email',
            value: workEmail,
            uppercaseLabel: false,
            labelStyle: AppTextStyles.subtitle,
          ),
          const Divider(height: 28, color: AppColors.noticeBorder),
          DetailField(
            label: 'Mobile Phone',
            value: mobilePhone,
            uppercaseLabel: false,
            labelStyle: AppTextStyles.subtitle,

          ),
        ],
      ),
    );
  }
}
