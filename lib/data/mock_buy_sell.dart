import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const buySellData = Vertical(
  id: VerticalId.buySell,
  title: 'Buy & Sell',
  icon: Icons.sell,
  searchHint: 'Search pre-loved treasures near you',
  hero: BannerData(
    title: 'Great finds. A second life.',
    subtitle: 'Discover local listings and give useful things a new home.',
    icon: Icons.recycling,
    action: 'Browse Listings',
  ),
  categories: [
    Category('Electronics', Icons.devices),
    Category('Furniture', Icons.chair),
    Category('Vehicles', Icons.directions_car),
    Category('Fashion', Icons.checkroom),
    Category('Hobbies', Icons.sports_esports),
  ],
  sections: [
    HomeSection('Featured Listings', [
      Product(
        id: 'buysell-iphone',
        title: 'iPhone 14 · 128 GB',
        price: 'SAR 1,650',
        icon: Icons.smartphone,
        subtitle: 'Excellent condition · Al Olaya',
        badge: 'Verified seller',
        meta: 'Posted 2 hours ago',
      ),
      Product(
        id: 'buysell-sofa',
        title: 'Modern Three-Seater Sofa',
        price: 'SAR 850',
        icon: Icons.weekend,
        subtitle: 'Lightly used · Al Malqa',
        meta: 'Posted today',
      ),
      Product(
        id: 'buysell-bike',
        title: 'City Hybrid Bicycle',
        price: 'SAR 540',
        icon: Icons.pedal_bike,
        subtitle: '21-speed · Al Nakheel',
        meta: 'Posted yesterday',
      ),
    ]),
    HomeSection('Recently Listed', [
      Product(
        id: 'buysell-monitor',
        title: '27-inch QHD Monitor',
        price: 'SAR 620',
        icon: Icons.monitor,
        subtitle: 'Box included · Al Yasmin',
        badge: 'Just listed',
        meta: 'Posted 15 minutes ago',
      ),
      Product(
        id: 'buysell-table',
        title: 'Solid Oak Dining Table',
        price: 'SAR 950',
        icon: Icons.table_restaurant,
        subtitle: 'Seats six · Al Sahafa',
        meta: 'Posted 40 minutes ago',
      ),
      Product(
        id: 'buysell-console',
        title: 'Gaming Console & Controller',
        price: 'SAR 1,100',
        icon: Icons.sports_esports,
        subtitle: 'Great condition · Hittin',
        meta: 'Posted 1 hour ago',
      ),
    ], layout: SectionLayout.grid),
  ],
  promos: [
    BannerData(
      title: 'Discover Pre-Loved Tech',
      subtitle: 'Explore local electronics listings and compare conditions.',
      icon: Icons.devices,
      action: 'Browse Electronics',
    ),
    BannerData(
      title: 'Make room for something new',
      subtitle:
          'Explore the local resale community. Always inspect before paying.',
      icon: Icons.sell,
      action: 'Explore Marketplace',
    ),
  ],
  trust: ['Local community', 'Meet safely in public', 'Inspect before payment'],
);
