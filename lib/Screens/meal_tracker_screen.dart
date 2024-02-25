import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MealTrackerScreen extends StatefulWidget {
  const MealTrackerScreen({super.key});

  @override
  State<MealTrackerScreen> createState() => _MealTrackerScreenState();
}

class _MealTrackerScreenState extends State<MealTrackerScreen> {

  var formKey = GlobalKey<FormState>();
  TextEditingController mealNameController = TextEditingController();
  TextEditingController mealComponentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Tracker",style: GoogleFonts.poppins(
            fontSize: 22.sp, fontWeight: FontWeight.w500),),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_rounded,size: 22.sp,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Meal Name";
                  }
                  return null;
                },
                style: GoogleFonts.inter(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp),
                controller: mealNameController,
                decoration: InputDecoration(
                  label: Text(
                    "Enter Meal Name",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp),
                  ),
                  constraints:
                  BoxConstraints(maxWidth: 200.w),
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
                height: 30.h,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Meal Components";
                  }
                  return null;
                },
                minLines: 1,
                maxLines: 10,
                style: GoogleFonts.inter(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp),
                controller: mealComponentController,
                decoration: InputDecoration(
                  label: Text(
                    "Enter Meal Components",
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
                height: 50.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    // if (formKey.currentState!.validate()) {
                    //   MealModel mealModel = MealModel(
                    //       mealName: mealNameController.text,
                    //       mealComponents: mealComponentController.text,
                    //       date: DateTime.now().millisecondsSinceEpoch);
                    //   // FirebaseFunctions.addMeal(mealModel);
                    // }
                  },
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                    fixedSize:  MaterialStatePropertyAll(Size(200.w,40.h)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)))),
                  child: Text(
                    "Add Meal!",
                    style: TextStyle(fontSize: 18.sp,color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
