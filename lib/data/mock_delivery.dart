import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const deliveryData = Vertical(
  id: VerticalId.delivery,
  title: '1hr Delivery',
  icon: Icons.delivery_dining,
  headerColor: Color(0xFF8C174F),
  searchHint: 'Search nearby stores and essentials',
  hero: BannerData(
    title: 'Your City. Delivered Fast.',
    subtitle: 'Everyday essentials from your favorite local stores.',
    icon: Icons.delivery_dining,
    color: Color(0xFF8C174F),
    action: 'Explore Stores',
  ),
  categories: [
    Category('Groceries', Icons.local_grocery_store),
    Category('Flowers', Icons.local_florist),
    Category('Electronics', Icons.devices),
    Category('Gifts', Icons.card_giftcard),
    Category('Pet Care', Icons.pets),
  ],
  sections: [
    HomeSection('Stores Near You', [
      Product(
        id: 'delivery-tamimi',
        title: 'Tamimi Markets — Al Olaya',
        price: 'Delivery SAR 8',
        icon: Icons.storefront,
        subtitle: 'Groceries · 25–35 min',
        badge: 'Popular',
        meta: '4.8 · 1.2 km',
      ),
      Product(
        id: 'delivery-bloom',
        title: 'Bloom Corner Florist',
        price: 'Delivery SAR 10',
        icon: Icons.local_florist,
        subtitle: 'Fresh bouquets · 30–45 min',
        meta: '4.9 · 2.4 km',
      ),
      Product(
        id: 'delivery-pet',
        title: 'Happy Paws Supplies',
        price: 'Delivery SAR 9',
        icon: Icons.pets,
        subtitle: 'Pet essentials · 35–45 min',
        meta: '4.7 · 3.1 km',
      ),
    ]),
    HomeSection('Need It Now?', [
      Product(
        id: 'delivery-cable',
        title: 'USB-C Fast Charging Cable',
        price: 'SAR 35',
        icon: Icons.cable,
        subtitle: 'Tech Express · Arrives in 25 min',
        badge: '25 min',
        addToCart: true,
        action: 'Add to Cart',
      ),
      Product(
        id: 'delivery-water',
        title: 'Drinking Water · 24 Pack',
        price: 'SAR 18',
        icon: Icons.water_drop,
        subtitle: 'Arrives in 20–30 min · 330 ml bottles',
        badge: '30 min',
        addToCart: true,
        action: 'Add to Cart',
      ),
    ]),
    HomeSection('Exclusive Offers', [
      Product(
        id: 'delivery-gift',
        title: 'Chocolate Gift Box',
        price: 'SAR 69',
        oldPrice: 'SAR 89',
        icon: Icons.card_giftcard,
        subtitle: 'Cocoa House · 30–45 min · 16 pralines',
        badge: 'Save SAR 20',
        addToCart: true,
        action: 'Add to Cart',
      ),
      Product(
        id: 'delivery-cleaning',
        title: 'Home Cleaning Essentials Kit',
        price: 'SAR 49',
        oldPrice: 'SAR 65',
        icon: Icons.cleaning_services,
        subtitle: 'Daily Needs · 25–40 min · 5 essentials',
        addToCart: true,
        action: 'Add to Cart',
      ),
    ]),
  ],
  promos: [
    BannerData(
      title: 'Gifts Without the Wait',
      subtitle: 'Explore nearby florists and thoughtful last-minute gifts.',
      icon: Icons.card_giftcard,
      color: Color(0xFF8C174F),
      action: 'Discover Local Gifts',
    ),
    BannerData(
      title: 'A little help, right on time',
      subtitle: 'Discover nearby stores with fast local delivery.',
      icon: Icons.near_me,
      color: Color(0xFF8C174F),
    ),
  ],
);
