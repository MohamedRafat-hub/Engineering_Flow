import 'package:engineering_flow/core/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_text_styles.dart';
import 'brand_bage.dart';


class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SvgPicture.asset(AppAssets.appLogo ,  width: 64, height: 64,),
        SizedBox(height: 16),
        BrandBadge(label: 'ENGINEERINGFLOW'),
        SizedBox(height: 14),
        Text('Welcome back', style: AppTextStyles.headline),
        SizedBox(height: 6),
        Text(
          'Sign in to continue to EngineeringFlow',
          textAlign: TextAlign.center,
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
}