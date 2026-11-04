import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:newfile/data/mock_catalog.dart';
import 'package:newfile/main.dart';
import 'package:newfile/models/vertical.dart';
import 'package:newfile/navigation/app_router.dart';
import 'package:newfile/navigation/destinations.dart';
import 'package:newfile/screens/shared/vertical_home_screen.dart';
import 'package:newfile/screens/shared/detail_screen.dart';
import 'package:newfile/state/cart_provider.dart';
import 'package:newfile/theme/app_theme.dart';
import 'package:newfile/widgets/product_card.dart';
import 'package:newfile/widgets/vertical_switcher_bar.dart';
import 'package:newfile/widgets/search_bar_widget.dart';

void main() {
  setUpAll(() async {
    final font = FontLoader('Inter')
      ..addFont(rootBundle.load('assets/fonts/Inter.ttf'));
    await font.load();
  });

  test('All 19 catalogs and navigation destinations are complete', () {
    expect(
      verticals.map((vertical) => vertical.id).toSet(),
      VerticalId.values.toSet(),
    );
    final ids = <String>{};
    for (final vertical in verticals) {
      expect(vertical.categories, isNotEmpty);
      expect(vertical.promos, isNotEmpty);
      expect(vertical.sections, isNotEmpty);
      expect(destinationsFor(vertical.id), hasLength(5));
      for (final item in vertical.sections.expand((section) => section.items)) {
        expect(
          ids.add(item.id),
          isTrue,
          reason: 'Duplicate mock id ${item.id}',
        );
        expect(item.title, isNotEmpty);
        expect(item.price, isNotEmpty);
      }
    }
    expect(
      verticals.where((vertical) => vertical.id == VerticalId.subscriptions),
      hasLength(1),
    );
  });

  test('Cart quantities and saves stay local', () {
    final cart = CartProvider();
    final product = verticals.first.sections.first.items.first;
    cart.add(product);
    cart.add(product);
    expect(cart.count, 2);
    expect(cart.quantity(product.id), 2);
    cart.toggleSaved(product.id);
    expect(cart.isSaved(product.id), isTrue);
    cart.toggleSaved(product.id);
    expect(cart.isSaved(product.id), isFalse);
    cart.dispose();
  });

  for (final vertical in verticals) {
    testWidgets('${vertical.title} renders and scrolls without overflow', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
          child: MaterialApp(
            theme: AppTheme.light,
            home: Scaffold(
              body: SafeArea(child: VerticalHomeScreen(vertical: vertical)),
            ),
          ),
        ),
      );
      await tester.pump();
      expect(tester.takeException(), isNull);
      final home = find.byKey(PageStorageKey(vertical.id));
      for (var i = 0; i < 12; i++) {
        await tester.drag(home, const Offset(0, -600));
        await tester.pump(const Duration(milliseconds: 220));
        expect(
          tester.takeException(),
          isNull,
          reason: '${vertical.title} scroll $i',
        );
      }
      await tester.pumpWidget(const SizedBox());
    });
  }

  testWidgets('Shared shell persists through details, cart and tabs', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const FixItNowApp());
    await tester.pumpAndSettle();
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text('SAR 1,250.00'), findsOneWidget);

    final product = verticals.first.sections.first.items.first;
    final card = find.byWidgetPredicate(
      (widget) => widget is ProductCard && widget.product.id == product.id,
    );
    await tester.scrollUntilVisible(
      card,
      250,
      scrollable: find
          .descendant(
            of: find.byKey(PageStorageKey(VerticalId.intlShopping)),
            matching: find.byType(Scrollable),
          )
          .first,
    );
    await tester.ensureVisible(find.byKey(ValueKey('add-${product.id}')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey('add-${product.id}')));
    await tester.pump();
    final context = tester.element(card);
    expect(context.read<CartProvider>().count, 1);
    AppRouter.openProduct(context, product);
    await tester.pumpAndSettle();
    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.text('SAR 1,250.00'), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    await tester.scrollUntilVisible(
      find.byKey(const ValueKey('detail-primary-action')),
      200,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('detail-primary-action')));
    await tester.pumpAndSettle();
    expect(context.read<CartProvider>().count, 2);
    expect(find.text('Added - offline demo only'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Back'),
      -250,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();
    expect(find.text('Coming soon'), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    await tester.tap(find.text('Back'));
    await tester.pumpAndSettle();
    expect(find.byKey(PageStorageKey(VerticalId.intlShopping)), findsOneWidget);
  });

  testWidgets('Switcher changes home and bottom navigation', (tester) async {
    await tester.pumpWidget(const FixItNowApp());
    await tester.pumpAndSettle();
    final switcher = find.byKey(const ValueKey('vertical-delivery'));
    await tester.tap(switcher);
    await tester.pumpAndSettle();
    expect(find.byKey(PageStorageKey(VerticalId.delivery)), findsOneWidget);
    final horizontal = find
        .descendant(
          of: find.byType(VerticalSwitcherBar),
          matching: find.byType(Scrollable),
        )
        .first;
    await tester.scrollUntilVisible(
      find.byKey(const ValueKey('vertical-education')),
      400,
      scrollable: horizontal,
    );
    await tester.tap(find.byKey(const ValueKey('vertical-education')));
    await tester.pumpAndSettle();
    expect(find.byKey(PageStorageKey(VerticalId.education)), findsOneWidget);
    expect(find.text('My Learning'), findsOneWidget);
  });

  testWidgets('Local search handles empty results and banner opens details', (
    tester,
  ) async {
    await tester.pumpWidget(const FixItNowApp());
    await tester.pumpAndSettle();
    final search = find.descendant(
      of: find.byType(SearchBarWidget),
      matching: find.byType(TextField),
    );
    await tester.enterText(search, 'no-such-item-12345');
    await tester.pumpAndSettle();
    final scroll = find
        .descendant(
          of: find.byKey(PageStorageKey(VerticalId.intlShopping)),
          matching: find.byType(Scrollable),
        )
        .first;
    await tester.scrollUntilVisible(
      find.text('No matches. Try another local search.'),
      250,
      scrollable: scroll,
    );
    expect(find.text('Search results (0)'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text(verticals.first.hero.title),
      -250,
      scrollable: scroll,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text(verticals.first.hero.title));
    await tester.pumpAndSettle();
    expect(find.byType(DetailScreen), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('RTL shell remains usable at narrow phone width', (tester) async {
    tester.view.physicalSize = const Size(320, 780);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    tester.platformDispatcher.localesTestValue = const [Locale('ar')];
    addTearDown(tester.platformDispatcher.clearLocalesTestValue);
    await tester.pumpWidget(const FixItNowApp());
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.text('SAR 1,250.00'), findsOneWidget);
    expect(
      Directionality.of(tester.element(find.byType(BottomNavigationBar))),
      TextDirection.rtl,
    );
  });
}
