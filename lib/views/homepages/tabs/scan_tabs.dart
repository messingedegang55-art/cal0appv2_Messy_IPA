import 'package:flutter/material.dart';
import 'package:cal0appv2/theme/app_theme.dart';

class ScanTab extends StatelessWidget {
  const ScanTab({super.key});

  @override
  Widget build(BuildContext context) {
    // final c = C0Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanner'),
        backgroundColor: C0Theme.charcoal,
        foregroundColor: C0Theme.oatmealWhite,
      ),
      body: const Center(child: Text('Scanner coming soon')),
    );
  }
}
