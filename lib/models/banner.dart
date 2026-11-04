import 'package:flutter/material.dart';

class BannerData {
  const BannerData({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.action = 'Explore Now',
    this.color = const Color(0xFF064562),
  });
  final String title, subtitle, action;
  final IconData icon;
  final Color color;
}
