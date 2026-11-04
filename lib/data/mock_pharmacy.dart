import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const pharmacyData = Vertical(
  id: VerticalId.pharmacy,
  title: 'Pharmacy',
  icon: Icons.local_pharmacy,
  headerColor: Color(0xFF007D83),
  searchHint: 'Search health, wellness and personal care',
  hero: BannerData(
    title: 'Everyday care, close to home',
    subtitle: 'Explore wellness essentials from licensed pharmacy partners.',
    icon: Icons.health_and_safety,
    color: Color(0xFF007D83),
    action: 'Explore Wellness',
  ),
  categories: [
    Category('Vitamins', Icons.medication),
    Category('First Aid', Icons.medical_services),
    Category('Skin Care', Icons.face),
    Category('Baby Care', Icons.child_care),
    Category('Devices', Icons.monitor_heart),
  ],
  sections: [
    HomeSection('Health Essentials', [
      Product(
        id: 'pharmacy-firstaid',
        title: 'Family First Aid Kit',
        price: 'SAR 59',
        icon: Icons.medical_services,
        subtitle: 'Delivery in 30–45 min · 32 care essentials',
        badge: 'Home essential',
        addToCart: true,
        action: 'Add to Cart',
      ),
      Product(
        id: 'pharmacy-sunscreen',
        title: 'Daily Sunscreen SPF 50',
        price: 'SAR 74',
        icon: Icons.wb_sunny,
        subtitle: 'Delivery in 30–45 min · SPF 50 · 50 ml',
        addToCart: true,
        action: 'Add to Cart',
      ),
      Product(
        id: 'pharmacy-thermometer',
        title: 'Digital Ear Thermometer',
        price: 'SAR 119',
        icon: Icons.thermostat,
        subtitle: 'Delivery in 30–45 min · Family use',
        addToCart: true,
        action: 'Add to Cart',
      ),
    ]),
    HomeSection('Nearby Licensed Pharmacies', [
      Product(
        id: 'pharmacy-nahdi',
        title: 'Nahdi — Al Malqa',
        price: 'Delivery SAR 8',
        icon: Icons.local_pharmacy,
        subtitle: 'Licensed pharmacy · Open until midnight',
        meta: '4.8 · 1.4 km',
      ),
      Product(
        id: 'pharmacy-dawaa',
        title: 'Al-Dawaa — Al Yasmin',
        price: 'Delivery SAR 7',
        icon: Icons.local_hospital,
        subtitle: 'Licensed pharmacy · Open 24 hours',
        meta: '4.7 · 2.2 km',
      ),
    ], layout: SectionLayout.tiles),
  ],
  promos: [
    BannerData(
      title: 'Wellness for the Whole Family',
      subtitle: 'Discover personal care and everyday health essentials.',
      icon: Icons.family_restroom,
      color: Color(0xFF007D83),
      action: 'Explore Family Care',
    ),
    BannerData(
      title: 'Care starts with good advice',
      subtitle: 'Ask a licensed pharmacist about appropriate product use.',
      icon: Icons.support_agent,
      color: Color(0xFF007D83),
      action: 'Explore Pharmacy Care',
    ),
  ],
  trust: [
    'Licensed pharmacy partners',
    'Prescription checks required',
    'Private and secure',
  ],
);
