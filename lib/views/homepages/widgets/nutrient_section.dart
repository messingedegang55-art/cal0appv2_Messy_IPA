import 'package:flutter/material.dart';

class NutrientSection extends StatelessWidget {
  const NutrientSection({super.key});

  static const _nutrients = [
    {'label': 'Fibre', 'val': 18, 'max': 25, 'color': Color(0xFF4CAF50)},
    {'label': 'Sugar', 'val': 32, 'max': 50, 'color': Color(0xFFFF5722)},
    {'label': 'Sodium', 'val': 1100, 'max': 2300, 'color': Color(0xFF9C27B0)},
    {'label': 'Calcium', 'val': 620, 'max': 1000, 'color': Color(0xFF00BCD4)},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
          const Text(
            'Nutrients',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xFF1B4332),
            ),
          ),
          const SizedBox(height: 12),
          ..._nutrients.map(
            (n) => _buildRow(
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

  Widget _buildRow(String label, int val, int max, Color color) {
    final pct = (val / max).clamp(0.0, 1.0);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 13, color: Colors.black87),
              ),
              Text(
                '$val / $max',
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
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
