import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_button.dart';

enum _BackToSignInVariant { link, filled, filledWithLoginIcon }

/// One "Back to Sign In" action reused on every auth screen.
class BackToSignInButton extends StatelessWidget {

  final void Function()? onPressed;
  const BackToSignInButton.link({super.key , required this.onPressed})
      : _variant = _BackToSignInVariant.link;

  const BackToSignInButton.filled({super.key , required this.onPressed})
      : _variant = _BackToSignInVariant.filled;

  const BackToSignInButton.filledWithLoginIcon({super.key, required this.onPressed})
      : _variant = _BackToSignInVariant.filledWithLoginIcon;

  final _BackToSignInVariant _variant;

  static const String _label = 'Back to Sign In';

  @override
  Widget build(BuildContext context) {
    // TODO(logic): navigate back to sign in (single place for all screens)

    return switch (_variant) {
      _BackToSignInVariant.link => AppTextButton(
        label: _label,
        leadingIcon: Icons.arrow_back,
        textStyle: AppTextStyles.backLink,
        onPressed: onPressed,
      ),
      _BackToSignInVariant.filled => AppButton(
        label: _label,
        leadingIcon: Icons.arrow_back,
        onPressed: onPressed,
      ),
      _BackToSignInVariant.filledWithLoginIcon => AppButton(
        label: _label,
        trailingIcon: Icons.login,
        onPressed: onPressed,
      ),
    };
  }
}