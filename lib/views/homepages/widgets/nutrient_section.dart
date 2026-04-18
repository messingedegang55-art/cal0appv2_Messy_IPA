import 'package:flutter/material.dart';
import 'package:cal0appv2/theme/app_theme.dart';

class NutrientSection extends StatelessWidget {
  const NutrientSection({super.key});

  @override
  Widget build(BuildContext context) {
    final c = C0Theme.of(context);

    final nutrients = [
      {'label': 'Fibre', 'val': 18, 'max': 25, 'color': c.success},
      {'label': 'Sugar', 'val': 32, 'max': 50, 'color': c.warning},
      {'label': 'Sodium', 'val': 1100, 'max': 2300, 'color': c.slate},
      {'label': 'Calcium', 'val': 620, 'max': 1000, 'color': c.primary},
    ];

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: c.card,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nutrients',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: c.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          ...nutrients.map(
            (n) => _buildRow(
              c,
              n['label'] as String,
              n['val'] as int,
              n['max'] as int,
              n['color'] as Color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(C0Colors c, String label, int val, int max, Color color) {
    final pct = (val / max).clamp(0.0, 1.0);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyle(fontSize: 13, color: c.textPrimary)),
              Text(
                '$val / $max',
                style: TextStyle(fontSize: 12, color: c.textSecondary),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: pct,
              minHeight: 7,
              backgroundColor: color.withOpacity(0.12),
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
