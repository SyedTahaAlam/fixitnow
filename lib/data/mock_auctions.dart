import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const auctionsData = Vertical(
  id: VerticalId.auctions,
  title: 'Auctions & Exchange',
  icon: Icons.gavel,
  searchHint: 'Search auctions, collectibles and rare finds',
  hero: BannerData(
    title: 'Extraordinary finds. Your next bid.',
    subtitle: 'Explore timed mock auctions from local collectors.',
    icon: Icons.gavel,
    action: 'Explore Auctions',
  ),
  categories: [
    Category('Watches', Icons.watch),
    Category('Cars', Icons.directions_car),
    Category('Art', Icons.palette),
    Category('Collectibles', Icons.collections),
    Category('Electronics', Icons.devices),
  ],
  sections: [
    HomeSection('Live Auctions', [
      Product(
        id: 'auction-watch',
        title: 'Vintage Automatic Wristwatch',
        price: 'Current bid SAR 1,250',
        icon: Icons.watch,
        subtitle: 'Stainless steel · Collector condition',
        badge: 'Live',
        meta: '18 bids · Reserve met',
        action: 'View Auction',
        countdownSeconds: 8136,
      ),
      Product(
        id: 'auction-camera',
        title: 'Classic 35 mm Film Camera',
        price: 'Current bid SAR 680',
        icon: Icons.camera_alt,
        subtitle: 'Tested working · Lens included',
        badge: 'Live',
        meta: '12 bids · Reserve met',
        action: 'View Auction',
        countdownSeconds: 12540,
      ),
      Product(
        id: 'auction-art',
        title: 'Original Desert Landscape',
        price: 'Current bid SAR 950',
        icon: Icons.palette,
        subtitle: 'Oil on canvas · 60 × 80 cm',
        badge: 'Live',
        meta: '9 bids · Signed artwork',
        action: 'View Auction',
        countdownSeconds: 4520,
      ),
    ]),
    HomeSection('Trending Categories', [
      Product(
        id: 'auction-category-coins',
        title: 'Coins & Heritage',
        price: 'Bids from SAR 100',
        icon: Icons.monetization_on,
        subtitle: 'Historical coins and collector sets',
        meta: '8 sample auctions',
      ),
      Product(
        id: 'auction-category-classics',
        title: 'Classic Vehicles',
        price: 'Bids from SAR 15,000',
        icon: Icons.directions_car,
        subtitle: 'Vintage cars and restoration projects',
        meta: '5 sample auctions',
      ),
    ], layout: SectionLayout.tiles),
    HomeSection('Recently Listed Items', [
      Product(
        id: 'auction-console',
        title: 'Retro Game Console Bundle',
        price: 'Starting bid SAR 250',
        icon: Icons.sports_esports,
        subtitle: 'Two controllers · Six game cartridges',
        badge: 'New auction',
        meta: '0 bids · Ends tomorrow',
        action: 'View Auction',
        countdownSeconds: 86400,
      ),
      Product(
        id: 'auction-rug',
        title: 'Handwoven Geometric Rug',
        price: 'Starting bid SAR 450',
        icon: Icons.grid_on,
        subtitle: 'Wool blend · 160 × 230 cm',
        meta: '2 bids · Ends in 2 days',
        action: 'View Auction',
        countdownSeconds: 172800,
      ),
    ]),
  ],
  promos: [
    BannerData(
      title: 'Exchange & Trade-in',
      subtitle: 'Explore ways to exchange pre-loved items. Demo offers only.',
      icon: Icons.swap_horiz,
      action: 'Explore Exchanges',
    ),
    BannerData(
      title: 'Sell Your Item',
      subtitle: 'Discover how a unique item could find its next owner.',
      icon: Icons.sell,
      action: 'Explore Selling',
    ),
  ],
  trust: [
    'Demo bids only',
    'Review item condition',
    'Transparent sample pricing',
  ],
);
