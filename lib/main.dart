import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Layout/home_screen.dart';
import 'Provider/my_provider.dart';
import 'pref_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  PrefsHelper.prefs = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
      create: (context) =>
      MyProvider()
        ..init(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) =>
          MaterialApp(
            locale: const Locale("en"),
            debugShowCheckedModeBanner: false,
            initialRoute: HomeScreen.routeName,
            routes: {
              // SplashScreen.routeName: (context) => const SplashScreen(),
              HomeScreen.routeName: (context) => const HomeScreen(),
            },
          ),
    );
  }
}
