import 'package:flutter/material.dart';
import '../pref_helper.dart';

class MyProvider extends ChangeNotifier {
  String stepsCounter = "6000";
  int waterHeight = 0;
  int mlDrunk = 0;

  void init() async {
    String? steps = PrefsHelper.getSteps();
    changeSteps(steps ?? "6000");

    int? waterHeight = PrefsHelper.getWaterHeight();
    int? amountOfWaterDrunk = PrefsHelper.getMLDrunk();
    changeWaterHeight(waterHeight ?? 0, amountOfWaterDrunk ?? 0);
  }

  void changeSteps(String steps) {
    stepsCounter = steps;
    PrefsHelper.saveSteps(steps);
    notifyListeners();
  }

  void changeWaterHeight(int num, int ml) {
    waterHeight += num;
    mlDrunk += ml;
    PrefsHelper.saveWaterHeight(waterHeight);
    PrefsHelper.saveMLDrunk(mlDrunk);
    notifyListeners();
  }
}
