import 'package:flutter/material.dart';

import '../../models/banner.dart';
import '../../models/category.dart';
import '../../models/product.dart';
import '../../models/vertical.dart';
import '../../navigation/app_router.dart';
import '../../theme/app_theme.dart';
import '../../widgets/category_circle_row.dart';
import '../../widgets/countdown_label.dart';
import '../../widgets/hero_banner.dart';
import '../../widgets/map_placeholder.dart';
import '../../widgets/mock_booking_form.dart';
import '../../widgets/product_section.dart';
import '../../widgets/promo_banner_pair.dart';
import '../../widgets/search_bar_widget.dart';
import '../../widgets/section_header.dart';
import '../../widgets/trust_badge_row.dart';
import 'collection_screen.dart';

class VerticalHomeScreen extends StatefulWidget {
  const VerticalHomeScreen({super.key, required this.vertical});
  final Vertical vertical;
  @override
  State<VerticalHomeScreen> createState() => _VerticalHomeScreenState();
}

class _VerticalHomeScreenState extends State<VerticalHomeScreen> {
  String _query = '';
  int _tab = 0;
  final _tracking = TextEditingController();
  final _trackingForm = GlobalKey<FormState>();
  Vertical get vertical => widget.vertical;

  @override
  void dispose() {
    _tracking.dispose();
    super.dispose();
  }

  void _openBanner(BannerData banner) => AppRouter.openProduct(
    context,
    Product(
      id: 'banner-${vertical.id.name}-${banner.title}',
      title: banner.title,
      subtitle: vertical.title,
      price: 'Discover more',
      icon: banner.icon,
      color: banner.color,
      description:
          '${banner.subtitle}\n\nExplore this FixItNow offer in our offline preview. '
          'All offers are illustrative; no real service or transaction is initiated.',
      action: banner.action,
    ),
  );

  void _openCategory(Category category) => AppRouter.openProduct(
    context,
    Product(
      id: 'category-${vertical.id.name}-${category.title}',
      title: category.title,
      subtitle: vertical.title,
      price: 'Explore the collection',
      icon: category.icon,
      color: category.color,
      description:
          'Discover ${category.title.toLowerCase()} selected for you in Riyadh. '
          'This collection is a local UI preview with no live availability.',
      action: 'Explore Now',
    ),
  );

