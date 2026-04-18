import 'package:flutter/material.dart';
import 'package:cal0appv2/theme/app_theme.dart';

class DateStrip extends StatelessWidget {
  const DateStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final c = C0Theme.of(context);
    final now = DateTime.now();
    final days = List.generate(7, (i) => now.subtract(Duration(days: 6 - i)));
    final dayLabels = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

    return Container(
      color: c.header,
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
                  color: isToday ? c.textPrimary : c.textSecondary,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isToday ? C0Theme.oatmealWhite : C0Theme.sageGreen,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${d.day}',
                    style: TextStyle(
                      color: isToday ? c.header : c.textSecondary,
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
