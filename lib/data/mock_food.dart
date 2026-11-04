import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const foodData = Vertical(
  id: VerticalId.food,
  title: 'Food & Drinks',
  icon: Icons.restaurant,
  headerColor: Color(0xFF741D37),
  searchHint: 'Search restaurants, dishes and cuisines',
  hero: BannerData(
    title: 'Good food, great mood',
    subtitle: 'Your next favorite meal is just around the corner.',
    icon: Icons.restaurant,
    color: Color(0xFF741D37),
    action: 'Find Your Meal',
  ),
  categories: [
    Category('Saudi', Icons.rice_bowl),
    Category('Burgers', Icons.lunch_dining),
    Category('Pizza', Icons.local_pizza),
    Category('Healthy', Icons.eco),
    Category('Coffee', Icons.coffee),
  ],
  sections: [
    HomeSection('Popular Near You', [
      Product(
        id: 'food-kabsa',
        title: 'Najd Kitchen Chicken Kabsa',
        price: 'SAR 32',
        icon: Icons.rice_bowl,
        subtitle: 'Saudi · 25–35 min',
        badge: 'Local favorite',
        meta: '4.8 · Free delivery',
        addToCart: true,
        action: 'Add to Cart',
      ),
      Product(
        id: 'food-burger',
        title: 'Smokehouse Classic Burger',
        price: 'SAR 29',
        icon: Icons.lunch_dining,
        subtitle: 'Beef burger · 20–30 min',
        meta: '4.7 · Delivery SAR 6',
        addToCart: true,
        action: 'Add to Cart',
      ),
      Product(
        id: 'food-pizza',
        title: 'Stone Oven Margherita',
        price: 'SAR 39',
        icon: Icons.local_pizza,
        subtitle: 'Wood-fired pizza · 30–40 min',
        meta: '4.9 · Delivery SAR 7',
        addToCart: true,
        action: 'Add to Cart',
      ),
    ]),
    HomeSection('Craving Something?', [
      Product(
        id: 'food-salad',
        title: 'Grilled Chicken Harvest Bowl',
        price: 'SAR 34',
        icon: Icons.eco,
        subtitle: 'Green Table · 20–30 min · 460 kcal',
        addToCart: true,
        action: 'Add to Cart',
      ),
      Product(
        id: 'food-dessert',
        title: 'Pistachio Kunafa Cup',
        price: 'SAR 18',
        icon: Icons.cake,
        subtitle: 'Sweet Riyadh · 25–35 min · Freshly prepared',
        addToCart: true,
        action: 'Add to Cart',
      ),
      Product(
        id: 'food-latte',
        title: 'Iced Spanish Latte',
        price: 'SAR 19',
        icon: Icons.local_cafe,
        subtitle: 'Bean District · 15–25 min · 350 ml',
        addToCart: true,
        action: 'Add to Cart',
      ),
    ]),
  ],
  promos: [
    BannerData(
      title: 'Coffee and a Little Something Sweet',
      subtitle: 'Discover neighborhood cafes and freshly made treats.',
      icon: Icons.local_cafe,
      color: Color(0xFF741D37),
      action: 'Explore Cafes',
    ),
    BannerData(
      title: 'Your lunch break, upgraded',
      subtitle: 'Explore meal offers from participating local restaurants.',
      icon: Icons.local_offer,
      color: Color(0xFF9B3652),
      action: 'View Offers',
    ),
  ],
);
