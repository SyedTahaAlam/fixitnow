import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const jobsData = Vertical(
  id: VerticalId.jobs,
  title: 'Jobs & Manpower',
  icon: Icons.work,
  searchHint: 'Search job titles, companies and skills',
  tabs: ['Jobs for You', 'Hire Manpower', 'Post a Job'],
  hero: BannerData(
    title: 'Your next opportunity starts here',
    subtitle: 'Explore careers and staffing solutions across Riyadh.',
    icon: Icons.work_outline,
    action: 'Explore Opportunities',
  ),
  categories: [
    Category('Technology', Icons.computer),
    Category('Sales', Icons.storefront),
    Category('Hospitality', Icons.restaurant),
    Category('Engineering', Icons.engineering),
    Category('Operations', Icons.inventory_2),
  ],
  sections: [
    HomeSection('Featured Jobs', [
      Product(
        id: 'jobs-flutter',
        title: 'Flutter Developer',
        price: 'SAR 12,000–18,000 / mo',
        icon: Icons.code,
        subtitle: 'Nimble Digital · Riyadh · Hybrid',
        badge: 'Full time',
        meta: '3+ years · Posted today',
        action: 'View Job',
      ),
      Product(
        id: 'jobs-account',
        title: 'Account Executive',
        price: 'SAR 7,000–10,000 / mo',
        icon: Icons.business_center,
        subtitle: 'Horizon Solutions · Al Olaya',
        badge: 'Full time',
        meta: '2+ years · Posted yesterday',
        action: 'View Job',
      ),
      Product(
        id: 'jobs-barista',
        title: 'Specialty Coffee Barista',
        price: 'SAR 4,500–6,000 / mo',
        icon: Icons.coffee,
        subtitle: 'Bean & Co. · North Riyadh',
        badge: 'Shift based',
        meta: '1+ years · Posted today',
        action: 'View Job',
      ),
    ]),
    HomeSection('Hire Manpower Supply', [
      Product(
        id: 'jobs-event-staff',
        title: 'Event Support Team',
        price: 'From SAR 180 / person/day',
        icon: Icons.groups,
        subtitle: 'Ushers, registration and event setup',
        meta: 'Verified staffing partner',
        action: 'View Staffing',
      ),
      Product(
        id: 'jobs-warehouse',
        title: 'Warehouse Operations Crew',
        price: 'From SAR 160 / person/day',
        icon: Icons.warehouse,
        subtitle: 'Packing, sorting and inventory support',
        meta: 'Flexible short-term assignments',
        action: 'View Staffing',
      ),
      Product(
        id: 'jobs-hospitality',
        title: 'Hospitality Service Staff',
        price: 'From SAR 200 / person/day',
        icon: Icons.room_service,
        subtitle: 'Trained servers and guest service teams',
        action: 'View Staffing',
      ),
    ]),
    HomeSection('Why Choose FixItNow?', [
      Product(
        id: 'jobs-verified',
        title: 'Verified Employer Profiles',
        price: 'Apply with context',
        icon: Icons.verified_user,
        subtitle: 'Review company and role information',
        meta: 'Sample employer directory',
      ),
      Product(
        id: 'jobs-local',
        title: 'Opportunities Near You',
        price: 'Find your fit',
        icon: Icons.location_on,
        subtitle: 'Explore roles by location and expertise',
        meta: 'No application is sent in this demo',
      ),
    ], layout: SectionLayout.tiles),
  ],
  promos: [
    BannerData(
      title: 'Take the Next Career Step',
      subtitle:
          'Explore fresh opportunities matched to different skill levels.',
      icon: Icons.work_outline,
      action: 'Discover Careers',
    ),
    BannerData(
      title: 'Great teams start with great people',
      subtitle: 'Discover flexible hiring support for your business.',
      icon: Icons.groups,
      action: 'Explore Hiring',
    ),
  ],
);
