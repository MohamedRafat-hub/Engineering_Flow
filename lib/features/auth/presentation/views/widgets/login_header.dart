import 'package:engineering_flow/core/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'auth_header.dart';

import 'brand_bage.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  AuthHeader(
      leading: Column(
        children: [
          SvgPicture.asset(AppAssets.appLogo, height: 40, width: 40),
          SizedBox(height: 16),
          BrandBadge(label: 'ENGINEERINGFLOW'),
        ],
      ),
      title: 'Welcome back',
      subtitle: 'Sign in to continue to EngineeringFlow',
    );
  }
}