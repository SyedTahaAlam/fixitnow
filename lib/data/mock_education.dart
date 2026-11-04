import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const educationData = Vertical(
  id: VerticalId.education,
  title: 'Education',
  icon: Icons.school,
  searchHint: 'Search courses, skills and institutions',
  hero: BannerData(
    title: 'Learn something that moves you forward',
    subtitle:
        'Build practical skills at your own pace with local learning partners.',
    icon: Icons.school,
    action: 'Explore Courses',
  ),
  categories: [
    Category('Technology', Icons.code),
    Category('Business', Icons.business_center),
    Category('Languages', Icons.translate),
    Category('Design', Icons.palette),
    Category('Exam Prep', Icons.assignment),
  ],
  sections: [
    HomeSection('Featured Courses', [
      Product(
        id: 'edu-flutter',
        title: 'Build Your First Flutter App',
        price: 'SAR 149',
        icon: Icons.code,
        subtitle: 'Beginner · 12 hours · 24 lessons',
        badge: 'Bestseller',
        meta: '4.9 · Self-paced · Demo course',
        action: 'View Course',
      ),
      Product(
        id: 'edu-excel',
        title: 'Practical Excel for Business',
        price: 'SAR 99',
        icon: Icons.table_chart,
        subtitle: 'All levels · 8 hours · Arabic',
        meta: '4.8 · Self-paced · Demo course',
        action: 'View Course',
      ),
      Product(
        id: 'edu-english',
        title: 'English for Everyday Work',
        price: 'SAR 179',
        icon: Icons.translate,
        subtitle: 'Intermediate · 6 weeks · Live groups',
        meta: '4.8 · Evening sessions · Demo course',
        action: 'View Course',
      ),
      Product(
        id: 'edu-design',
        title: 'UI Design Essentials',
        price: 'SAR 129',
        icon: Icons.design_services,
        subtitle: 'Beginner · 10 hours · Project-based',
        badge: 'New',
        meta: '4.9 · Self-paced · Demo course',
        action: 'View Course',
      ),
    ]),
    HomeSection('Popular Learning Paths', [
      Product(
        id: 'edu-path-data',
        title: 'Data Analyst Foundations',
        price: 'SAR 399',
        icon: Icons.analytics,
        subtitle: '4 courses · Spreadsheets, SQL and dashboards',
        meta: '10-week suggested path',
        action: 'View Learning Path',
      ),
      Product(
        id: 'edu-path-marketing',
        title: 'Digital Marketing Starter',
        price: 'SAR 299',
        icon: Icons.campaign,
        subtitle: '3 courses · Content, search and analytics',
        meta: '8-week suggested path',
        action: 'View Learning Path',
      ),
      Product(
        id: 'edu-path-projects',
        title: 'Project Management Basics',
        price: 'SAR 249',
        icon: Icons.account_tree,
        subtitle: '3 courses · Planning and team delivery',
        meta: '6-week suggested path',
        action: 'View Learning Path',
      ),
    ]),
    HomeSection('Top Institutions & Partners', [
      Product(
        id: 'edu-partner-riyadh',
        title: 'Riyadh Skills Academy',
        price: 'Courses from SAR 99',
        icon: Icons.school,
        subtitle: 'Professional and technology training',
        meta: 'Illustrative learning partner',
        action: 'View Institution',
      ),
      Product(
        id: 'edu-partner-language',
        title: 'Horizon Language Institute',
        price: 'Courses from SAR 179',
        icon: Icons.language,
        subtitle: 'Small-group language learning',
        meta: 'Illustrative learning partner',
        action: 'View Institution',
      ),
    ]),
    HomeSection('Learning Tools', [
      Product(
        id: 'edu-tool-planner',
        title: 'Study Planning Guide',
        price: 'Free resource',
        icon: Icons.event_note,
        subtitle: 'Create a realistic weekly learning routine',
        meta: 'Practical learning guide',
        action: 'View Resource',
      ),
      Product(
        id: 'edu-tool-practice',
        title: 'Interview Practice Toolkit',
        price: 'Free resource',
        icon: Icons.record_voice_over,
        subtitle: 'Prepare answers and build confidence',
        meta: 'Career readiness resource',
        action: 'View Resource',
      ),
    ], layout: SectionLayout.tiles),
  ],
  promos: [
    BannerData(
      title: 'Get Certified',
      subtitle:
          'Explore certificate-focused courses to build practical skills.',
      icon: Icons.workspace_premium,
      action: 'Discover Certifications',
    ),
    BannerData(
      title: 'Learn Anywhere',
      subtitle: 'Discover self-paced lessons that fit around your schedule.',
      icon: Icons.auto_stories,
      action: 'Explore Online Learning',
    ),
  ],
);
