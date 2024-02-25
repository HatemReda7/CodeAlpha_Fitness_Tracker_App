import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
  static late SharedPreferences prefs;

  static String? getSteps(){
    return prefs.getString("Steps");
  }

  static saveSteps(String steps)async{
    await prefs.setString("Steps", steps);
  }
}