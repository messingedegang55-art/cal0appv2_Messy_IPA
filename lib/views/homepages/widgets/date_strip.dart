import 'package:flutter/material.dart';

class DateStrip extends StatelessWidget {
  const DateStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final days = List.generate(7, (i) => now.subtract(Duration(days: 6 - i)));
    final dayLabels = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

    return Container(
      color: const Color.fromARGB(255, 87, 35, 176),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days.map((d) {
          final isToday = d.day == now.day;
          return Column(
            children: [
              Text(
                dayLabels[d.weekday - 1],
                style: TextStyle(
                  color: isToday ? Colors.white : Colors.white54,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isToday ? Colors.white : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${d.day}',
                    style: TextStyle(
                      color: isToday ? const Color(0xFF2D6A4F) : Colors.white70,
                      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
