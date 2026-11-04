import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CountdownLabel extends StatefulWidget {
  const CountdownLabel({super.key, required this.seconds});
  final int seconds;
  @override
  State<CountdownLabel> createState() => _CountdownLabelState();
}

class _CountdownLabelState extends State<CountdownLabel> {
  late final DateTime _end = DateTime.now().add(
    Duration(seconds: widget.seconds),
  );
  Timer? _timer;
  int get _remaining =>
      _end.difference(DateTime.now()).inSeconds.clamp(0, widget.seconds);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
      if (_remaining == 0) _timer?.cancel();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final time = _remaining;
    final label = time == 0
        ? 'Auction ended'
        : '${(time ~/ 3600).toString().padLeft(2, '0')} : '
              '${(time ~/ 60 % 60).toString().padLeft(2, '0')} : '
              '${(time % 60).toString().padLeft(2, '0')}';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.pink,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 9,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
