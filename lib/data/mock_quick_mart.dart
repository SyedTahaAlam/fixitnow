import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const quickMartData = Vertical(
  id: VerticalId.quickMart,
  title: 'QuickMart',
  icon: Icons.local_grocery_store,
  headerColor: Color(0xFF137547),
  searchHint: 'Search fruits, milk, snacks and more',
  hero: BannerData(
    title: 'Fresh essentials, fast',
    subtitle: 'Fill your basket with everyday favorites in minutes.',
    icon: Icons.shopping_basket,
    color: Color(0xFF137547),
    action: 'Start Shopping',
  ),
  categories: [
    Category('Fruits', Icons.apple),
    Category('Vegetables', Icons.eco),
    Category('Dairy', Icons.water_drop),
    Category('Bakery', Icons.bakery_dining),
    Category('Snacks', Icons.cookie),
  ],
  sections: [
    HomeSection('Fresh Picks Today', [
      Product(
        id: 'mart-bananas',
        title: 'Fresh Bananas · 1 kg',
        price: 'SAR 7.50',
        icon: Icons.eco,
        subtitle: 'Delivery in 15–25 min · Fresh produce',
        badge: 'Fresh',
        addToCart: true,
        action: 'Add to Cart',
        color: Color(0xFF137547),
      ),
      Product(
        id: 'mart-milk',
        title: 'Fresh Full-Fat Milk · 2 L',
        price: 'SAR 12',
        icon: Icons.water_drop,
        subtitle: 'Delivery in 15–25 min · Keep chilled',
        addToCart: true,
        action: 'Add to Cart',
      ),
      Product(
        id: 'mart-bread',
        title: 'Wholegrain Sourdough Loaf',
        price: 'SAR 16',
        icon: Icons.bakery_dining,
        subtitle: 'Delivery in 15–25 min · Baked today · 500 g',
        addToCart: true,
        action: 'Add to Cart',
      ),
      Product(
        id: 'mart-strawberries',
        title: 'Strawberries · 250 g',
        price: 'SAR 11',
        oldPrice: 'SAR 14',
        icon: Icons.local_florist,
        subtitle: 'Delivery in 15–25 min · Seasonal berries',
        addToCart: true,
        action: 'Add to Cart',
      ),
    ]),
    HomeSection('Shop by Store', [
      Product(
        id: 'mart-danube',
        title: 'Danube Fresh Market',
        price: 'Delivery SAR 7',
        icon: Icons.store,
        subtitle: 'Premium groceries · 20–30 min',
        meta: '4.8 · 1.8 km',
      ),
      Product(
        id: 'mart-panda',
        title: 'Panda Neighborhood Store',
        price: 'Delivery SAR 5',
        icon: Icons.storefront,
        subtitle: 'Everyday value · 25–35 min',
        meta: '4.7 · 2.1 km',
      ),
    ], layout: SectionLayout.tiles),
    HomeSection('Popular Categories', [
      Product(
        id: 'mart-breakfast',
        title: 'Breakfast Favorites',
        price: 'From SAR 6',
        icon: Icons.egg_alt,
        subtitle: 'Eggs, spreads and morning essentials',
      ),
      Product(
        id: 'mart-pantry',
        title: 'Pantry Staples',
        price: 'From SAR 4',
        icon: Icons.kitchen,
        subtitle: 'Rice, pasta and cooking essentials',
      ),
      Product(
        id: 'mart-frozen',
        title: 'Frozen Foods',
        price: 'From SAR 9',
        icon: Icons.ac_unit,
        subtitle: 'Quick meals and frozen vegetables',
      ),
    ], layout: SectionLayout.tiles),
  ],
  promos: [
    BannerData(
      title: 'Stock Up on Everyday Value',
      subtitle: 'Discover pantry staples and household essentials.',
      icon: Icons.shopping_basket,
      color: Color(0xFF137547),
      action: 'Explore Essentials',
    ),
    BannerData(
      title: 'A fresher weekly basket',
      subtitle: 'Discover seasonal produce and daily essentials.',
      icon: Icons.eco,
      color: Color(0xFF137547),
    ),
  ],
);
