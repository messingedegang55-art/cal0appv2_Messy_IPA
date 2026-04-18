import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cal0appv2/viewModels/usermodel/user_viewmodel.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final userVM = context.watch<UserViewModel>();
    final name = userVM.userName.isNotEmpty ? userVM.userName : 'User';
    final String initial = name[0].toUpperCase();

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      color: const Color.fromARGB(
        255,
        87,
        35,
        176,
      ), // Nice forest green choice for a health app!
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _getDynamicGreeting(), // 3. Extracted logic to keep UI clean
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.white24,
            child: Text(
              initial,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getDynamicGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning,';
    if (hour < 17) return 'Good afternoon,';
    return 'Good evening,';
  }
}
