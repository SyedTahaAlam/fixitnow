import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const servicesData = Vertical(
  id: VerticalId.services,
  title: 'Services',
  icon: Icons.home_repair_service,
  searchHint: 'Search plumbers, cleaners, AC repair and more',
  hero: BannerData(
    title: 'A better home starts here',
    subtitle: 'Find trusted local experts for jobs big and small.',
    icon: Icons.handyman,
    action: 'Find a Professional',
  ),
  categories: [
    Category('AC Repair', Icons.ac_unit),
    Category('Cleaning', Icons.cleaning_services),
    Category('Plumbing', Icons.plumbing),
    Category('Electrical', Icons.electrical_services),
    Category('Painting', Icons.format_paint),
  ],
  sections: [
    HomeSection('Available Near You', [
      Product(
        id: 'services-ac',
        title: 'Split AC Cleaning & Checkup',
        price: 'From SAR 99',
        icon: Icons.ac_unit,
        subtitle: 'Available today · 60–90 min',
        badge: 'Same day',
        meta: '4.9 · 840 bookings',
        action: 'Book Service',
      ),
      Product(
        id: 'services-cleaning',
        title: 'Apartment Deep Cleaning',
        price: 'From SAR 199',
        icon: Icons.cleaning_services,
        subtitle: '2-person team · Supplies included',
        meta: '4.8 · 620 bookings',
        action: 'Book Service',
      ),
      Product(
        id: 'services-plumber',
        title: 'Plumbing Inspection',
        price: 'From SAR 79',
        icon: Icons.plumbing,
        subtitle: 'Leaks, taps and blocked drains',
        meta: '4.8 · 470 bookings',
        action: 'Book Service',
      ),
    ]),
    HomeSection('Popular Home Services', [
      Product(
        id: 'services-electrician',
        title: 'Electrical Repairs',
        price: 'From SAR 89',
        icon: Icons.electrical_services,
        subtitle: 'Sockets, lights and safety checks',
        action: 'Book Service',
      ),
      Product(
        id: 'services-assembly',
        title: 'Furniture Assembly',
        price: 'From SAR 119',
        icon: Icons.chair,
        subtitle: 'Beds, wardrobes and office furniture',
        action: 'Book Service',
      ),
      Product(
        id: 'services-paint',
        title: 'Room Painting',
        price: 'From SAR 349',
        icon: Icons.format_paint,
        subtitle: 'Single room · Site assessment required',
        action: 'Book Service',
      ),
    ]),
    HomeSection('Top Rated Professionals', [
      Product(
        id: 'services-ahmed',
        title: 'Ahmed · AC Technician',
        price: 'From SAR 99',
        icon: Icons.engineering,
        subtitle: '8 years experience · North Riyadh',
        meta: '4.9 · 218 reviews',
        badge: 'Verified',
        action: 'View Professional',
      ),
      Product(
        id: 'services-sara',
        title: 'Sara · Home Care Specialist',
        price: 'From SAR 149',
        icon: Icons.cleaning_services,
        subtitle: '6 years experience · Central Riyadh',
        meta: '4.9 · 184 reviews',
        badge: 'Verified',
        action: 'View Professional',
      ),
    ]),
  ],
  promos: [
    BannerData(
      title: 'Emergency Help',
      subtitle: 'Urgent home repairs? Explore available priority technicians.',
      icon: Icons.emergency,
      color: Color(0xFF9D3444),
      action: 'Find Urgent Help',
    ),
    BannerData(
      title: 'FixItNow Plus',
      subtitle: 'Discover home maintenance plans and member benefits.',
      icon: Icons.workspace_premium,
      color: Color(0xFF826128),
      action: 'Explore Plus',
    ),
  ],
);
