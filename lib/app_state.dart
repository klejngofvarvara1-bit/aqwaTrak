import 'package:flutter/foundation.dart';

class AppState {
  // сколько выпито сегодня
  final ValueNotifier<int> currentMl = ValueNotifier<int>(1200);

  // дневная норма
  final ValueNotifier<int> dailyGoalMl = ValueNotifier<int>(2000);

  double get progress {
    final goal = dailyGoalMl.value;
    if (goal <= 0) return 0;
    return (currentMl.value / goal).clamp(0.0, 1.0);
  }

  void addWater(int ml) {
    currentMl.value = (currentMl.value + ml).clamp(0, 100000);
  }

  void setGoal(int ml) {
    dailyGoalMl.value = ml.clamp(500, 6000);
  }
}

final appState = AppState();
