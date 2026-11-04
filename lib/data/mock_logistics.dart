import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const logisticsData = Vertical(
  id: VerticalId.logistics,
  title: 'Logistics',
  icon: Icons.local_shipping,
  searchHint: 'Search shipping destinations and services',
  hero: BannerData(
    title: 'From your door to theirs',
    subtitle: 'Explore parcel, freight and business delivery options.',
    icon: Icons.local_shipping,
    action: 'Explore Shipping',
  ),
  categories: [
    Category('Parcels', Icons.inventory_2),
    Category('Express', Icons.bolt),
    Category('Freight', Icons.local_shipping),
    Category('International', Icons.public),
    Category('Moving', Icons.move_to_inbox),
  ],
  sections: [
    HomeSection('Popular Destinations', [
      Product(
        id: 'logistics-jeddah',
        title: 'Riyadh → Jeddah',
        price: 'From SAR 29',
        icon: Icons.inventory_2,
        subtitle: 'Domestic parcel · 2–3 business days',
        meta: 'Up to 5 kg · Illustrative rate',
        action: 'View Shipping',
      ),
      Product(
        id: 'logistics-dammam',
        title: 'Riyadh → Dammam',
        price: 'From SAR 25',
        icon: Icons.local_shipping,
        subtitle: 'Domestic parcel · 1–2 business days',
        meta: 'Up to 5 kg · Illustrative rate',
        action: 'View Shipping',
      ),
      Product(
        id: 'logistics-dubai',
        title: 'Riyadh → Dubai',
        price: 'From SAR 89',
        icon: Icons.flight_takeoff,
        subtitle: 'International · 3–5 business days',
        meta: 'Up to 2 kg · Customs may apply',
        action: 'View Shipping',
      ),
    ]),
    HomeSection('Recent Shipments', [
      Product(
        id: 'logistics-shipment-1042',
        title: 'Parcel FN-1042 · Jeddah',
        price: 'SAR 32',
        icon: Icons.local_shipping,
        subtitle: 'Sample shipment · Out for delivery',
        badge: 'In transit',
        meta: 'Last update today, 10:30 AM',
        action: 'View Shipment',
      ),
      Product(
        id: 'logistics-shipment-1038',
        title: 'Documents FN-1038 · Dammam',
        price: 'SAR 25',
        icon: Icons.mark_email_read,
        subtitle: 'Sample shipment · Delivered Monday',
        badge: 'Delivered',
        meta: 'Signed by recipient · Demo tracking',
        action: 'View Shipment',
      ),
    ], layout: SectionLayout.tiles),
  ],
  promos: [
    BannerData(
      title: 'Send Beyond Borders',
      subtitle: 'Explore international parcel services and delivery estimates.',
      icon: Icons.public,
      action: 'Explore International Shipping',
    ),
    BannerData(
      title: 'Shipping for growing businesses',
      subtitle: 'Explore recurring pickup and bulk delivery options.',
      icon: Icons.business_center,
      action: 'Explore Business Shipping',
    ),
  ],
);
