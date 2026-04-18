import 'package:flutter/material.dart';

class FoodDiary extends StatelessWidget {
  final List foodLogs;
  final VoidCallback onAdd;

  const FoodDiary({super.key, required this.foodLogs, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Food Diary',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xFF1B4332),
                ),
              ),
              TextButton.icon(
                onPressed: onAdd,
                icon: const Icon(Icons.add, size: 16, color: Color(0xFF2D6A4F)),
                label: const Text(
                  'Add',
                  style: TextStyle(color: Color(0xFF2D6A4F), fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          foodLogs.isEmpty
              ? _buildEmpty()
              : Column(
                  children: foodLogs
                      .take(5)
                      .map<Widget>((log) => _buildItem(log))
                      .toList(),
                ),
        ],
      ),
    );
  }

  Widget _buildItem(log) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF0F0F0), width: 1)),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.restaurant,
              size: 18,
              color: Color(0xFF2D6A4F),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  log.foodLogName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  log.foodLogDate.toString().split(' ')[0],
                  style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Text(
            '${log.calorieIntake} kcal',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D6A4F),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmpty() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Column(
          children: [
            Icon(Icons.no_food, size: 40, color: Colors.grey[300]),
            const SizedBox(height: 8),
            Text(
              'No food logged today',
              style: TextStyle(color: Colors.grey[400], fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
