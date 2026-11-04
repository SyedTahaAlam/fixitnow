import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const professionalData = Vertical(
  id: VerticalId.professional,
  title: 'Professional',
  icon: Icons.business_center,
  searchHint: 'Search experts, consultants and business services',
  hero: BannerData(
    title: 'Expert guidance. Real possibilities.',
    subtitle:
        'Connect with specialists for your next personal or business step.',
    icon: Icons.workspace_premium,
    color: Color(0xFFA77B28),
    action: 'Meet the Experts',
  ),
  categories: [
    Category('Legal', Icons.gavel),
    Category('Accounting', Icons.calculate),
    Category('Consulting', Icons.business_center),
    Category('Design', Icons.design_services),
    Category('Technology', Icons.computer),
  ],
  sections: [
    HomeSection('Talk to an Expert', [
      Product(
        id: 'pro-legal',
        title: 'Business Legal Consultation',
        price: 'From SAR 250',
        icon: Icons.gavel,
        subtitle: '30-minute video consultation',
        badge: 'Verified expert',
        meta: '4.9 · 96 consultations',
        action: 'Book Consultation',
      ),
      Product(
        id: 'pro-tax',
        title: 'VAT & Accounting Advice',
        price: 'From SAR 180',
        icon: Icons.calculate,
        subtitle: '45-minute session · SME focused',
        meta: '4.8 · 124 consultations',
        action: 'Book Consultation',
      ),
      Product(
        id: 'pro-career',
        title: 'Career Strategy Session',
        price: 'From SAR 150',
        icon: Icons.trending_up,
        subtitle: 'CV review and interview guidance',
        meta: '4.9 · 88 consultations',
        action: 'Book Consultation',
      ),
    ]),
    HomeSection('Business Solutions', [
      Product(
        id: 'pro-brand',
        title: 'Startup Brand Identity',
        price: 'From SAR 1,200',
        icon: Icons.design_services,
        subtitle: 'Logo, color system and brand guide',
        action: 'Explore Service',
      ),
      Product(
        id: 'pro-website',
        title: 'Small Business Website',
        price: 'From SAR 2,500',
        icon: Icons.web,
        subtitle: 'Responsive five-page business site',
        action: 'Explore Service',
      ),
      Product(
        id: 'pro-payroll',
        title: 'Monthly Bookkeeping',
        price: 'From SAR 650/mo',
        icon: Icons.receipt_long,
        subtitle: 'Monthly reconciliation and reports',
        action: 'Explore Service',
      ),
    ]),
    HomeSection('Top Professionals', [
      Product(
        id: 'pro-noura',
        title: 'Noura Al Salem · Business Advisor',
        price: 'SAR 220 / session',
        icon: Icons.person,
        subtitle: 'SME strategy · Arabic & English',
        meta: '4.9 · 72 reviews',
        badge: 'Top rated',
        action: 'View Profile',
      ),
      Product(
        id: 'pro-omar',
        title: 'Omar Hassan · UX Consultant',
        price: 'SAR 190 / session',
        icon: Icons.person_outline,
        subtitle: 'Product design · 10 years experience',
        meta: '4.8 · 65 reviews',
        action: 'View Profile',
      ),
    ]),
  ],
  promos: [
    BannerData(
      title: 'Make Your Next Career Move',
      subtitle:
          'Explore expert guidance for interviews and professional growth.',
      icon: Icons.trending_up,
      color: Color(0xFFA77B28),
      action: 'Discover Career Experts',
    ),
    BannerData(
      title: 'Build your next big idea',
      subtitle: 'Explore tailored expertise for growing businesses.',
      icon: Icons.lightbulb,
      color: Color(0xFFA77B28),
    ),
  ],
);
