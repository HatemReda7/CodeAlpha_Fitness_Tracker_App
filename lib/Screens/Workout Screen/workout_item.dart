import 'package:codealpha_fitness_tracker_app/Shared/FireBase/firebase_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/workout_model.dart';

class WorkoutItem extends StatelessWidget {
  WorkoutModel workoutModel;
  WorkoutItem({required this.workoutModel,super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.all(16.r),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r),color: Colors.blueGrey),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(workoutModel.workoutName,style: GoogleFonts.poppins(
                  fontSize: 18.sp, fontWeight: FontWeight.w700),),
              SizedBox(height: 10.h,),
              Text(workoutModel.workoutComponents,style: GoogleFonts.poppins(
                  fontSize: 16.sp, fontWeight: FontWeight.w500),),
              SizedBox(height: 10.h,),
              Text("Number Of Sets:    ${workoutModel.numOfSets}",style: GoogleFonts.poppins(
                  fontSize: 16.sp, fontWeight: FontWeight.w500),),
              SizedBox(height: 10.h,),
              Text(
                "Number Of Reps:   ${workoutModel.numOfReps}",style: GoogleFonts.poppins(
                  fontSize: 16.sp, fontWeight: FontWeight.w500),),
              SizedBox(height: 10.h,),
              Text(DateTime.fromMillisecondsSinceEpoch(workoutModel.date).toString().substring(0,16),style: GoogleFonts.poppins(
                  fontSize: 14.sp, fontWeight: FontWeight.w400),),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              // IconButton(onPressed: () {
              //   FirebaseFunctions.deleteWorkout(workoutModel.id);
              // }, icon: Icon(Icons.edit,size: 25.sp,)),
              IconButton(onPressed: () {
                FirebaseFunctions.deleteWorkout(workoutModel.id);
              }, icon: Icon(Icons.delete,size: 30.sp,))
            ],
          )
        ],
      ),
    );
  }
}
