import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const carRentalData = Vertical(
  id: VerticalId.carRental,
  title: 'Car Rental',
  icon: Icons.car_rental,
  searchHint: 'Search car brands and rental locations',
  tabs: ['Self Drive', 'With Driver', 'Airport Pickup', 'Monthly'],
  hero: BannerData(
    title: 'The right car for every journey',
    subtitle: 'Explore flexible rental options across Riyadh.',
    icon: Icons.car_rental,
    action: 'Explore Cars',
  ),
  categories: [
    Category('Economy', Icons.directions_car),
    Category('Sedan', Icons.time_to_leave),
    Category('SUV', Icons.airport_shuttle),
    Category('Luxury', Icons.auto_awesome),
    Category('Electric', Icons.electric_car),
  ],
  sections: [
    HomeSection('Popular Cars in Riyadh', [
      Product(
        id: 'rental-yaris',
        title: 'Toyota Yaris · 2025',
        price: 'SAR 119 / day',
        icon: Icons.directions_car,
        subtitle: 'Automatic · 5 seats · 200 km/day',
        badge: 'Best value',
        meta: '4.8 · Basic coverage included',
        action: 'View Car',
      ),
      Product(
        id: 'rental-elantra',
        title: 'Hyundai Elantra · 2025',
        price: 'SAR 159 / day',
        icon: Icons.time_to_leave,
        subtitle: 'Automatic · 5 seats · 200 km/day',
        meta: '4.9 · Free cancellation option',
        action: 'View Car',
      ),
      Product(
        id: 'rental-fortuner',
        title: 'Toyota Fortuner · 2024',
        price: 'SAR 289 / day',
        icon: Icons.airport_shuttle,
        subtitle: 'Automatic · 7 seats · 250 km/day',
        badge: 'Family favorite',
        action: 'View Car',
      ),
    ]),
    HomeSection('Why Rent with FixItNow?', [
      Product(
        id: 'rental-flexibility',
        title: 'Flexible Rental Periods',
        price: 'Daily to monthly',
        icon: Icons.event_available,
        subtitle: 'Choose a plan that fits your trip',
        meta: 'Partner terms apply',
      ),
      Product(
        id: 'rental-pricing',
        title: 'Clear Rental Pricing',
        price: 'Compare before booking',
        icon: Icons.receipt_long,
        subtitle: 'Review mileage, deposits and coverage',
        meta: 'No live reservation in this demo',
      ),
      Product(
        id: 'rental-support',
        title: 'Roadside Support',
        price: 'Partner assistance',
        icon: Icons.support_agent,
        subtitle: 'Explore support included with your car',
        meta: 'Availability varies by partner',
      ),
    ], layout: SectionLayout.tiles),
  ],
  promos: [
    BannerData(
      title: 'Land and Get Going',
      subtitle: 'Explore convenient airport pickup rental options.',
      icon: Icons.local_airport,
      action: 'Discover Airport Rentals',
    ),
    BannerData(
      title: 'Stay longer, drive smarter',
      subtitle: 'Explore monthly rentals for work and everyday travel.',
      icon: Icons.calendar_month,
      action: 'Explore Monthly Cars',
    ),
  ],
);
