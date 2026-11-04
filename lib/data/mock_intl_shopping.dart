import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const intlShoppingData = Vertical(
  id: VerticalId.intlShopping,
  title: 'Intl Shopping',
  icon: Icons.public,
  searchHint: 'Search global brands and products',
  hero: BannerData(
    title: 'The world, delivered to you',
    subtitle: 'Discover global favorites with delivery across Saudi Arabia.',
    icon: Icons.public,
    action: 'Shop Worldwide',
  ),
  categories: [
    Category('Electronics', Icons.devices),
    Category('Fashion', Icons.checkroom),
    Category('Beauty', Icons.face),
    Category('Home', Icons.chair),
    Category('Watches', Icons.watch),
    Category('Accessories', Icons.backpack),
  ],
  sections: [
    HomeSection('Trending Worldwide', [
      Product(
        id: 'intl-headphones',
        title: 'Studio Wireless Headphones',
        price: 'SAR 349',
        icon: Icons.headphones,
        subtitle: 'Ships from Germany · 5–8 days',
        badge: '22% OFF',
        oldPrice: 'SAR 449',
        addToCart: true,
        action: 'Add to Cart',
      ),
      Product(
        id: 'intl-sneakers',
        title: 'Everyday Knit Sneakers',
        price: 'SAR 229',
        icon: Icons.directions_run,
        subtitle: 'Ships from UK · 5–8 days · Sizes 38–45',
        addToCart: true,
        action: 'Add to Cart',
      ),
      Product(
        id: 'intl-watch',
        title: 'Active Smart Watch',
        price: 'SAR 279',
        icon: Icons.watch,
        subtitle: 'Ships from UAE · 3–5 days',
        badge: 'New',
        addToCart: true,
        action: 'Add to Cart',
      ),
      Product(
        id: 'intl-skincare',
        title: 'Korean Hydration Set',
        price: 'SAR 149',
        icon: Icons.spa,
        subtitle: 'Ships from Korea · 7–10 days · 4-piece set',
        addToCart: true,
        action: 'Add to Cart',
      ),
    ], layout: SectionLayout.grid),
    HomeSection('Popular in Saudi Arabia', [
      Product(
        id: 'intl-coffee',
        title: 'Portable Espresso Maker',
        price: 'SAR 189',
        icon: Icons.coffee,
        subtitle: 'Delivery in 4–7 days · Travel-ready · 80 ml',
        addToCart: true,
        action: 'Add to Cart',
      ),
      Product(
        id: 'intl-backpack',
        title: 'Urban Laptop Backpack',
        price: 'SAR 159',
        icon: Icons.backpack,
        subtitle: 'Delivery in 5–8 days · Fits 15-inch laptop',
        addToCart: true,
        action: 'Add to Cart',
      ),
      Product(
        id: 'intl-lamp',
        title: 'Nordic Desk Lamp',
        price: 'SAR 119',
        icon: Icons.light,
        subtitle: 'Delivery in 4–7 days · Dimmable · USB-C',
        addToCart: true,
        action: 'Add to Cart',
      ),
    ]),
  ],
  promos: [
    BannerData(
      title: 'Style Beyond Borders',
      subtitle: 'Discover watches and accessories from global brands.',
      icon: Icons.watch,
      action: 'Explore Global Style',
    ),
    BannerData(
      title: 'Global finds, local convenience',
      subtitle: 'Explore a curated collection of international brands.',
      icon: Icons.local_shipping,
      action: 'Discover Brands',
    ),
  ],
);
