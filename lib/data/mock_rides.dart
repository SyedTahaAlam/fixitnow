import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const ridesData = Vertical(
  id: VerticalId.rides,
  title: 'Rides',
  icon: Icons.local_taxi,
  searchHint: 'Where would you like to go?',
  hero: BannerData(
    title: 'Your city, one ride away',
    subtitle: 'Explore comfortable ways to get around Riyadh.',
    icon: Icons.local_taxi,
    action: 'Explore Rides',
  ),
  categories: [
    Category('Economy', Icons.directions_car),
    Category('Comfort', Icons.airline_seat_recline_extra),
    Category('XL', Icons.airport_shuttle),
    Category('Premium', Icons.auto_awesome),
  ],
  sections: [
    HomeSection('Choose a Ride', [
      Product(
        id: 'rides-economy',
        title: 'Economy',
        price: 'Est. SAR 22',
        icon: Icons.directions_car,
        subtitle: 'Everyday value · 4 seats',
        meta: '3 min away · Example city trip',
        action: 'View Ride',
      ),
      Product(
        id: 'rides-comfort',
        title: 'Comfort',
        price: 'Est. SAR 29',
        icon: Icons.airline_seat_recline_extra,
        subtitle: 'More room to relax · 4 seats',
        meta: '4 min away · Example city trip',
        action: 'View Ride',
      ),
      Product(
        id: 'rides-xl',
        title: 'XL',
        price: 'Est. SAR 39',
        icon: Icons.airport_shuttle,
        subtitle: 'Room for your group · 6 seats',
        meta: '6 min away · Example city trip',
        action: 'View Ride',
      ),
      Product(
        id: 'rides-premium',
        title: 'Premium',
        price: 'Est. SAR 49',
        icon: Icons.auto_awesome,
        subtitle: 'Executive comfort · 4 seats',
        meta: '5 min away · Example city trip',
        action: 'View Ride',
      ),
      Product(
        id: 'rides-driver',
        title: 'Driver',
        price: 'Est. SAR 26',
        icon: Icons.person,
        subtitle: 'A professional driver for your own car',
        meta: '7 min away · Example city trip',
        action: 'View Ride',
      ),
    ], layout: SectionLayout.tiles),
    HomeSection('Recent Rides', [
      Product(
        id: 'rides-recent-kafd',
        title: 'King Abdullah Financial District',
        price: 'SAR 28',
        icon: Icons.business,
        subtitle: 'From Al Olaya · Yesterday, 9:15 AM',
        meta: 'Completed · Comfort',
        action: 'View Trip',
      ),
      Product(
        id: 'rides-recent-mall',
        title: 'Riyadh Park Mall',
        price: 'SAR 24',
        icon: Icons.shopping_bag,
        subtitle: 'From Al Malqa · Monday, 6:40 PM',
        meta: 'Completed · Economy',
        action: 'View Trip',
      ),
    ], layout: SectionLayout.tiles),
    HomeSection('More Ways to Ride', [
      Product(
        id: 'rides-scheduled',
        title: 'Schedule a Ride',
        price: 'Plan ahead',
        icon: Icons.schedule,
        subtitle: 'Choose a pickup time for a later trip',
        meta: 'Sample scheduling option',
        action: 'View Option',
      ),
      Product(
        id: 'rides-someone',
        title: 'Ride for Someone Else',
        price: 'Send a ride',
        icon: Icons.people,
        subtitle: 'Arrange a trip for family or friends',
        meta: 'Sample guest ride option',
        action: 'View Option',
      ),
      Product(
        id: 'rides-airport',
        title: 'Airport Transfer',
        price: 'From SAR 85',
        icon: Icons.local_airport,
        subtitle: 'King Khalid International Airport',
        meta: 'Example fare · Terminal pickup',
        action: 'View Option',
      ),
    ], layout: SectionLayout.tiles),
  ],
  promos: [
    BannerData(
      title: 'Safe Rides Across Riyadh',
      subtitle: 'Explore ride options with verified partner drivers.',
      icon: Icons.verified_user,
      action: 'Explore Safe Travel',
    ),
    BannerData(
      title: 'Premium Rides',
      subtitle: 'Discover executive comfort for your next city journey.',
      icon: Icons.auto_awesome,
      action: 'Explore Premium',
    ),
  ],
  trust: [
    'Illustrative fares only',
    'Partner driver verification',
    'Trip support',
  ],
);
