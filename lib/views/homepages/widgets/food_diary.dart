import 'package:flutter/material.dart';
import 'package:cal0appv2/theme/app_theme.dart';

class FoodDiary extends StatelessWidget {
  final List<dynamic> foodLogs;
  final VoidCallback onAdd;

  const FoodDiary({super.key, required this.foodLogs, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    final c = C0Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Food Diary',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: c.textPrimary,
                ),
              ),
              TextButton.icon(
                onPressed: onAdd,
                icon: Icon(Icons.add, size: 16, color: c.primary),
                label: Text(
                  'Add',
                  style: TextStyle(color: c.primary, fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          foodLogs.isEmpty
              ? _buildEmpty(c)
              : Column(
                  children: foodLogs
                      .take(5)
                      .map<Widget>((log) => _buildItem(log, c))
                      .toList(),
                ),
        ],
      ),
    );
  }

  Widget _buildItem(dynamic log, C0Colors c) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: c.track, width: 1)),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: c.track,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.restaurant, size: 18, color: c.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  log.foodLogName,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: c.textPrimary,
                  ),
                ),
                Text(
                  log.foodLogDate.toString().split(' ')[0],
                  style: TextStyle(fontSize: 11, color: c.textSecondary),
                ),
              ],
            ),
          ),
          Text(
            '${log.calorieIntake} kcal',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: c.primary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmpty(C0Colors c) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Column(
          children: [
            Icon(Icons.no_food, size: 40, color: c.textSecondary),
            const SizedBox(height: 8),
            Text(
              'No food logged today',
              style: TextStyle(color: c.textSecondary, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
