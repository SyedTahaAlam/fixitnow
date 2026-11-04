import 'package:flutter/material.dart';

import 'banner.dart';
import 'category.dart';
import 'product.dart';

enum VerticalId {
  intlShopping,
  delivery,
  quickMart,
  food,
  pharmacy,
  services,
  buySell,
  professional,
  carRental,
  rides,
  logistics,
  realEstate,
  stays,
  auctions,
  jobs,
  travel,
  investment,
  subscriptions,
  education,
}

enum SectionLayout { grid, horizontal, tiles, markets }

class HomeSection {
  const HomeSection(
    this.title,
    this.items, {
    this.layout = SectionLayout.horizontal,
  });
  final String title;
  final List<Product> items;
  final SectionLayout layout;
}

class Vertical {
  const Vertical({
    required this.id,
    required this.title,
    required this.icon,
    required this.hero,
    required this.categories,
    required this.sections,
    required this.promos,
    this.searchHint = 'What are you looking for?',
    this.headerColor = const Color(0xFF071C35),
    this.tabs = const [],
    this.trust = const [
      'Verified partners',
      'Secure experience',
      '24/7 support',
    ],
    this.searchFirst = true,
    this.promoAfter = 0,
  });
  final VerticalId id;
  final String title, searchHint;
  final IconData icon;
  final BannerData hero;
  final List<Category> categories;
  final List<HomeSection> sections;
  final List<BannerData> promos;
  final Color headerColor;
  final List<String> tabs, trust;
  final bool searchFirst;
  final int promoAfter;
}
