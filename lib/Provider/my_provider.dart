import 'package:flutter/material.dart';

import '../pref_helper.dart';

class MyProvider extends ChangeNotifier{
  String stepsCounter="6000";

  void init()async{
    String? steps= PrefsHelper.getSteps();
    changeSteps(steps??"6000");
  }

  void changeSteps(String steps){
    stepsCounter=steps;
    PrefsHelper.saveSteps(steps);
    notifyListeners();
  }
}