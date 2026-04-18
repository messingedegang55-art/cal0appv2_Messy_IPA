import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CalorieRing extends StatelessWidget {
  final int totalCalories;
  final double target;
  final double burned;

  const CalorieRing({
    super.key,
    required this.totalCalories,
    this.target = 2000, // swap with vm.calorieTarget later
    this.burned = 350, // swap with vm.caloriesBurned later
  });

  @override
  Widget build(BuildContext context) {
    final consumed = totalCalories.toDouble();
    final remaining = (target - consumed + burned).clamp(0, target);
    final progress = (consumed / target).clamp(0.0, 1.0);

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Calories',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF2D6A4F),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 180,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    startDegreeOffset: -90,
                    sectionsSpace: 0,
                    centerSpaceRadius: 65,
                    sections: [
                      PieChartSectionData(
                        value: progress,
                        color: const Color(0xFF2D6A4F),
                        radius: 18,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        value: 1 - progress,
                        color: const Color(0xFFE8F5E9),
                        radius: 18,
                        showTitle: false,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${remaining.toInt()}',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B4332),
                      ),
                    ),
                    const Text(
                      'kcal left',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStat(
                'Eaten',
                '${consumed.toInt()}',
                const Color(0xFF2D6A4F),
              ),
              _buildStat(
                'Burned',
                '${burned.toInt()}',
                const Color(0xFFE76F51),
              ),
              _buildStat('Goal', '${target.toInt()}', const Color(0xFF457B9D)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: color,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
