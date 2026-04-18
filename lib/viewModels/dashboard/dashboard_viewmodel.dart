import 'package:flutter/material.dart';
import 'package:cal0appv2/models/dashboard_model.dart';
import 'package:cal0appv2/models/foodlog_model.dart';
import 'package:cal0appv2/services/logs/foodlog_services.dart';
import 'package:cal0appv2/services/users/user_service.dart';

class DashboardViewModel extends ChangeNotifier {
  final FoodLogService _foodLogService = FoodLogService();
  final UserService _userService = UserService();

  DashboardModel? _dashboard;
  List<FoodLogModel> _foodLogs = [];
  bool isLoading = false;
  String? errorMessage;
  String _filter = 'daily'; // daily, monthly, yearly

  DashboardModel? get dashboard => _dashboard;
  List<FoodLogModel> get foodLogs => _foodLogs;
  String get filter => _filter;

  // int get totalCalories =>
  //     _foodLogs.fold(0, (sum, log) => sum + int.tryParse(log.calorieIntake)!);

  //add safe getter to show empty list if food logs are not loaded yet
  int get totalCalories {
    if (_foodLogs.isEmpty) return 0;
    return _foodLogs.fold(
      0,
      (sum, log) => sum + (int.tryParse(log.calorieIntake) ?? 0),
    );
  }

  double get totalProtein => _foodLogs.fold(0.0, (sum, log) => sum);

  void setFilter(String value) {
    _filter = value;
    notifyListeners();
  }

  Future<void> loadDashboard(String userId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      _foodLogs = await _foodLogService.getFoodLogs(userId);
    } catch (e) {
      errorMessage = e.toString();
      _foodLogs = [];
      isLoading = false;
      notifyListeners();
      return;
    }
    _dashboard = DashboardModel(
      analysisResult: '',
      nutrientStatus: _getNutrientStatus(),
      userId: userId,
      foodLog: '',
      scanLog: '',
      totalCalories: totalCalories,
      recentFoodLogs: _foodLogs.take(5).toList(),
      recentSupplements: [],
    );
    isLoading = false;
    notifyListeners();
  }

  String _getNutrientStatus() {
    if (totalCalories == 0) return 'No data';
    if (totalCalories < 1200) return 'Under target';
    if (totalCalories > 3000) return 'Over target';
    return 'On track';
  }

  Future<void> refreshDashboard(String userId) => loadDashboard(userId);
}
