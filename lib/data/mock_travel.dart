import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const travelData = Vertical(
  id: VerticalId.travel,
  title: 'Tickets & Travel',
  icon: Icons.flight,
  searchHint: 'Search destinations and travel experiences',
  tabs: ['Flights', 'Hotels', 'Buses', 'Trains', 'Visa', 'Tours', 'Insurance'],
  hero: BannerData(
    title: 'Your next adventure awaits',
    subtitle: 'Explore flights, destinations and helpful travel services.',
    icon: Icons.flight_takeoff,
    action: 'Explore Travel',
  ),
  categories: [
    Category('City Breaks', Icons.location_city),
    Category('Beach', Icons.beach_access),
    Category('Adventure', Icons.hiking),
    Category('Heritage', Icons.museum),
    Category('Family', Icons.family_restroom),
  ],
  sections: [
    HomeSection('Best Flight Deals', [
      Product(
        id: 'travel-dubai',
        title: 'Riyadh → Dubai',
        price: 'From SAR 499',
        icon: Icons.flight_takeoff,
        subtitle: 'Round trip · Economy · Nonstop',
        badge: 'Popular route',
        meta: 'Illustrative fare · Taxes included',
        action: 'View Flight',
      ),
      Product(
        id: 'travel-cairo',
        title: 'Riyadh → Cairo',
        price: 'From SAR 699',
        icon: Icons.flight,
        subtitle: 'Round trip · Economy · Nonstop',
        meta: 'Illustrative fare · Taxes included',
        action: 'View Flight',
      ),
      Product(
        id: 'travel-istanbul',
        title: 'Riyadh → Istanbul',
        price: 'From SAR 899',
        icon: Icons.airplanemode_active,
        subtitle: 'Round trip · Economy · Nonstop',
        badge: 'City escape',
        meta: 'Illustrative fare · Taxes included',
        action: 'View Flight',
      ),
    ]),
    HomeSection('Popular Travel Destinations', [
      Product(
        id: 'travel-destination-baku',
        title: 'Baku',
        price: 'Packages from SAR 1,799',
        icon: Icons.location_city,
        subtitle: '3 nights · Old town and Caspian coast',
        meta: 'Sample itinerary · Per person',
      ),
      Product(
        id: 'travel-destination-maldives',
        title: 'Maldives',
        price: 'Packages from SAR 4,499',
        icon: Icons.beach_access,
        subtitle: '4 nights · Island resort getaway',
        meta: 'Sample itinerary · Per person',
      ),
      Product(
        id: 'travel-destination-tbilisi',
        title: 'Tbilisi',
        price: 'Packages from SAR 1,999',
        icon: Icons.terrain,
        subtitle: '4 nights · Culture and mountain views',
        meta: 'Sample itinerary · Per person',
      ),
    ]),
    HomeSection('Travel Services', [
      Product(
        id: 'travel-visa',
        title: 'Visa Document Guidance',
        price: 'From SAR 149',
        icon: Icons.description,
        subtitle: 'Review destination-specific requirements',
        meta: 'Approval depends on issuing authority',
        action: 'Explore Service',
      ),
      Product(
        id: 'travel-insurance',
        title: 'Travel Insurance Options',
        price: 'From SAR 45',
        icon: Icons.health_and_safety,
        subtitle: 'Explore trip and medical cover options',
        meta: 'Partner terms and exclusions apply',
        action: 'Explore Service',
      ),
      Product(
        id: 'travel-tour',
        title: 'Guided City Tours',
        price: 'From SAR 120',
        icon: Icons.tour,
        subtitle: 'Small-group sightseeing experiences',
        meta: 'Sample tour pricing · Per person',
        action: 'Explore Tours',
      ),
    ], layout: SectionLayout.tiles),
  ],
  promos: [
    BannerData(
      title: 'Umrah Packages',
      subtitle:
          'Explore travel and accommodation options for your Umrah journey.',
      icon: Icons.mosque,
      action: 'Explore Umrah',
    ),
    BannerData(
      title: 'Tour & Holiday Packages',
      subtitle:
          'Discover curated itineraries for memorable city and beach breaks.',
      icon: Icons.luggage,
      action: 'Browse Holidays',
    ),
  ],
);
