import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const staysData = Vertical(
  id: VerticalId.stays,
  title: 'Rentals & Leasing',
  icon: Icons.hotel,
  searchHint: 'Search stays, cities and weekend escapes',
  hero: BannerData(
    title: 'Somewhere worth slowing down',
    subtitle: 'Discover city stays, desert retreats and coastal escapes.',
    icon: Icons.holiday_village,
    action: 'Find Your Stay',
  ),
  categories: [
    Category('Hotels', Icons.hotel),
    Category('Apartments', Icons.apartment),
    Category('Chalets', Icons.cabin),
    Category('Resorts', Icons.pool),
    Category('Desert', Icons.landscape),
  ],
  sections: [
    HomeSection('Featured Stays', [
      Product(
        id: 'stays-olaya',
        title: 'Olaya Skyline Hotel',
        price: 'SAR 420 / night',
        icon: Icons.hotel,
        subtitle: 'Riyadh · Deluxe king · Breakfast included',
        badge: 'Guest favorite',
        meta: '4.8 · 312 reviews',
        action: 'View Stay',
      ),
      Product(
        id: 'stays-diriyah',
        title: 'Diriyah Courtyard Retreat',
        price: 'SAR 680 / night',
        icon: Icons.holiday_village,
        subtitle: 'Diriyah · Private courtyard · 2 guests',
        meta: '4.9 · 145 reviews',
        action: 'View Stay',
      ),
      Product(
        id: 'stays-chalet',
        title: 'Palm Garden Private Chalet',
        price: 'SAR 850 / night',
        icon: Icons.pool,
        subtitle: 'North Riyadh · Pool · Up to 8 guests',
        badge: 'Weekend escape',
        action: 'View Stay',
      ),
    ]),
    HomeSection('Popular Destinations', [
      Product(
        id: 'stays-alula',
        title: 'AlUla',
        price: 'Stays from SAR 550',
        icon: Icons.landscape,
        subtitle: 'Heritage landscapes and desert skies',
        meta: '12 curated sample stays',
      ),
      Product(
        id: 'stays-jeddah',
        title: 'Jeddah',
        price: 'Stays from SAR 310',
        icon: Icons.beach_access,
        subtitle: 'Red Sea views and historic streets',
        meta: '24 curated sample stays',
      ),
      Product(
        id: 'stays-abha',
        title: 'Abha',
        price: 'Stays from SAR 290',
        icon: Icons.forest,
        subtitle: 'Mountain air and scenic trails',
        meta: '16 curated sample stays',
      ),
    ]),
    HomeSection('Recommended for You', [
      Product(
        id: 'stays-business',
        title: 'KAFD Executive Apartment',
        price: 'SAR 360 / night',
        icon: Icons.apartment,
        subtitle: 'Riyadh · Workspace · Kitchenette',
        meta: '4.7 · Business-friendly',
        action: 'View Stay',
      ),
      Product(
        id: 'stays-seaview',
        title: 'Corniche Sea View Suite',
        price: 'SAR 590 / night',
        icon: Icons.balcony,
        subtitle: 'Jeddah · Balcony · 4 guests',
        meta: '4.9 · Flexible cancellation option',
        action: 'View Stay',
      ),
    ]),
  ],
  promos: [
    BannerData(
      title: 'Stay Longer, Feel at Home',
      subtitle: 'Explore furnished apartments for extended city stays.',
      icon: Icons.apartment,
      action: 'Discover Longer Stays',
    ),
    BannerData(
      title: 'Make a weekend of it',
      subtitle: 'Explore local escapes without the long journey.',
      icon: Icons.weekend,
      action: 'Discover Getaways',
    ),
  ],
);
