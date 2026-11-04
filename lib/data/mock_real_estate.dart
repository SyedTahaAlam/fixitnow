import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const realEstateData = Vertical(
  id: VerticalId.realEstate,
  title: 'Real Estate',
  icon: Icons.real_estate_agent,
  searchHint: 'Search properties, areas and communities',
  hero: BannerData(
    title: 'Find your next place in Riyadh',
    subtitle: 'Explore spaces to live, work and build your future.',
    icon: Icons.home_work,
    action: 'Explore Properties',
  ),
  categories: [
    Category('Apartments', Icons.apartment),
    Category('Villas', Icons.house),
    Category('Offices', Icons.business),
    Category('Land', Icons.landscape),
    Category('Shops', Icons.storefront),
  ],
  sections: [
    HomeSection('Featured Properties in Riyadh', [
      Product(
        id: 'property-malqa',
        title: 'Modern Apartment in Al Malqa',
        price: 'SAR 850,000',
        icon: Icons.apartment,
        subtitle: '3 bedrooms · 3 baths · 155 m²',
        badge: 'For sale',
        meta: 'Al Malqa · Sample listing',
        action: 'View Property',
      ),
      Product(
        id: 'property-yasmin',
        title: 'Family Villa in Al Yasmin',
        price: 'SAR 120,000 / year',
        icon: Icons.house,
        subtitle: '4 bedrooms · Garden · 320 m²',
        badge: 'For rent',
        meta: 'Al Yasmin · Sample listing',
        action: 'View Property',
      ),
      Product(
        id: 'property-olaya',
        title: 'Furnished Office in Al Olaya',
        price: 'SAR 65,000 / year',
        icon: Icons.business,
        subtitle: '8 workstations · 95 m² · Parking',
        badge: 'For rent',
        meta: 'Al Olaya · Sample listing',
        action: 'View Property',
      ),
    ]),
    HomeSection('Popular Areas', [
      Product(
        id: 'property-area-narjis',
        title: 'Al Narjis',
        price: 'Homes from SAR 700,000',
        icon: Icons.location_city,
        subtitle: 'Growing neighborhoods · North Riyadh',
        meta: '24 sample properties',
      ),
      Product(
        id: 'property-area-hittin',
        title: 'Hittin',
        price: 'Rentals from SAR 55,000/yr',
        icon: Icons.park,
        subtitle: 'Family living · Near leisure destinations',
        meta: '18 sample properties',
      ),
      Product(
        id: 'property-area-qurtubah',
        title: 'Qurtubah',
        price: 'Homes from SAR 650,000',
        icon: Icons.apartment,
        subtitle: 'Connected communities · East Riyadh',
        meta: '21 sample properties',
      ),
    ]),
    HomeSection('Real Estate Services', [
      Product(
        id: 'property-inspection',
        title: 'Pre-Purchase Inspection',
        price: 'From SAR 499',
        icon: Icons.fact_check,
        subtitle: 'Detailed condition report by an expert',
        action: 'Explore Service',
      ),
      Product(
        id: 'property-valuation',
        title: 'Property Valuation Consultation',
        price: 'From SAR 299',
        icon: Icons.analytics,
        subtitle: 'Understand comparable local listings',
        action: 'Explore Service',
      ),
    ], layout: SectionLayout.tiles),
  ],
  promos: [
    BannerData(
      title: 'Room for Your Business',
      subtitle: 'Explore offices and commercial spaces across Riyadh.',
      icon: Icons.business,
      action: 'Discover Workspaces',
    ),
    BannerData(
      title: 'Space for your next chapter',
      subtitle: 'Discover new communities and thoughtfully selected homes.',
      icon: Icons.home,
      action: 'Browse Communities',
    ),
  ],
);
