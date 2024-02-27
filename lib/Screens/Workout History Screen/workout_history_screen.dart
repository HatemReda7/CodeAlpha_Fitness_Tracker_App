import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Shared/FireBase/firebase_functions.dart';
import '../../models/workout_model.dart';
import 'workout_item.dart';

class WorkoutHistoryScreen extends StatelessWidget {
  const WorkoutHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Workout History",
          style:
          GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_rounded,
              size: 22.sp,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0.r),
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFunctions.getWorkout(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(
                      child: Text(
                        "Something went wrong",
                        style: TextStyle(color: Colors.white),
                      ));
                }
                List<WorkoutModel> workouts =
                    snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return WorkoutItem(workoutModel: workouts[index]);
                    },
                    itemCount: workouts.length,
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.all(18.0.r),
              child: ElevatedButton(
                  onPressed: () {
                    FirebaseFunctions.deleteWorkoutHistory();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                      const MaterialStatePropertyAll(Colors.red),
                      fixedSize: MaterialStatePropertyAll(Size(200.w, 50.h)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)))),
                  child: Text(
                    "Delete All History",
                    style: TextStyle(fontSize: 18.sp, color: Colors.black),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
