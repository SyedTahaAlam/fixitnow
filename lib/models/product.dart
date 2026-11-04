import 'package:flutter/material.dart';

class Product {
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.icon,
    this.subtitle = 'Riyadh',
    this.description =
        'A carefully selected local mock listing on FixItNow. '
        'Explore the details and try the action below. This is an offline demo; '
        'no purchase, reservation, application or payment will be made.',
    this.badge,
    this.oldPrice,
    this.meta = '4.8 (320)',
    this.action = 'View Details',
    this.color = const Color(0xFF167DAB),
    this.addToCart = false,
    this.countdownSeconds,
  });

  final String id, title, price, subtitle, description, meta, action;
  final String? badge, oldPrice;
  final IconData icon;
  final Color color;
  final bool addToCart;
  final int? countdownSeconds;
}
