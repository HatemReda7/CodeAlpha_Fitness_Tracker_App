import 'package:animations/animations.dart';
import 'package:codealpha_fitness_tracker_app/Shared/Styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../Provider/my_provider.dart';
import '../Screens/Drawer Tab/drawer_tab.dart';
import '../Screens/Meal Tracker Screen/meal_tracker_screen.dart';
import '../Screens/Step Tracking Screen/steps_tracker_screen.dart';
import '../Screens/Workout History Screen/workout_history_screen.dart';
import '../Screens/Workout Screen/workout_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Scaffold(
      drawer: const DrawerTab(),
      appBar: AppBar(
        title: const Text(
          "Fitness Tracker",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OpenContainer(
              closedElevation: 0,
              closedBuilder: (context, action) => Container(
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                height: 80.h,
                child: Text(
                  "2041 / ${pro.stepsCounter} steps",
                  style: mediumText2,
                ),
              ),
              openBuilder: (context, action) => const StepsDetailsScreen(),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OpenContainer(
                    closedElevation: 0,
                    closedBuilder: (context, action) => Container(
                          height: 100.h,
                          width: 150.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Text(
                            "Meal",
                            style: mediumText2,
                          ),
                        ),
                    openBuilder: (context, action) =>
                        const MealTrackerScreen()),
                Container(
                  height: 100.h,
                  width: 150.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: Text(
                    "Water",
                    style: mediumText2,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              height: 80.h,
              child: Text(
                "BPM",
                style: mediumText2,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OpenContainer(
                    closedElevation: 0,
                    closedBuilder: (context, action) => Container(
                          height: 100.h,
                          width: 150.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Text(
                            "Workout",
                            style: mediumText2,
                          ),
                        ),
                    openBuilder: (context, action) => const WorkoutScreen()),
                OpenContainer(
                    closedElevation: 0,
                    closedBuilder: (context, action) => Container(
                          height: 100.h,
                          width: 150.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(16.r)),
                          child: Text(
                            "Workout History",
                            style: mediumText2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                    openBuilder: (context, action) =>
                        const WorkoutHistoryScreen()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
