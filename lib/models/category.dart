import 'package:flutter/material.dart';

class Category {
  const Category(this.title, this.icon, {this.color = const Color(0xFF008EA6)});
  final String title;
  final IconData icon;
  final Color color;
}
