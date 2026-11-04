import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/vertical.dart';

const investmentData = Vertical(
  id: VerticalId.investment,
  title: 'Investment & Finance',
  icon: Icons.trending_up,
  searchHint: 'Search markets, opportunities and tools',
  hero: BannerData(
    title: 'Explore your financial future',
    subtitle: 'Learn about markets and compare illustrative opportunities.',
    icon: Icons.insights,
    action: 'Explore Opportunities',
  ),
  categories: [
    Category('Stocks', Icons.show_chart),
    Category('Funds', Icons.pie_chart),
    Category('Real Estate', Icons.apartment),
    Category('Gold', Icons.diamond),
    Category('Sukuk', Icons.account_balance),
  ],
  sections: [
    HomeSection('Market Overview', [
      Product(
        id: 'invest-market-tasi',
        title: 'TASI',
        price: '12,184.62',
        icon: Icons.show_chart,
        subtitle: 'Saudi equity index · Demo snapshot',
        meta: '+0.82%',
        color: Color(0xFF16805A),
      ),
      Product(
        id: 'invest-market-sp500',
        title: 'S&P 500',
        price: '5,842.47',
        icon: Icons.stacked_line_chart,
        subtitle: 'US equity index · Demo snapshot',
        meta: '+0.45%',
        color: Color(0xFF16805A),
      ),
      Product(
        id: 'invest-market-gold',
        title: 'Gold / oz',
        price: 'USD 2,648.30',
        icon: Icons.diamond,
        subtitle: 'Spot gold · Demo snapshot',
        meta: '-0.18%',
        color: Color(0xFFA73D50),
      ),
      Product(
        id: 'invest-market-brent',
        title: 'Brent Crude',
        price: 'USD 74.52',
        icon: Icons.water_drop,
        subtitle: 'Per barrel · Demo snapshot',
        meta: '+1.12%',
        color: Color(0xFF16805A),
      ),
    ], layout: SectionLayout.markets),
    HomeSection('Featured Investment Opportunities', [
      Product(
        id: 'invest-growth-fund',
        title: 'Saudi Equity Growth Fund',
        price: 'Min. SAR 1,000',
        icon: Icons.trending_up,
        subtitle: 'Illustrative diversified equity fund',
        badge: 'Long-term focus',
        meta: 'Higher risk · Capital at risk',
        action: 'Explore Opportunity',
      ),
      Product(
        id: 'invest-property-fund',
        title: 'Commercial Property Income',
        price: 'Min. SAR 5,000',
        icon: Icons.business,
        subtitle: 'Illustrative real estate fund',
        meta: 'Medium-high risk · Not guaranteed',
        action: 'Explore Opportunity',
      ),
      Product(
        id: 'invest-sukuk',
        title: 'Diversified Sukuk Portfolio',
        price: 'Min. SAR 500',
        icon: Icons.account_balance,
        subtitle: 'Illustrative fixed-income allocation',
        meta: 'Moderate risk · Capital at risk',
        action: 'Explore Opportunity',
      ),
    ]),
    HomeSection('Top Investment Options', [
      Product(
        id: 'invest-index',
        title: 'Global Index Investing',
        price: 'Explore diversification',
        icon: Icons.public,
        subtitle: 'Learn about broad-market index exposure',
        meta: 'Educational overview · Market risk',
      ),
      Product(
        id: 'invest-gold-option',
        title: 'Gold Investment Options',
        price: 'Explore precious metals',
        icon: Icons.diamond,
        subtitle: 'Compare physical and fund-based exposure',
        meta: 'Educational overview · Price volatility',
      ),
    ]),
    HomeSection('Investment Tools', [
      Product(
        id: 'invest-calculator',
        title: 'Compound Growth Guide',
        price: 'Free learning resource',
        icon: Icons.calculate,
        subtitle: 'Understand time, contributions and growth',
        meta: 'Illustrative examples only',
        action: 'View Guide',
      ),
      Product(
        id: 'invest-risk',
        title: 'Understanding Your Risk Profile',
        price: 'Free learning resource',
        icon: Icons.balance,
        subtitle: 'Explore goals, time horizon and risk',
        meta: 'Not personalized financial advice',
        action: 'View Guide',
      ),
    ], layout: SectionLayout.tiles),
    HomeSection('Why Invest with FixItNow?', [
      Product(
        id: 'invest-clarity',
        title: 'Clarity Before Commitment',
        price: 'Learn first',
        icon: Icons.menu_book,
        subtitle: 'Review fees, risks and key considerations',
        meta: 'Educational demo · No trades executed',
      ),
      Product(
        id: 'invest-choice',
        title: 'Compare Your Options',
        price: 'Explore thoughtfully',
        icon: Icons.compare_arrows,
        subtitle: 'Understand different asset classes',
        meta: 'Returns are never guaranteed',
      ),
    ], layout: SectionLayout.tiles),
  ],
  promos: [
    BannerData(
      title: 'Build a Thoughtful Financial Plan',
      subtitle:
          'Explore budgeting and diversification basics. Not financial advice.',
      icon: Icons.account_balance_wallet,
      action: 'Discover Planning Guides',
    ),
    BannerData(
      title: 'Knowledge is your first investment',
      subtitle: 'Explore beginner-friendly guides before making decisions.',
      icon: Icons.school,
      action: 'Explore Learning',
    ),
  ],
  trust: [
    'Illustrative data, not live prices',
    'Capital at risk',
    'Not financial advice',
  ],
);
