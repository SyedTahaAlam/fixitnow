import 'package:flutter/material.dart';

import '../models/vertical.dart';
import 'auctions/auctions_home.dart';
import 'buy_sell/buy_sell_home.dart';
import 'car_rental/car_rental_home.dart';
import 'delivery/delivery_home.dart';
import 'education/education_home.dart';
import 'food/food_home.dart';
import 'intl_shopping/intl_shopping_home.dart';
import 'investment/investment_home.dart';
import 'jobs/jobs_home.dart';
import 'logistics/logistics_home.dart';
import 'pharmacy/pharmacy_home.dart';
import 'professional/professional_home.dart';
import 'quick_mart/quick_mart_home.dart';
import 'real_estate/real_estate_home.dart';
import 'rides/rides_home.dart';
import 'services/services_home.dart';
import 'stays/stays_home.dart';
import 'subscriptions/subscriptions_home.dart';
import 'travel/travel_home.dart';

Widget buildVerticalHome(Vertical vertical) => switch (vertical.id) {
  VerticalId.intlShopping => const IntlShoppingHome(),
  VerticalId.delivery => const DeliveryHome(),
  VerticalId.quickMart => const QuickMartHome(),
  VerticalId.food => const FoodHome(),
  VerticalId.pharmacy => const PharmacyHome(),
  VerticalId.services => const ServicesHome(),
  VerticalId.buySell => const BuySellHome(),
  VerticalId.professional => const ProfessionalHome(),
  VerticalId.carRental => const CarRentalHome(),
  VerticalId.rides => const RidesHome(),
  VerticalId.logistics => const LogisticsHome(),
  VerticalId.realEstate => const RealEstateHome(),
  VerticalId.stays => const StaysHome(),
  VerticalId.auctions => const AuctionsHome(),
  VerticalId.jobs => const JobsHome(),
  VerticalId.travel => const TravelHome(),
  VerticalId.investment => const InvestmentHome(),
  VerticalId.subscriptions => const SubscriptionsHome(),
  VerticalId.education => const EducationHome(),
};
