import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/asset_constants.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/icon_chip.dart';
import '../../../../../core/widgets/info_notice_card.dart';

class RoleGovernanceNotice extends StatelessWidget {
  const RoleGovernanceNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return InfoNoticeCard(
      backgroundColor: AppColors.primary,
      bordered: false,
      leading: IconChip(
        icon: SvgPicture.asset(AppAssets.roleIcon, width: 18, height: 18),
        backgroundColor: AppColors.primaryDeep,
        shape: BoxShape.rectangle,
        radius: 12,
        size: 44,
      ),
      title: 'Role Governance Active',
      titleStyle: AppTextStyles.pill(color: Colors.white, weight: FontWeight.w700, size: 14),
      messageStyle: AppTextStyles.pill(color: Colors.white70, size: 12.5, height: 1.5),
      message: const TextSpan(
        text: 'Role provisioning and user access active. All 31 active '
            'users authenticated under enterprise security policy.',
      ),
    );
  }
}