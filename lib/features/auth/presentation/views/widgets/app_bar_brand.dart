import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/asset_constants.dart';
import '../../../../../core/theme/app_text_styles.dart';

class AppBarBrand extends StatelessWidget {
  const AppBarBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(AppAssets.appLogo, width: 36, height: 36),
        const SizedBox(width: 10),
        const Text('EngineeringFlow', style: AppTextStyles.appBarTitle),
      ],
    );
  }
}