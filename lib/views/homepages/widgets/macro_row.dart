import 'package:flutter/material.dart';

class MacroRow extends StatelessWidget {
  final List<dynamic> foodLogs;

  const MacroRow({super.key, required this.foodLogs});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildMacroCard('Protein', 82, 150, const Color(0xFF2196F3)),
          const SizedBox(width: 10),
          _buildMacroCard('Carbs', 145, 250, const Color(0xFFFF9800)),
          const SizedBox(width: 10),
          _buildMacroCard('Fat', 44, 65, const Color(0xFFE91E63)),
        ],
      ),
    );
  }

  Widget _buildMacroCard(String label, int current, int target, Color color) {
    final pct = (current / target).clamp(0.0, 1.0);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
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
              label,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${current}g',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: pct,
                minHeight: 6,
                backgroundColor: color.withOpacity(0.15),
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '/ ${target}g',
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
