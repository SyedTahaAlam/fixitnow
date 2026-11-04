import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:newfile/models/vertical.dart';
import 'package:newfile/navigation/app_router.dart';
import 'package:newfile/state/cart_provider.dart';
import 'package:newfile/theme/app_theme.dart';
import 'package:newfile/widgets/mock_booking_form.dart';
import 'package:newfile/widgets/app_header.dart';

Widget formApp(VerticalId vertical, {String? mode}) => ChangeNotifierProvider(
  create: (_) => CartProvider(),
  child: MaterialApp(
    theme: AppTheme.light,
    onGenerateRoute: (settings) => AppRouter.generate(
      settings,
      MockBookingForm(vertical: vertical, mode: mode),
    ),
    builder: (context, navigator) => Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(height: 900, child: navigator),
        ),
      ),
    ),
  ),
);

void main() {
  setUpAll(() async {
    final font = FontLoader('Inter')
      ..addFont(rootBundle.load('assets/fonts/Inter.ttf'));
    await font.load();
  });

  testWidgets('Header fits a narrow RTL phone', (tester) async {
    tester.view.physicalSize = const Size(320, 780);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: AppHeader(onOpen: (_, _) {}),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  testWidgets('Rate form rejects invalid weight and shows local result', (
    tester,
  ) async {
    await tester.pumpWidget(formApp(VerticalId.logistics));
    await tester.pumpAndSettle();
    final weight = find.widgetWithText(TextFormField, 'Weight (kg)');
    await tester.enterText(weight, '-3');
    await tester.tap(find.text('Check Rate'));
    await tester.pumpAndSettle();
    expect(find.text('Enter a positive weight'), findsOneWidget);
    await tester.enterText(weight, '8');
    await tester.tap(find.text('Check Rate'));
    await tester.pumpAndSettle();
    expect(find.text('Estimated SAR 125'), findsOneWidget);
    expect(find.textContaining('Weight (kg): 8'), findsOneWidget);
  });

  testWidgets('Flight trip modes change form fields', (tester) async {
    await tester.pumpWidget(formApp(VerticalId.travel, mode: 'Flights'));
    await tester.pumpAndSettle();
    expect(find.text('Return date'), findsNothing);
    await tester.tap(find.text('Round Trip'));
    await tester.pumpAndSettle();
    expect(find.text('Return date'), findsOneWidget);
    await tester.tap(find.text('Multi-City'));
    await tester.pumpAndSettle();
    expect(find.text('Next destination'), findsOneWidget);
    expect(find.text('Return date'), findsNothing);
  });

  testWidgets('Date field opens local date picker', (tester) async {
    await tester.pumpWidget(formApp(VerticalId.stays));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(TextFormField, 'Check-in'));
    await tester.pumpAndSettle();
    expect(find.byType(DatePickerDialog), findsOneWidget);
  });
}
