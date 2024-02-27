import 'package:codealpha_fitness_tracker_app/Shared/FireBase/firebase_functions.dart';
import 'package:codealpha_fitness_tracker_app/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MealItem extends StatelessWidget {
  MealModel mealModel;
  MealItem({required this.mealModel,super.key});



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.all(16.r),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r),color: Colors.grey),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(mealModel.mealName,style: GoogleFonts.poppins(
                  fontSize: 18.sp, fontWeight: FontWeight.w700),),
              SizedBox(height: 5.h,),
              Text(mealModel.mealComponents,style: GoogleFonts.poppins(
                  fontSize: 16.sp, fontWeight: FontWeight.w500),),
              SizedBox(height: 5.h,),
              Text(DateTime.fromMillisecondsSinceEpoch(mealModel.date).toString().substring(0,16),style: GoogleFonts.poppins(
                  fontSize: 14.sp, fontWeight: FontWeight.w400),),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              // IconButton(onPressed: () {
              //   FirebaseFunctions.deleteMeal(mealModel.id);
              // }, icon: Icon(Icons.edit,size: 25.sp,)),
              IconButton(onPressed: () {
                FirebaseFunctions.deleteMeal(mealModel.id);
              }, icon: Icon(Icons.delete,size: 25.sp,))
            ],
          )
        ],
      ),
    );
  }
}
