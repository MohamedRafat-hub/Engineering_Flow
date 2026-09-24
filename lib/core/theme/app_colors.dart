import 'package:flutter/material.dart';

abstract final class AppColors {
  // Brand
  static const Color primary = Color(0xFF1E3A8A);
  static const Color onPrimary = Colors.white;
  static const Color link = Color(0xFF2545B5);
  static const Color secondary = Color(0xFF4F6BED);

  // Surfaces
  static const Color background = Color(0xFFF5F5FD);
  static const Color surface = Colors.white;
  static const Color inputFill = Color(0xFFEDEDFA);
  static const Color badgeBackground = Color(0xFFE2E6FA);
  static const Color noticeBackground = Color(0xFFEBECFB);
  static const Color noticeBorder = Color(0xFFD8DAF3);
  static const Color glow = Color(0x2E2545B5);

  // Text
  static const Color textPrimary = Color(0xFF141B4D);
  static const Color textSecondary = Color(0xFF5C6285);
  static const Color textHint = Color(0xFF8B90A8);

  // Feedback
  static const Color required = Color(0xFFD32F2F);
}