import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cal0appv2/views/homepages/widgets/macro_row.dart';
import 'package:cal0appv2/views/homepages/widgets/food_diary.dart';
import 'package:cal0appv2/views/homepages/widgets/date_strip.dart';
import 'package:cal0appv2/views/homepages/widgets/calorie_ring.dart';
import 'package:cal0appv2/viewModels/dashboard/dashboard_viewmodel.dart';
import 'package:cal0appv2/views/homepages/widgets/dashboard_header.dart';
import 'package:cal0appv2/views/homepages/widgets/nutrient_section.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  @override
  void initState() {
    super.initState();
    final uid = FirebaseAuth.instance.currentUser!.uid;
    Future.microtask(
      () => Provider.of<DashboardViewModel>(
        context,
        listen: false,
      ).loadDashboard(uid),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<DashboardViewModel>(context);
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 87, 35, 176),
      body: SafeArea(
        child: vm.isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xFF2D6A4F)),
              )
            : vm.errorMessage !=
                  null //error check on dashboard load
            ? Center(child: Text(vm.errorMessage!))
            : RefreshIndicator(
                color: const Color(0xFF2D6A4F),
                onRefresh: () => vm.loadDashboard(uid),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DashboardHeader(),
                      const DateStrip(),
                      CalorieRing(totalCalories: vm.totalCalories),
                      MacroRow(foodLogs: vm.foodLogs),
                      const NutrientSection(),
                      FoodDiary(
                        foodLogs: vm
                            .foodLogs, // currently foodlogs are empty, need to implement food log fetching in dashboard viewmodel
                        onAdd: () {},
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
