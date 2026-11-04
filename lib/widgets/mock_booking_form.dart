import 'package:flutter/material.dart';

import '../models/product.dart';
import '../models/vertical.dart';
import '../navigation/app_router.dart';
import '../theme/app_theme.dart';

class MockBookingForm extends StatefulWidget {
  const MockBookingForm({super.key, required this.vertical, this.mode});
  final VerticalId vertical;
  final String? mode;
  @override
  State<MockBookingForm> createState() => _MockBookingFormState();
}

class _MockBookingFormState extends State<MockBookingForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _values = {};
  String _trip = 'One Way';

  List<(String, String, IconData)> get _fields => switch (widget.vertical) {
    VerticalId.carRental => [
      ('Pickup location', 'Riyadh', Icons.location_on_outlined),
      ('Drop-off location', 'Same as pickup', Icons.location_on_outlined),
      ('Pickup date', '12 Dec 2026', Icons.calendar_today_outlined),
      ('Drop-off date', '14 Dec 2026', Icons.calendar_today_outlined),
      ('Pickup time', '10:00 AM', Icons.schedule),
      ('Drop-off time', '10:00 AM', Icons.schedule),
    ],
    VerticalId.stays => [
      ('Where are you going?', 'Riyadh', Icons.location_on_outlined),
      ('Guests & rooms', '2 guests, 1 room', Icons.people_outline),
      ('Check-in', '12 Dec 2026', Icons.calendar_today_outlined),
      ('Check-out', '15 Dec 2026', Icons.calendar_today_outlined),
    ],
    VerticalId.logistics => [
      ('From', 'Riyadh', Icons.location_on_outlined),
      ('To', 'Dubai', Icons.public),
      ('Weight (kg)', '5', Icons.scale_outlined),
      ('Package type', 'Personal cargo', Icons.inventory_2_outlined),
    ],
    VerticalId.rides => [
      ('Pickup location', 'Al Olaya, Riyadh', Icons.my_location),
      ('Where to?', 'King Abdullah Financial District', Icons.location_on),
    ],
    _ => switch (widget.mode) {
      'Hotels' => [
        ('Destination', 'Jeddah', Icons.hotel_outlined),
        ('Guests', '2 adults', Icons.people_outline),
        ('Check-in', '12 Dec 2026', Icons.calendar_today_outlined),
        ('Check-out', '18 Dec 2026', Icons.calendar_today_outlined),
      ],
      'Visa' || 'Insurance' => [
        ('Destination', 'United Arab Emirates', Icons.public),
        ('Travelers', '1 adult', Icons.person_outline),
        ('Travel date', '12 Dec 2026', Icons.calendar_today_outlined),
        ('Duration (days)', '7', Icons.schedule),
      ],
      _ => [
        ('From', 'Riyadh (RUH)', Icons.flight_takeoff),
        ('To', 'Dubai (DXB)', Icons.flight_land),
        ('Depart date', '12 Dec 2026', Icons.calendar_today_outlined),
        if (_trip == 'Round Trip')
          ('Return date', '18 Dec 2026', Icons.calendar_today_outlined),
        if (_trip == 'Multi-City')
          ('Next destination', 'Jeddah (JED)', Icons.add_location_alt_outlined),
        ('Passengers', '1 adult, economy', Icons.people_outline),
      ],
    },
  };

  String get _action => switch (widget.vertical) {
    VerticalId.carRental => 'Search Cars',
    VerticalId.stays => 'Search Stays',
    VerticalId.logistics => 'Check Rate',
    VerticalId.rides => 'Find a Ride',
    _ => 'Search ${widget.mode ?? 'Flights'}',
  };

  Future<void> _selectDate(
    String label,
    TextEditingController controller,
  ) async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now.add(const Duration(days: 1)),
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(now.year + 3),
    );
    if (date != null && mounted) {
      final formatted = '${date.day}/${date.month}/${date.year}';
      controller.text = formatted;
      _values[label] = formatted;
    }
  }

  @override
  Widget build(BuildContext context) {
    final fields = _fields;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE9EDF3)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.navy.withValues(alpha: .03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.vertical == VerticalId.logistics
                  ? 'Get an Instant Rate'
                  : widget.vertical == VerticalId.rides
                  ? 'Your next stop starts here'
                  : widget.vertical == VerticalId.stays
                  ? 'Find your perfect stay'
                  : widget.vertical == VerticalId.carRental
                  ? 'Let\u2019s get you on the road'
                  : 'Plan your next journey',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            ),
            const SizedBox(height: 5),
            const Text(
              'Explore with sample details. No booking is made.',
              style: TextStyle(color: AppTheme.muted, fontSize: 9),
            ),
            if (widget.vertical == VerticalId.travel &&
                (widget.mode == null || widget.mode == 'Flights'))
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ['One Way', 'Round Trip', 'Multi-City']
                      .map(
                        (trip) => Padding(
                          padding: const EdgeInsetsDirectional.only(
                            end: 7,
                            top: 8,
                          ),
                          child: ChoiceChip(
                            label: Text(
                              trip,
                              style: const TextStyle(fontSize: 10),
                            ),
                            selected: _trip == trip,
                            onSelected: (_) => setState(() => _trip = trip),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            const SizedBox(height: 14),
            LayoutBuilder(
              builder: (context, constraints) => Wrap(
                spacing: 10,
                runSpacing: 10,
                children: fields
                    .map(
                      (field) => SizedBox(
                        width: constraints.maxWidth < 300
                            ? constraints.maxWidth
                            : (constraints.maxWidth - 10) / 2,
                        child: _BookingField(
                          key: ValueKey('${widget.mode}-${field.$1}'),
                          label: field.$1,
                          value: _values[field.$1] ?? field.$2,
                          icon: field.$3,
                          onChanged: (value) => _values[field.$1] = value,
                          onDate: field.$3 == Icons.calendar_today_outlined
                              ? (controller) =>
                                    _selectDate(field.$1, controller)
                              : null,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  final description = fields
                      .map(
                        (field) =>
                            '${field.$1}: ${_values[field.$1] ?? field.$2}',
                      )
                      .join('\n');
                  AppRouter.openProduct(
                    context,
                    Product(
                      id: 'form-${widget.vertical.name}',
                      title: _action,
                      price: widget.vertical == VerticalId.logistics
                          ? 'Estimated SAR 125'
                          : 'Explore available options',
                      icon: widget.vertical == VerticalId.rides
                          ? Icons.local_taxi
                          : Icons.travel_explore,
                      subtitle: widget.mode ?? 'FixItNow local preview',
                      description:
                          '$description\n\nSample results only. Availability, rates and reservations are not live.',
                      action: 'Done',
                    ),
                  );
                },
                icon: const Icon(Icons.search, size: 17),
                label: Text(_action),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookingField extends StatefulWidget {
  const _BookingField({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.onChanged,
    this.onDate,
  });
  final String label, value;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final void Function(TextEditingController)? onDate;
  @override
  State<_BookingField> createState() => _BookingFieldState();
}

class _BookingFieldState extends State<_BookingField> {
  late final _controller = TextEditingController(text: widget.value);
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: _controller,
    onChanged: widget.onChanged,
    readOnly: widget.onDate != null,
    onTap: widget.onDate == null ? null : () => widget.onDate!(_controller),
    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
    validator: (value) => value == null || value.trim().isEmpty
        ? 'Required'
        : widget.label == 'Weight (kg)' &&
              (double.tryParse(value) == null || double.parse(value) <= 0)
        ? 'Enter a positive weight'
        : null,
    decoration: InputDecoration(
      labelText: widget.label,
      labelStyle: const TextStyle(fontSize: 10, color: AppTheme.muted),
      prefixIcon: Icon(widget.icon, size: 17),
      prefixIconConstraints: const BoxConstraints(minWidth: 33),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    ),
  );
}
