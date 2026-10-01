import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/asset_constants.dart';
import '../theme/app_text_styles.dart';

/// App bar brand mark: logo + wordmark, shared by every screen's app bar.
///
/// Two shapes are needed across the app:
/// - [AppBarBrand.simple]: single-line "EngineeringFlow" (auth screens).
/// - [AppBarBrand.withEyebrow]: small caps eyebrow + bold title, e.g.
///   "ENGINEERINGFLOW" / "Dashboard".
class AppBarBrand extends StatelessWidget {
  const AppBarBrand.simple({super.key})
      : eyebrow = null,
        title = 'EngineeringFlow';

  const AppBarBrand.withEyebrow({
    super.key,
    required String eyebrow,
    required this.title,
  }) : eyebrow = eyebrow;

  final String? eyebrow;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(AppAssets.appLogo, width: 36, height: 36),
        const SizedBox(width: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (eyebrow != null) Text(eyebrow!, style: AppTextStyles.appBarEyebrow),
            Text(
              title,
              style: eyebrow != null
                  ? AppTextStyles.appBarHeading
                  : AppTextStyles.appBarTitle,
            ),
          ],
        ),
      ],
    );
  }
}