import 'package:flutter/material.dart';

import '../models/vertical.dart';

class AppDestination {
  const AppDestination(
    this.title,
    this.icon, {
    this.centerAction = false,
    this.cart = false,
  });
  final String title;
  final IconData icon;
  final bool centerAction, cart;
}

List<AppDestination> destinationsFor(VerticalId id) {
  const home = AppDestination('Home', Icons.home_rounded);
  const search = AppDestination('Search', Icons.search_rounded);
  const explore = AppDestination('Explore', Icons.travel_explore_rounded);
  const profile = AppDestination('Profile', Icons.person_outline_rounded);
  const messages = AppDestination(
    'Messages',
    Icons.chat_bubble_outline_rounded,
  );
  const bookings = AppDestination('Bookings', Icons.event_available_outlined);
  final middle = switch (id) {
    VerticalId.intlShopping ||
    VerticalId.delivery ||
    VerticalId.quickMart ||
    VerticalId.food ||
    VerticalId.pharmacy => const [
      AppDestination('Categories', Icons.grid_view_rounded),
      AppDestination('Cart', Icons.shopping_cart_outlined, cart: true),
      AppDestination('Orders', Icons.inventory_2_outlined),
    ],
    VerticalId.services ||
    VerticalId.professional ||
    VerticalId.carRental => const [search, bookings, messages],
    VerticalId.realEstate => const [
      search,
      AppDestination('List Property', Icons.add_home_outlined),
      messages,
    ],
    VerticalId.travel => const [
      search,
      AppDestination('My Trips', Icons.luggage_outlined),
      messages,
    ],
    VerticalId.buySell => const [
      AppDestination('Categories', Icons.grid_view_rounded),
      AppDestination('Sell', Icons.add, centerAction: true),
      messages,
    ],
    VerticalId.jobs => const [
      AppDestination('Jobs', Icons.work_outline_rounded),
      AppDestination('Post Job', Icons.add, centerAction: true),
      messages,
    ],
    VerticalId.auctions => const [
      AppDestination('Auctions', Icons.gavel_rounded),
      AppDestination('Sell', Icons.add_circle_outline),
      AppDestination('My Bids', Icons.history_rounded),
    ],
    VerticalId.stays => const [
      explore,
      AppDestination('Saved', Icons.favorite_border),
      bookings,
    ],
    VerticalId.rides => const [
      search,
      AppDestination('Rides', Icons.local_taxi_outlined),
      AppDestination('Payments', Icons.credit_card),
    ],
    VerticalId.logistics => const [
      AppDestination('Ship', Icons.inventory_2_outlined),
      AppDestination('New Shipment', Icons.add, centerAction: true),
      AppDestination('Tracking', Icons.receipt_long_outlined),
    ],
    VerticalId.investment => const [
      explore,
      AppDestination('Portfolio', Icons.pie_chart_outline),
      messages,
    ],
    VerticalId.subscriptions => const [
      explore,
      AppDestination('My Subscriptions', Icons.card_membership),
      AppDestination('Saved', Icons.favorite_border),
    ],
    VerticalId.education => const [
      explore,
      AppDestination('My Learning', Icons.school_outlined),
      AppDestination('Saved', Icons.bookmark_border),
    ],
  };
  return [home, ...middle, profile];
}
