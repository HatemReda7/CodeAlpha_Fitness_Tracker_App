import 'package:codealpha_fitness_tracker_app/pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Provider/my_provider.dart';

class StepsDetailsScreen extends StatefulWidget {
  StepsDetailsScreen({super.key});

  @override
  State<StepsDetailsScreen> createState() => _StepsDetailsScreenState();
}

class _StepsDetailsScreenState extends State<StepsDetailsScreen> {
  TextEditingController stepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Steps Tracker",style: GoogleFonts.poppins(
            fontSize: 22.sp, fontWeight: FontWeight.w500),),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_rounded,size: 22.sp,)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              height: 80.h,
              width: 200.w,
              child: Text(
                "2064 / ${pro.stepsCounter} steps",
                style: GoogleFonts.poppins(
                    fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter your target steps",
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (value) {
                        pro.changeSteps(stepController.text);
                        stepController = TextEditingController();
                      },
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp),
                      controller: stepController,
                      decoration: InputDecoration(
                        constraints:
                            BoxConstraints(maxHeight: 30.h, maxWidth: 150.w),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38)),
                        errorBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38)),
                        hintText: "",
                        hintStyle: GoogleFonts.inter(
                            color: Colors.black.withOpacity(.61),
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              height: 40.h,
              width: 250.w,
              child: Text(
                "Reset Steps",
                style: GoogleFonts.poppins(
                    fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
