
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/scrollable_centered_body.dart';

class UserDetailsShimmer extends StatelessWidget {
  const UserDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = AppColors.surface;
    final highlightColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade700
        : Colors.grey.shade300;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: ScrollableCenteredBody(
        children: [
          const SizedBox(height: 12),

          // Avatar
          const Center(
            child: _ShimmerBox(
              width: 70,
              height: 70,
              radius: 35,
            ),
          ),
          const SizedBox(height: 16),

          // Name
          const Center(
            child: _ShimmerBox(
              width: 180,
              height: 22,
              radius: 6,
            ),
          ),
          const SizedBox(height: 8),

          // Job title
          const Center(
            child: _ShimmerBox(
              width: 130,
              height: 16,
              radius: 5,
            ),
          ),
          const SizedBox(height: 14),

          // Role and account status
          const Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _ShimmerBox(width: 85, height: 28, radius: 14),
                SizedBox(width: 8),
                _ShimmerBox(width: 75, height: 28, radius: 14),
              ],
            ),
          ),
          const SizedBox(height: 28),

          // Contact information card
          const _ShimmerCard(
            children: [
              _ShimmerBox(width: 175, height: 18, radius: 5),
              SizedBox(height: 24),
              _ShimmerBox(width: 85, height: 13, radius: 4),
              SizedBox(height: 8),
              _ShimmerBox(width: 220, height: 16, radius: 4),
              SizedBox(height: 24),
              _ShimmerBox(width: 95, height: 13, radius: 4),
              SizedBox(height: 8),
              _ShimmerBox(width: 150, height: 16, radius: 4),
            ],
          ),
          const SizedBox(height: 16),

          // System account card
          const _ShimmerCard(
            children: [
              _ShimmerBox(width: 160, height: 18, radius: 5),
              SizedBox(height: 24),
              _ShimmerBox(width: 100, height: 13, radius: 4),
              SizedBox(height: 8),
              _ShimmerBox(width: 100, height: 22, radius: 6),
              SizedBox(height: 22),
              _ShimmerBox(width: 90, height: 13, radius: 4),
              SizedBox(height: 8),
              _ShimmerBox(width: 135, height: 16, radius: 4),
              SizedBox(height: 22),
              _ShimmerBox(width: 85, height: 13, radius: 4),
              SizedBox(height: 8),
              _ShimmerBox(width: 115, height: 16, radius: 4),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _ShimmerCard extends StatelessWidget {
  const _ShimmerCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.noticeBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  const _ShimmerBox({
    required this.width,
    required this.height,
    this.radius = 8,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
