import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Shared/FireBase/firebase_functions.dart';
import '../../models/workout_model.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController workoutNameController = TextEditingController();

  TextEditingController workoutComponentController = TextEditingController();

  TextEditingController workoutNumOfSetsController = TextEditingController();

  TextEditingController workoutNumOfRepsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Workout Tracker",
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
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Workout Name";
                    }
                    return null;
                  },
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                  controller: workoutNameController,
                  decoration: InputDecoration(
                    label: Text(
                      "Enter Workout Name",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 16.sp),
                    ),
                    constraints: BoxConstraints(maxWidth: 200.w),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    hintStyle: GoogleFonts.inter(
                        color: const Color(0xffA9A9A9).withOpacity(.61),
                        fontWeight: FontWeight.w400,
                        fontSize: 20.sp),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Workout Components";
                    }
                    return null;
                  },
                  minLines: 1,
                  maxLines: 3,
                  // 10
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                  controller: workoutComponentController,
                  decoration: InputDecoration(
                    label: Text(
                      "Enter Workout Components",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 16.sp),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    hintStyle: GoogleFonts.inter(
                        color: const Color(0xffA9A9A9).withOpacity(.61),
                        fontWeight: FontWeight.w400,
                        fontSize: 20.sp),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Enter Number Of Sets",
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp),
                  controller: workoutNumOfSetsController,
                  decoration: InputDecoration(
                    constraints:
                        BoxConstraints(maxHeight: 30.h, maxWidth: 60.w),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    labelText: "",
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Enter Number Of Reps",
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp),
                  controller: workoutNumOfRepsController,
                  decoration: InputDecoration(
                    constraints:
                        BoxConstraints(maxHeight: 30.h, maxWidth: 60.w),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        WorkoutModel workoutModel = WorkoutModel(
                            workoutName: workoutNameController.text,
                            workoutComponents: workoutComponentController.text,
                            numOfSets: workoutNumOfSetsController.text,
                            numOfReps: workoutNumOfRepsController.text,
                            date: DateTime.now().millisecondsSinceEpoch);
                        FirebaseFunctions.addWorkout(workoutModel);
                        Navigator.pop(context);
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.blue),
                        fixedSize: MaterialStatePropertyAll(Size(200.w, 50.h)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)))),
                    child: Text(
                      "Add Workout!",
                      style: TextStyle(fontSize: 18.sp, color: Colors.black),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
