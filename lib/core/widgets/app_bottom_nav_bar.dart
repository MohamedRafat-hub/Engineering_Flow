import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/asset_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppNavItem {
  const AppNavItem({required this.icon, required this.label});

  final String icon;
  final String label;
}

/// Bottom navigation bar shared by every top-level screen (Dashboard,
/// Users, Projects, Profile). Icons are tinted at runtime via a color
/// filter, so a single SVG per item covers both the active and the
/// inactive state.
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    this.onTap,
    this.items = defaultItems,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;
  final List<AppNavItem> items;

  static const List<AppNavItem> defaultItems = [
    AppNavItem(icon: AppAssets.dashboardNavIcon, label: 'Dashboard'),
    AppNavItem(icon: AppAssets.usersNavIcon, label: 'Users'),
    AppNavItem(icon: AppAssets.projectsNavIcon, label: 'Projects'),
    AppNavItem(icon: AppAssets.profileNavIcon, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.noticeBorder)),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 60,
          child: Row(
            children: List.generate(items.length, (index) {
              final bool active = index == currentIndex;
              return Expanded(
                child: _NavItemButton(
                  item: items[index],
                  active: active,
                  onTap: () => onTap?.call(index), // TODO(logic): switch tab
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItemButton extends StatelessWidget {
  const _NavItemButton({
    required this.item,
    required this.active,
    required this.onTap,
  });

  final AppNavItem item;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color tint = active ? AppColors.primary : AppColors.textSecondary;

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            item.icon,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(tint, BlendMode.srcIn),
          ),
          const SizedBox(height: 4),
          Text(item.label, style: AppTextStyles.navLabel(active: active)),
        ],
      ),
    );
  }
}