import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Shared/FireBase/firebase_functions.dart';
import '../../models/meal_model.dart';
import 'meal_item.dart';

class MealTrackerScreen extends StatefulWidget {
  const MealTrackerScreen({super.key});

  @override
  State<MealTrackerScreen> createState() => _MealTrackerScreenState();
}

class _MealTrackerScreenState extends State<MealTrackerScreen> {

  var formKey = GlobalKey<FormState>();
  TextEditingController mealNameController = TextEditingController();
  TextEditingController mealComponentController = TextEditingController();

  // How Can I fix the issue when added multiple lines with the TextFormField? There is always an overflowed widgets

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
        padding: const EdgeInsets.all(16.0),
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
                height: 18.h,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Meal Components";
                  }
                  return null;
                },
                minLines: 1,
                maxLines: 3, // 10
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
                height: 30.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // var time= ;
                      MealModel mealModel = MealModel(
                          mealName: mealNameController.text,
                          mealComponents: mealComponentController.text,
                          date: DateTime.now().millisecondsSinceEpoch
                          );
                      FirebaseFunctions.addMeal(mealModel);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                    fixedSize:  MaterialStatePropertyAll(Size(200.w,40.h)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)))),
                  child: Text(
                    "Add Meal!",
                    style: TextStyle(fontSize: 18.sp,color: Colors.black),
                  )),
              SizedBox(height: 20.h ,),
              ElevatedButton(
                  onPressed: () {
                      FirebaseFunctions.deleteMealHistory();
                  },
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Colors.red),
                    fixedSize:  MaterialStatePropertyAll(Size(200.w,40.h)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)))),
                  child: Text(
                    "Delete All History",
                    style: TextStyle(fontSize: 18.sp,color: Colors.black),
                  )),
              SizedBox(height: 20.h ,),
              StreamBuilder(
                stream: FirebaseFunctions.getMeal(),
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
                  List<MealModel> meals =
                      snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return MealItem(mealModel: meals[index]);
                      },
                      itemCount: meals.length,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