  void _seeAll(HomeSection section) => Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => CollectionScreen(section: section)),
  );

  Widget _search() => SearchBarWidget(
    key: ValueKey('search-${vertical.id.name}'),
    hint: vertical.searchHint,
    onChanged: (value) => setState(() => _query = value.trim().toLowerCase()),
    onFilter: () => AppRouter.openProduct(
      context,
      Product(
        id: 'filters-${vertical.id.name}',
        title: 'Find your perfect match',
        price: 'Local search',
        icon: Icons.tune,
        subtitle: vertical.title,
        description:
            'Use the search field to filter the local catalog by title, '
            'description or location. All search results are stored on your device.',
        action: 'Done',
      ),
    ),
  );

  Widget _tabs() => SizedBox(
    height: 45,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: vertical.tabs.length,
      separatorBuilder: (_, _) => const SizedBox(width: 8),
      itemBuilder: (_, index) => ChoiceChip(
        showCheckmark: false,
        label: Text(
          vertical.tabs[index],
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: _tab == index ? AppTheme.pink : AppTheme.ink,
          ),
        ),
        selected: _tab == index,
        selectedColor: AppTheme.pink.withValues(alpha: .09),
        backgroundColor: Colors.white,
        side: BorderSide(
          color: _tab == index
              ? AppTheme.pink.withValues(alpha: .3)
              : const Color(0xFFE9EDF3),
        ),
        onSelected: (_) {
          setState(() => _tab = index);
          if (vertical.id == VerticalId.jobs && index == 2) {
            AppRouter.openProduct(
              context,
              const Product(
                id: 'post-a-job',
                title: 'Post a Job',
                price: 'Free local preview',
                icon: Icons.post_add,
                description:
                    'Create a sample job listing. '
                    'This offline preview will not publish or send your information.',
                action: 'Post Job',
              ),
            );
          }
        },
      ),
    ),
  );

  Widget _specialCard(
    String title,
    String subtitle,
    IconData icon,
    String action,
  ) => InkWell(
    borderRadius: BorderRadius.circular(12),
    onTap: () => AppRouter.openProduct(
      context,
      Product(
        id: '${vertical.id.name}-$title',
        title: title,
        price: 'Local preview',
        icon: icon,
        description:
            '$subtitle\n\nThis feature is UI-only. '
            'No files, personal details or requests will be uploaded.',
        action: action,
      ),
    ),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F8FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFCEEAF0)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 30, color: const Color(0xFF008EA6)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 10, color: AppTheme.muted),
                ),
                const SizedBox(height: 7),
                Text(
                  '$action \u2192',
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppTheme.pink,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget _trackingCard() => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFFE9F8FA),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Form(
      key: _trackingForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Track Your Shipment',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          ),
          const SizedBox(height: 5),
          const Text(
            'Try any reference to explore a sample tracking status.',
            style: TextStyle(fontSize: 10, color: AppTheme.muted),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _tracking,
            decoration: const InputDecoration(
              hintText: 'e.g. FI123456789',
              hintStyle: TextStyle(fontSize: 12),
            ),
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Enter a tracking number'
                : null,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                if (!_trackingForm.currentState!.validate()) return;
                AppRouter.openProduct(
                  context,
                  Product(
                    id: 'tracking-preview',
                    title: 'Shipment ${_tracking.text.trim()}',
                    price: 'In transit',
                    icon: Icons.local_shipping_outlined,
                    description:
                        'Sample tracking timeline:\nCollected in Riyadh\nSorted at local hub\n'
                        'In transit to destination\n\nThis is mock data, not a live shipment lookup.',
                    action: 'Done',
                  ),
                );
              },
              child: const Text('Track Now'),
            ),
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final id = vertical.id;
    final booking = [
      VerticalId.carRental,
      VerticalId.stays,
      VerticalId.travel,
      VerticalId.logistics,
      VerticalId.rides,
    ].contains(id);
    final results = vertical.sections
        .expand((section) => section.items)
        .where(
          (item) => '${item.title} ${item.subtitle} ${item.description}'
              .toLowerCase()
              .contains(_query),
        )
        .toList();
    final children = <Widget>[
      Row(
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: const BoxDecoration(
              color: AppTheme.pink,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              '${vertical.title.toUpperCase()} / RIYADH',
              style: const TextStyle(
                color: AppTheme.muted,
                fontSize: 8,
                letterSpacing: 1.4,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Text(
            'LOCAL PREVIEW',
            style: TextStyle(
              color: AppTheme.muted,
              fontSize: 7,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
      const SizedBox(height: 14),
      if (vertical.searchFirst) ...[_search(), const SizedBox(height: 16)],
      if (id == VerticalId.rides)
        const MapPlaceholder()
      else
        HeroBanner(
          banner: vertical.hero,
          onTap: () => _openBanner(vertical.hero),
        ),
      if (id == VerticalId.auctions) ...[
        const SizedBox(height: 10),
        const Row(
          children: [
            Text(
              'LIVE NOW  ',
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                color: AppTheme.pink,
              ),
            ),
            CountdownLabel(seconds: 8136),
          ],
        ),
      ],
      const SizedBox(height: 18),
      if (vertical.tabs.isNotEmpty) ...[_tabs(), const SizedBox(height: 12)],
      if (!vertical.searchFirst) ...[_search(), const SizedBox(height: 18)],
      if (booking) ...[
        MockBookingForm(
          key: ValueKey(
            'form-${vertical.id.name}-${vertical.tabs.isEmpty ? '' : vertical.tabs[_tab]}',
          ),
          vertical: id,
          mode: vertical.tabs.isEmpty ? null : vertical.tabs[_tab],
        ),
        const SizedBox(height: 20),
      ],
      if (id == VerticalId.professional) ...[
        _specialCard(
          'Book a Service',
          'Professional help tailored to your needs.',
          Icons.calendar_month_outlined,
          'Book Now',
        ),
        const SizedBox(height: 10),
        _specialCard(
          'Video Consultation',
          'Connect with an expert from anywhere.',
          Icons.videocam_outlined,
          'Book Call',
        ),
        const SizedBox(height: 20),
      ],
      if (id == VerticalId.rides)
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: CategoryCircleRow(
            categories: const [
              Category('Home', Icons.home_outlined),
              Category('Work', Icons.work_outline),
              Category('KAFD', Icons.location_on_outlined),
              Category('Saved Places', Icons.star_outline),
            ],
            onTap: _openCategory,
          ),
        ),
      CategoryCircleRow(categories: vertical.categories, onTap: _openCategory),
      if (id == VerticalId.pharmacy) ...[
        _specialCard(
          'Upload Prescription',
          'Get prescribed medicines from licensed pharmacies. Demo only.',
          Icons.upload_file,
          'Upload Now',
        ),
        const SizedBox(height: 20),
      ],
      if (_query.isNotEmpty) ...[
        SectionHeader(
          title: 'Search results (${results.length})',
          onSeeAll: () => _seeAll(HomeSection('Search results', results)),
        ),
        if (results.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Center(
              child: Text(
                'No matches. Try another local search.',
                style: TextStyle(color: AppTheme.muted),
              ),
            ),
          )
        else
          ProductSection(
            section: HomeSection(
              'Search results',
              results,
              layout: SectionLayout.grid,
            ),
          ),
      ] else ...[
        for (var index = 0; index < vertical.sections.length; index++) ...[
          SectionHeader(
            title: vertical.sections[index].title,
            onSeeAll: () => _seeAll(vertical.sections[index]),
          ),
          ProductSection(section: vertical.sections[index]),
          const SizedBox(height: 20),
          if (index == vertical.promoAfter && vertical.promos.isNotEmpty) ...[
            PromoBannerPair(banners: vertical.promos, onTap: _openBanner),
            const SizedBox(height: 20),
          ],
          if (id == VerticalId.logistics && index == 0) ...[
            _trackingCard(),
            const SizedBox(height: 20),
          ],
        ],
      ],
      const SizedBox(height: 10),
      TrustBadgeRow(labels: vertical.trust),
      const SizedBox(height: 30),
      const Center(
        child: Text(
          'FixItNow',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            fontSize: 22,
            color: Color(0xFFB8C2D1),
          ),
        ),
      ),
      const SizedBox(height: 6),
      const Center(
        child: Text(
          'A little more possible, every day.',
          style: TextStyle(fontSize: 9, color: AppTheme.muted),
        ),
      ),
      const SizedBox(height: 20),
    ];
    return ListView(
      key: PageStorageKey(vertical.id),
      padding: const EdgeInsetsDirectional.fromSTEB(18, 18, 18, 12),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: children,
    );
  }
}
